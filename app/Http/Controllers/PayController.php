<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Pay;
use EasyWeChat\Factory;

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
        $app = \EasyWeChat::payment();
        $result = $app->order->unify([
            'body' => '腾讯充值中心-QQ会员充值',
            'out_trade_no' => time(),
            'total_fee' =>1,
            'trade_type' => 'JSAPI',
            'openid' => $user->id,
         ]);
        $jssdk = $app->jssdk;
        $json = $jssdk->bridgeConfig($result['prepay_id']);
        return view('pay',['result' => $json]);
    }
    public function notify(){
        $pay = Pay::wechat();
        try{
            $data = $pay->verify();
            
        }catch(\Exception $e){

        }
        return $pay->success();
    }
}
