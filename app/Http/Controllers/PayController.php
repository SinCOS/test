<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Pay;
use EasyWeChat\Factory;
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
    public function notify(){
        $app = \EasyWeChat::payment();
        $response = $app->handlePaidNotify(function ($message, $fail) {
                $order = Order::where('no','=',$message['']);
                return true;
                // 或者错误消息
                return   $fail('Order not exists.');
        });
        return $response;
    }
}
