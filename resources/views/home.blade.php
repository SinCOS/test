<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>众安金融</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no,email=no" />
    <meta name="apple-touch-fullscreen" content="yes" />
    <meta name="HandheldFriendly" content="true"/>
    <meta name="author" content=""/>
    <meta name="url" content=""/>
    <link rel="stylesheet" href="/app/css/web.css">
    <link rel="stylesheet" href="/app/css/style.css">
    <link rel="stylesheet" media="screen and (max-width:325px)"  href="/app/css/min.css">
    <link rel="stylesheet" media="screen and (min-width:760px)"  href="/app/css/max.css">
    <!-- zepto 库 -->
    <script type="text/javascript" src="/app/js/zepto.js"></script>
    <script src="/app/js/jweixin-1.0.0.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/app/css/active.css">
</head>
<body class="web bmargin">
<!-- header start -->
<header>
    <div class="banner">
          <div id="slider" class="swipe">
                    <ul class="swipe-wrap">
                        @foreach($banner as $item)
                       
                             <li>
                                    <a href="{{ $item->link }}">
                                     <img src="/uploads/{{ $item->pic }}">
                                      </a>
                             </li>
                        @endforeach
                   </ul>
                <ul class="slide-trigger">
                    @foreach($banner as $item)
                    <li></li>
                    @endforeach
                </ul>
          </div>
    </div>
</header>

<article>

    <div class="first-title">
        <p> <span></span>
            测试信息
        </p>
        <h2>推荐借款</h2>
    </div>


    <div class="proList">

        @foreach ($dc as $item)
            
        
        <a href="{{route('detail',['id'=>$item->id])}}">
            <div class="plist clearfix">
                <div class="pleft">
                    <em>奖1%</em>
                    <em class="dxb">VIP</em>
                    <h2><big>{{$item->ll}}</big>% <i style="display: none;">+1</i></h2>
                    <p>借款期限：{{$item->jkqx or 0}}个月</p>
                </div>
                <div class="pright">
                        <em class="em"></em>
                        <h3 class="fangdai">{{$item->dyxx}}</h3>
                        <p>借款金额：<big>{{$item->jkje or 0}}元</big></p>
                        <!--<em style="color:#C1CDCD;"><还款中></em>-->
                        <em><投标中></em>
                        <div class="profirst">
                            <div class="progress">
                                <div class="pro-inter" style="width:0%;"></div>
                            </div>
                            <div class="pro-data">0%</div>
                        </div>
                </div>
            </div>
        </a>
        @endforeach

    </div>

</article>


<!--active 框-->
<div class="mask active_box" style="display:none;">
    <div class="tan_box">
        <img class="tan_close" data-id="close" src="picture/error.png" alt="">
    </div>
    <div class="tan_content">
        <div class="tanwei_bg">
            <img class="weixin_1" src="picture/weitan_0.png" alt="">
        </div>
        <a  class="tan_btn" href="/turntables/toTurntableActive"><img src="picture/weixin_btn2.png" alt=""></a>
    </div>
</div>






<nav>
    <ul class="nav_list clearfix">
        <li class="child01 action" ><a href="{{ url('/') }}"><span></span>首页</a></li>
        <li class="child06 "><a href='/apply'><span></span><br>我要贷款</a></li>
        <li class="child04 " ><a href="{{ url('/home')}}"><span></span>我的</a></li>
    </ul>
</nav>




<script type="text/javascript" src="/app/js/swipe.js"></script><!-- touch 插件 -->
<script type="text/javascript" src="/app/js/appgesturepassword.js"></script>

<script>
    var slider = $('#slider');
    slider.find(".slide-trigger").find("li").eq(0).addClass("cur");
    var mySwipe = new Swipe(document.getElementById('slider'), {
        speed: 400,
        auto: 5000,
        callback: function(index, elem) {
            slider.find(".slide-trigger").find("li").eq(index).addClass("cur").siblings().removeClass("cur");
        }
    });

    window.onload=function(){
        $("#nh_modal2").click(function(){
            $(".newhand").removeClass('newhand_modal');
            $("#nh_modal2,#nh_modal").hide();
        });
    };

    function saveStorage(str){
        var message = localStorage.getItem('message');
        if(message == null){
            $(".newhand").addClass('newhand_modal');
            $("#nh_modal,#nh_modal2").show();

            localStorage.setItem('message',str);

        }
    }
</script>

</body>
</html>