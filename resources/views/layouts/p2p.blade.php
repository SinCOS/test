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
 @yield('content')




<nav>
    <ul class="nav_list clearfix">
        <li class="child01 action" ><a href="{{ url('/') }}"><span></span>首页</a></li>
        <li class="child06 "><a href="#"><span></span><br>我要贷款</a></li>
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