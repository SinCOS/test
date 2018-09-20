<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Pay;
use EasyWeChat\Factory;

class PayController extends Controller
{
    public function pay($openid){
        $config = [
            'oauth' => [
                'scopes' => ['snsapi_userinfo'],
                'callback' => '/oauth_callback'
            ]
            ];
        $order = [
            'out_trade_no' => time(),
            'total_fee' => 1,
            'body' => '测试商品',
            //'openid' => $openid
        ];
        $result = Pay::wechat()->wap($order);
        return $result;
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
