<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Pay;
use EasyWeChat\Factory;
use Carbon\Carbon;
use App\Order;
class PayController extends Controller
{
    public function pay(){
        $user = session('wechat.oauth_user.default'); // 拿到授权用户资料
        // $order = [
        //     'out_trade_no' => time(),
        //     'total_fee' => 1,
        //     'body' => '测试商品',
        //     'openid' => $user->id
        // ];
        // $result = Pay::wechat()->mp($order);
        $order = Order::create([
            'uid' => \Auth::user()->id,
            'total_fee' => 3000,
            'status' => 0,
        ]);
        $app = \EasyWeChat::payment();
        $result = $app->order->unify([
            'body' => 'VIP会员费',
            'out_trade_no' => $order->no,
            'total_fee' =>$order->total_fee * 100,
            'trade_type' => 'JSAPI',
            'openid' => $user->id,
         ]);
        $jssdk = $app->jssdk;
        $json = $jssdk->bridgeConfig($result['prepay_id']);
        return view('pay',['result' => $json]);
    }
    public function queryOrder($orderNo){
        $app = \EasyWeChat::payment();
        return $app->order->queryByOutTradeNumber($orderNo);
    }
    public function notify(){
        $app = \EasyWeChat::payment();
        $response = $app->handlePaidNotify(function ($message, $fail) {
                $order = Order::where('no','=',$message['']);
                if(!$order || $order->paid_at ) {return true;}
                $order->update([
                    'paid_at' => Carbon::now(),
                    'payment_no' => $message['transaction_id'],
                    'status' => 1
                ]);
                $order->user->update(['vip' => 1]);
                return   $fail('Order not exists.');
        });
        return $response;
    }
}
