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
            'total_fee' => 0.01,
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
        $order = Order::where('no','=',$orderNo)->first();
        $user = $order->user()->first();
        $user->update(['vip' => 0]);
        return $user;
        return $app->order->queryByOutTradeNumber($orderNo);
    }
    public function notify(){
        file_put_contents(storage_path('logs/pay.log'),file_get_contents('php://input'));
        $app = \EasyWeChat::payment();
        $response = $app->handlePaidNotify(function ($message, $fail)use($app) {
                $order = Order::where('no','=',$message['out_trade_no']);
                 if(!$order || $order->paid_at || $order->status == 1) {return true;}
              
                if($message['return_code'] == 'SUCCESS'){
                    $result = $app->order->queryByOutTradeNumber($order->no);
                    if($reuslt->result_code == $message['result_code'] && $message['result_code'] == 'SUCCESS'){

                        
                    \DB::beginTransaction();
                    try{
                        $order->update([
                                'paid_at' => Carbon::now(),
                                'payment_no' => $message['transaction_id'],
                                'status' => 1
                            ]);
                        $user = $order->user();
                        $user->update(['vip' => 1]);
                        \DB::commit();
                    }catch(\Illuminate\Database\QueryException $ex){
                            \DB::rollback();
                            return $fail('fail');
                    }
                        return true;
                    }
                   
                    
                }
                
                return   $fail('Order not exists.');
        });
        return $response;
    }
}
