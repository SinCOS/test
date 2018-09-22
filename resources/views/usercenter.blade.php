<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="keywords" content="" />
    <title>个人中心</title>
    <link href="/app/css/main_user.css" rel="stylesheet" type="text/css">
    <link href="/app/css/sweetalert.css" rel="stylesheet" type="text/css">

    <link href="/app/css/main.css" rel="stylesheet" type="text/css">
    <link href="/app/css/wap_books.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="laymain">
    <!--top-->
    <div class="wp_top_index">
        <a href="/" class="wp_fl">首页</a>
        <span class="s1">个人中心</span>
        {{-- <a href="javascript:;">记录</a> --}}

    </div>
    <div class="au_top">
        <div class="au_t_bg"><img src="/app/images/top.png"></div>
        <div class="au_t_nav">
            <ul>
                <li><span class="s1">{{$user->money}}元</span><em>账户余额</em></li>
            </ul>
        </div>
        <div class="au_t_po">
            <p></p>
            <ul>
                <li><a class="a1" href="javascript:void(0)#"><img src="{{$user->avatar}}"></a></li>
                <li><span class="s1">{{$user->name}}<img src="/app/images/k_01.png"></span><span>当前等级:{{ $vip == true ? '超级会员' : '普通会员' }}</span></li>
            </ul>
        </div>
    </div>
    <!--top-->
    <!--au_txt-->
    <div class="au_txt">
        <ul>
            @if (!$vip)
                <li>
                    <span>开通VIP，享受平台最高服务。点击开通VIP特权！</span><a href="/pay/vip">立即开通</a>
                </li>
            @endif
            @if (!$isStatus)
                 <li>
                         <span>点击进入信息编辑页面补充个人资料，所填信息务必确保真实性，以便审核员复核个人信息。</span><a href="{{route('apply')}}">我要借款</a>
                </li>
            @endif
           

        </ul>
    </div>


    <div class="au_inlist">
        <ul>
            <li><a href="javascript:;"><img src="/app/images/my_icon01.png">账户余额<span>{{$user->money}}元</span></a></li>
            <li style="display:none;"><a href=""><img src="/app/images/home_myClick.png">VIP特权<span>点击查看VIP特权</span></a></li>
        </ul>
    </div>

    <div class="mgt10"></div>
    <!--au_inlist-->
    <div class="au_inlist">
        <ul>

            <li><a href="tel:0573-83980959"><img src="/app/images/home_serviceClick.png">联系平台<span></span></a></li>
        </ul>
    </div>
    <!--au_inlist-->
    <div class="mgt10"></div>


    <div class="au_inlist">
        <ul>

        </ul>
    </div>

    <div class="mgt10"></div>

    <div class="list1">
        <div class="wp_foot">
            <p><a href="javascript:;">版权所有</a> | <a href="javascript:;">客户端</a></p>
        </div>
    </div>
</div>
</body>
</html>