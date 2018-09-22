<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{$detail->dyxx}}</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="format-detection" content="telephone=no,email=no"/>
    <meta name="apple-touch-fullscreen" content="yes"/>
    <meta name="HandheldFriendly" content="true"/>
    <meta name="author" content=""/>
    <meta name="url" content=""/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <link rel="stylesheet" href="/app/css/web.css">
    <link rel="stylesheet" href="/app/css/style.css">
    <link rel="stylesheet" media="screen and (max-width:325px)"  href="/app/css/min.css">
    <link rel="stylesheet" media="screen and (min-width:760px)"  href="/app/css/max.css">

    <!-- zepto 库 -->
    <script type="text/javascript" src="/app/js/zepto.js"></script>
    <script src="/app/js/jweixin-1.0.0.js" type="text/javascript"></script>

    <script type="text/javascript">
        var rootPath = '';
        function getDateStr(date, num, ymd) {
            var now = null;
            if (typeof(date) == 'undefined' || date == null) {
                now = new Date();
            }
            else {
                now = date;
            }
            var yy = now.getFullYear();//getYear();
            if (ymd == "yy" && num != null && num != "") {
                yy = yy + num;
            }
            if (ymd == "mm" && num != null && num != "") {
                now.setMonth(now.getMonth() + num);
            }
            if ((ymd == null || ymd == "dd") && num != null && num != "") {
                now.setDate(now.getDate() + num);
            }
            var dd = now.getDate();
            if (dd < 10) dd = "0" + dd;
            var mm = now.getMonth() + 1;
            if (mm < 10) mm = "0" + mm;
            var currdate = now.getFullYear() + "-" + mm + "-" + dd;
            return currdate;
        }

        function formatNum(num, digit) //将数字转换成三位逗号分隔的样式
        {
            if (!/^(\+|-)?(\d+)(\.\d+)?$/.test(num)) {
                //alert("wrong!");
                return num;
            }
            var a = RegExp.$1, b = RegExp.$2, c = RegExp.$3;
            var re = new RegExp().compile("(\\d)(\\d{3})(,|$)");

            while (re.test(b)) b = b.replace(re, "$1,$2$3");
            if (c && digit && new RegExp("^.(\\d{" + digit + "})(\\d)").test(c)) {
                if (RegExp.$2 > 4) c = (parseFloat(RegExp.$1) + 1) / Math.pow(10, digit);
                else c = "." + RegExp.$1;
            }

            if (!c) {
                c = 0.00;
                c = parseFloat(c).toFixed(digit);
            }
            if ((c + "").indexOf(".") != 0) {
                c = parseFloat(c).toFixed(digit);
            }

            return a + "" + b + "" + (c + "").substr((c + "").indexOf("."));
        }
        //格式化时间
        function dateTimeFormatter(val) {

            if (val == undefined || val == "")
                return "";
            var date;
            if (val instanceof Date) {
                date = val;
            } else {
                date = new Date(val);
            }
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            var d = date.getDate();

            var h = date.getHours();
            var mm = date.getMinutes();
            var s = date.getSeconds();

            var dateStr = y + '-' + (m < 10 ? ('0' + m) : m) + '-'
                    + (d < 10 ? ('0' + d) : d);
            var TimeStr = h + ':' + (mm < 10 ? ('0' + mm) : mm) + ':'
                    + (s < 10 ? ('0' + s) : s);

            return dateStr + ' ' + TimeStr;
        }
        //弹出框
        function clean() {
            alart.style.display = "none";
        }
        ;
        //还原小数
        function rmoney(s) {
            return parseFloat(s.replace(/[^\d\.-]/g, ""));
        }
        //格式化金额
        function fmoney(s, n) {
            n = n > 0 && n <= 20 ? n : 2;
            s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
            var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
            t = "";
            for (i = 0; i < l.length; i++) {
                t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
            }
            return t.split("").reverse().join("") + "." + r;
        }
    </script>
    <link rel="stylesheet" href="/app/css/fsgallery.css">

    <style>
        .tab-prov{
            -moz-column-width:50%;
            -moz-column-count:2;
            -webkit-column-width:50%;
            -webkit-column-count:2;
            column-width:50%;
            column-count:2;
        }
        .tab-prov .provGroup{text-align: center;display:inline-block;}
        .tab-prov img{ width:90%;}
        #emInfo{display: block; width: 100%; line-height: 1.2rem; color: red; text-indent: 6.9rem; text-align: left;}
    </style>

</head>
<body>


<h2 class="head clearfix h_back" style="display: none;" id="navi">
    <a class="back" href="javascript:history.back(-1);">返回</a>
</h2>
<h3 class="headbottom" id="navih3" style="display: none;"></h3>
<script>
    function isWeiXin(){
        var ua = window.navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i) == 'micromessenger'){
            return true;
        }else{
            return false;
        }
    }

    //var bForcepc = fGetQuery("dv") == "pc";
    function fBrowserRedirect(){
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
        var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
        var bIsMidp = sUserAgent.match(/midp/i) == "midp";
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
        var bIsAndroid = sUserAgent.match(/android/i) == "android";
        var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
        var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
//        var browser = {
//            versions: function () {
//                var u = navigator.userAgent, app = navigator.appVersion;
//                return {//移动终端浏览器版本信息
//                    trident: u.indexOf('Trident') > -1, //IE内核
//                    presto: u.indexOf('Presto') > -1, //opera内核
//                    webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
//                    gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
//                    mobile: !!u.match(/AppleWebKit.*Mobile/i) || !!u.match(/MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/), //是否为移动终端
//                    ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
//                    android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
//                    iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
//                    iPad: u.indexOf('iPad') > -1, //是否iPad
//                    webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
//                };
//            } (),
//            language: (navigator.browserLanguage || navigator.language).toLowerCase()
//        }
//        console.log(browser.versions);
        //alert(bIsIpad+" "+bIsIphoneOs+" "+bIsAndroid);
        if(bIsIpad){
            if(!isWeiXin()){
                $("#navi").show();
                $("#navih3").show();
                if($("#ios").length && $("#ios").length>0){
                    $("#ios").show();
                }
            }else{
                if($("#aHandpwdMsg").length && $("#aHandpwdMsg").length>0){
                    $("#aHandpwdMsg").hide();
                }
                if($("#isWeixin").length && $("#isWeixin").length>0){
                    $("#isWeixin").val(true);
                }
            }
        }
        if(bIsIphoneOs){
            if(!isWeiXin()){
                $("#navi").show();
                $("#navih3").show();
                if($("#iosDiv").length && $("#iosDiv").length>0){
                    $("#iosDiv").show();
                }
            }else{
                if($("#aHandpwdMsg").length && $("#aHandpwdMsg").length>0){
                    $("#aHandpwdMsg").hide();
                }
                if($("#isWeixin").length && $("#isWeixin").length>0){
                    $("#isWeixin").val(true);
                }
            }
        }
        if(bIsAndroid){
            if(!isWeiXin()){
                if($("#androidDiv").length && $("#androidDiv").length>0){
                    $("#androidDiv").show();
                }
            }else{
                if($("#aHandpwdMsg").length && $("#aHandpwdMsg").length>0){
                    $("#aHandpwdMsg").hide();
                }
                if($("#isWeixin").length && $("#isWeixin").length>0){
                    $("#isWeixin").val(true);
                }
            }
        }
        if(bIsMidp||bIsUc7||bIsUc||bIsCE||bIsWM){

        }

    }

    $(function(){
        fBrowserRedirect();
    });
</script>
</body>
</html>
<!-- detail start -->
<div class="detail">

    <!-- content start -->
    <div class="content">


        <h3 class="head head-fangdai">




           {{$detail->dyxx}}

        </h3>
        <!-- data start -->
        <div class="data clearfix">

                <span>利率：<em
                        class="red"><big>{{$detail->ll}}+1</big>%</em></span>
            <span>借款期限：<em>{{$detail->jkqx}}个月</em></span>
            <span>借款金额：<em>{{$detail->jkje}}元</em></span>
            <span>起投金额：<em>100元</em></span>
            <span>可投金额：<em class="blue">{{$detail->jkje}}元</em></span>
			<span>进度
	            <div class="progress">
                    <div class="pro-inter" style="width:0%;"></div>
                </div>
	            0%
		    </span>
        </div>
        <!-- data start -->

        <!-- tablist start -->
        <div class="tablist">
            <!-- tab-head start -->
            <div class="tab-head chearfix">
                <ul>
                    <li class="action" data-id="tab-desc" id="tabli">借款描述</li>
                    <li data-id="tab-borrow">借款人信息</li>

                    <li data-id="tab-press">抵押信息</li>

                    <li data-id="tab-prov">认证&证明</li>
                </ul>
            </div>
            <!-- tab-head end -->

            <!-- tab-list start -->
            <div class="tab-list">
                <!-- tab start -->
                <div class="tab tab-desc" id="tab-desc">
                    <p class="title">抵押信息：
                        {{$detail->dyxx}}
                    
                    </p>
                    <p class="title">还款方式：
                        {{$detail->hkfs}}
                      
                    </p>
                    <p class="title">借款描述：</p>
                    <p class="context">
                        {{$detail->jkms}}
                    </p>
                </div>
                <!-- tab end -->

                <!-- tab start -->
                <div class="tab tab-borrow" id="tab-borrow" style="display:none">
                    <p class="title">性别：
                        {{$detail->sex}}
                       
                    </p>
                    <p class="title">婚姻状况：
                        {{$detail->hyzk}}
                    </p>
                    <p class="title">最高学历：
                        {{$detail->zgxl}}
                    </p>
                    <p class="title">
                        现居住地：{{$detail->address}}</p>
                    <p class="title">月均收入：{{$detail->yjsr}}.00元</p>
                    <p class="title">年均收入：{{$detail->njsr}}.00元</p>
                </div>
                <!-- tab end -->

                <!-- tab start -->

                <div class="tab tab-press" id="tab-press" style="display:none">
                    <p class="title">抵押物类型：
                        一抵
                    </p>
                    <p class="title">
                        房屋地址：暂未公示</p>
                    <p class="title">房屋面积：73.00平方米</p>
                    <p class="title">总评估值：19.00
                        万元</p>
                    <p class="title">市值：29.00万元</p>
                    <p class="title">抵押物说明：</p>
                    <p class="context">抵押物为南海省木斯市一套73.55㎡房产,房屋为一抵。房屋精装修，朝向及物业环境均佳。
                    </p>
                </div>




                <!-- tab end -->

                <!-- tab start -->
                <div class="tab tab-prov clearfix" id="tab-prov" style="display:none">


                    <div class="provGroup">
                        <a href="/uploads/{{$detail->sfzf}}">
                            <img src="/uploads/{{$detail->sfzf}}" alt="">
                        </a>
                        <p>身份证反面</p>
                    </div>



                    <div class="provGroup">
                        <a href="/uploads/{{$detail->sfzz}">
                            <img src="/uploads/{{$detail->sfzz}}" alt="">
                        </a>
                        <p>身份证正面</p>
                    </div>



                    <div class="provGroup">
                        <a href="/uploads/{{$detail->fcz}}">
                            <img src="/uploads/{{$detail->fcz}}" alt="">
                        </a>
                        <p>房本</p>
                    </div>



                    <div class="provGroup">
                        <a href="/uploads/{{$detail->hkb}}">
                            <img src="/uploads/{{$detail->hkb}}" alt="">
                        </a>
                        <p>户口本</p>
                    </div>



                    <div class="provGroup">
                        <a href="/app/picture/demo.jpg">
                            <img src="/app/picture/demo.jpg" alt="">
                        </a>
                        <p>借款抵押合同3</p>
                    </div>



                    <div class="provGroup">
                        <a href="/app/picture/demo.jpg">
                            <img src="/app/picture/demo.jpg" alt="">
                        </a>
                        <p>借款抵押合同1</p>
                    </div>



                    <div class="provGroup">
                        <a href="/app/picture/demo.jpg">
                            <img src="/app/picture/demo.jpg" alt="">
                        </a>
                        <p>借款抵押合同2</p>
                    </div>



                    <div class="provGroup">
                        <a href="/uploads/{{$detail->jsz}}">
                            <img src="/uploads/{{$detail->jsz}}" alt="">
                        </a>
                        <p>驾驶证</p>
                    </div>



                    <div class="provGroup">
                        <a href="/uploads/{{$detail->xsz}}">
                            <img src="/uploads/{{$detail->xsz}}" alt="">
                        </a>
                        <p>行驶证</p>
                    </div>



                    <div class="provGroup">
                        <a href="/app/picture/demo.jpg">
                            <img src="/app/picture/demo.jpg" alt="">
                        </a>
                        <p>室内2</p>
                    </div>



                    <div class="provGroup">
                        <a href="/app/picture/demo.jpg">
                            <img src="/app/picture/demo.jpg" alt="">
                        </a>
                        <p>室内1</p>
                    </div>


                </div>
                <!-- tab end -->
            </div>
            <!-- tab-list end -->

        </div>
        <!-- tablist start -->

    </div>
    <!-- content end -->
</div>
<!-- detail end -->

<style>
    .dingpwd{ margin-top: .5rem;}

    .newhand .pgroup{ font-weight: bold; padding-top: 38%; }
    .newhand .pgroup p{font-size: .8rem; line-height: 1.3rem; letter-spacing: 2px; text-align: center; color: white; }
    .newhand .pgroup p em.yellow{ color: #ffe49c; }

    .newhand .context{ background: url() no-repeat; background-size: 100%; width: 100%; position: relative; }
    .newhand .context img{ width: 100%; position: absolute; top: 0;left: 0; z-index: -1; }
    .newhand .btngroup{ margin-top: 5px; }
    .newhand .btngroup{text-align: center;}
    .newhand .btngroup .yellow{ background: #2c6499; margin-right: 5px; }
    .newhand .btngroup .blue{ background: #ffb734;  margin-left: 5px; }
    .newhand .btngroup .btn{ display: inline-block; float: none; text-align: center; color: white; height: 25px; line-height: 25px; border-radius: 8px; border: 1px solid white; font-size: 12px; width: 35%; padding:0 5px;}
</style>






<!--<div class="floatW clearfix" id="dxbnologin" style="display: none;">-->
    <!--<div class="inputGroup regisSuccess clearfix">-->
        <!--<p class="text-center">此标的为定向标,需验证登录信息<a href="/user/toLogin?flag=2914" class="btn btnWhite">请登录</a></p>-->
    <!--</div>-->
<!--</div>-->


<!-- floatW start -->
<form id="lendForm" method="post" action="###" onsubmit="return moneyVail();">
    <input type="hidden" name="tijiao" value="yes"/>
    <input type="hidden" name="id" value="{$id}"/>
    <input type="hidden" id="token" name="token" value="debd8bdb-221f-4de2-8c9d-d6ab618f56b8"/>
    <input type="hidden" id="loanApplicationId" name="loanApplicationId"
           value="2914"/>
    <input type="hidden" id="oPaww" name="oPass" value="">

    <div class="floatW clearfix" id="dingdiv">
        <div class="inputGroup lblTip clearfix">
            <span>账户余额</span>

            <span><i>{{\Auth::user()->money}}</i>元</span>

        </div>
        <div class="inputGroup clearfix">
            <span>投标金额</span>
        <span><input type="tel" id="money" name="amount" value="" onblur="money_blur(this)" placeHolder="请输入金额"
                     class="ipt" onkeyup="yqshouyiOnKey()" oninput="checkTextLength(this , 9)"/>元</span>
            <em id="emInfo"></em>
            <em class="detailem"><span>投资收益</span><i id="yqsy">0.00元</i></em>
        </div>



        <a href="javascript:;" id="login" class="btn btnError" style="display:none">提交订单</a>


    </div>

</form>
<!-- floatW end -->
<div class="mask newhand newhand_flow"
     style="display: none;"  id="mytext">
    <div class="context animated fadeInDownBig">
        <img src="/app/picture/model.png" alt="">
        <div class="mask-cont">
            <div class="pgroup">
                <p>您已经是<em class="yellow">投资老手</em>！</p>
                <p>新手标不再适合您啦</p>
            </div>
            <div class="btngroup clearfix">
                <a href="javascript:void(0);" id="stillSkip" class="btn yellow">偏要看新手标</a>
                <a href="/finance/list" class="btn blue">寻找更适合的项目</a>
            </div>
        </div>
    </div>
</div>
<div class="mask tips" id="riskTip" style="display: none;">
    <div class="context animated fadeInDownBig">
        <div class="mask_title">提示</div>
        <div class="mask-cont">
            <div class="pgroup">
                <p>基于网贷监管需求，投资需进行风险评估</p>
            </div>
        </div>
        <div class="mask_bot">
            <a href="/person/toRiskGrade" style="margin-right: 0px;;" class="btn btnBlue" data-id='close'>立即评估</a>
        </div>
    </div>
</div>

<!-- 页面未完完全加载完成前弹窗 start -->
<div class="mask" id="detailtips" style="display:block">
    <div class="context animated fadeInDownBig" style="background: none; color: white; text-align:center;">
        <div class="mask-cont">
            <img class="img" src="/app/picture/loading17.gif" width="20px" alt="">
            加载中...
        </div>
    </div>
    </a>
</div>
<style>
    #detailtips .context{ position: absolute; top: 50%; width: 100%; margin-top: -1rem; background:none; color: white; text-align: center; vertical-align: middle; line-height: 2.5rem;}
    #detailtips .context img{vertical-align: middle;}
</style>
<script type="text/javascript">
    $(document).ready(function(){
        $("#detailtips").hide();
    })
</script>
<!-- 页面未完完全加载完成前弹窗 end -->

<script type="text/javascript" src="/app/js/ours.js"></script>
<script type="text/javascript" src="/app/js/form.js"></script>

<script>
    window.onpageshow = function(event) {
        if (event.persisted) {
            window.location.reload()
        }
    };

    var remain =93900;
    var loanApplicationId =2914;
    var startAmount = 100;

    $(function () {

        <!--水印图 预热中-->

        <!--水印图 已结清-->

        <!--水印图 满标-->

        <!--水印图 还款中-->








    });

    //调用不同倒计时方法
    var intDiff = parseInt(0);//倒计时总秒数量
    //年月日倒计时
    function timer(intDiff, DHtml) {

        var interval = window.setInterval(function () {
            var day = 0,
                    hour = 0,
                    minute = 0,
                    second = 0;//时间默认值
            if (intDiff > 0) {
                day = Math.floor(intDiff / (60 * 60 * 24));
                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (intDiff < 0) {
                clearTimeout(interval);
                $("#yureimg").attr("class", "");
                $("#yurediv").hide();
                $("#dingdiv").show();
                return;
            }

            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            DHtml.html('<big>' + day + "</big>天<big>" + hour + "</big>时<big>" + minute + '</big>分<big>' + second + '</big>秒');

            intDiff--;
        }, 1000);
    }

    //定向密码文本框触发事件
    $("#pasd").click(function(){
        $("#Okey").show();
    });
    $("#Okey").click(function(){
        var jude = exMsg($("#pasd"), true),
                mes = pub_exMsg(jude);

        if( mes !== "") {
            $(".flowem").html(mes);
        }else{
            //密码验证
            $.ajax({
                url:rootPath+"/finance/getPass",
                type:"post",
                data: {
                    "pass":$("#pasd").val(),
                    "loanApplicationId": $("#loanApplicationId").val()
                },
                success: function (data) {
                    $("#oPaww").val($("#pasd").val());
                    if(data=="sucess"){
                        $("#dinggroup").hide();
                        $("#dinggroup").siblings(".floatW").show();
                        $("#dingdiv").show();

                    }else if(data=="fail"){
                        $(".flowem").html("定向密码错误请重试");
                    }
                },error:function(data){
                    console.log("密码错误");
                    $(".flowem").html("定向密码错误或者没有登录请重试");
                }
            });
        }
    })

    //点击支付金额时支付按钮显示
    $("#money").click(function () {
        _tabli();


        document.getElementById("login").style.display = "block";

        $(".floatW em").show();
        $('BODY')[0].scrollTop=$('BODY')[0].scrollHeight;

    })

    //点击页面上任何一处，支付按钮隐藏
    function _hide() {
        $("#money").parent().parent().siblings("a").hide();
        $(".floatW em").hide();
    }

    $("body").click(function(i){
        var mytext = $(i.target).parents(".floatW").find(".inputGroup"),
                mytext2 = $(i.target).parents("#dingdiv")
        if(mytext.html() != $(".inputGroup").html()){
            if(!mytext2){
                _hide()
            }
        }
    })

    //金额文本框 blur事件
    function money_blur(_this) {
        var jude = judeMoney($("#money"), false);

        if ("3" == jude) {
            var inputMoney = $("#money").val();
            if (remain < inputMoney) {
                jude = 4;
            }
            if(parseFloat($("#money").val()) % 100!=0){
                jude = 2;
            }
        }

        var mes = pub_money(jude)

        if (mes !== "") {
            $("#emInfo").html(mes);
        } else {
            $("#emInfo").html("");
            yqsyCal($("#money").val());
        }
    }

    //支付按钮  click 事件
    $("#goToPay").click(function() {
        if($(this).attr('data-disp')!='true'){
            $(this).attr('data-disp','true');
            var inputMoney = $("#money").val();
            var jude = judeMoney($("#money"), true);
            if (jude == 3 && remain < inputMoney) {
                jude = 4;
            }
            if(jude == 3 && parseFloat($("#money").val()) % 100!=0){
                jude = 2;
            }
            var mes = pub_money(jude);
            if (mes != "") {
                $("#emInfo").html(mes);
                $(this).attr('data-disp','false');
                return false;
            }
            $("#lendForm").submit();
        }

    })//.keydown(function(e){//回车登录
    //var ev=document.all?window.event:e;
    //if(ev.keyCode==13){
    //    $("#goToPay").click();
    //}
    //});

    //值
    function pub_money(jude) {
        var mes = ""
        switch (jude) {
            case 0, 3:
                mes = ""
                break;
            case 1:
                mes = "请输入投标金额"
                break;
            case 2:
                mes = "请输入大于100并且是100倍数的金额"
                break;
            case 4:
                mes = "输入金额必须小于等于可投标金额"
                break;
        }
        return mes;
    }

    function yqshouyiOnKey() {
        var money = document.getElementById("money").value;
        if (money >= startAmount)
            yqsyCal(money);
    }

    function yqsyCal(money) {
        if (money != null && money != undefined && money != '') {
            $.ajax({
                url: "/finance/getExpectProfit",
                type: "post",
                data: {"loanApplicationId": loanApplicationId, "amount": money},
                async: false,
                success: function (data) {
                    if (data.indexOf(",") != -1) {
                        var arr = data.split(",");
                        $("#yqsy").html(fmoney(arr[0], 2) + "元+" + fmoney(arr[1], 2) + "元(奖励)");
                    } else {
                        $("#yqsy").html(fmoney(data, 2) + "元");
                    }
                }
            });
        }
    }


    $("#login").click(function () {
        var jude = judeMoney($("#money"), true);
        var inputMoney = $("#money").val();
        if (jude == 3 && remain < inputMoney) {
            jude = 4;
        }
        if(jude == 3 && parseFloat($("#money").val()) % 100!=0){
            jude = 2;
        }
        var mes = pub_money(jude);

        if (mes !== "") {
            $("#emInfo").html(mes);
            return false;
        }
//        $("#lendForm").attr("action", rootPath + "/user/toLogin?flag=" + $("#loanApplicationId").val()).submit();
        $("#lendForm").submit();//这里是我自己改的
    })

    $("#noVerified").click(function () {
        var jude = judeMoney($("#money"), true);
        var inputMoney = $("#money").val();
        if (jude == 3 && remain < inputMoney) {
            jude = 4;
        }
        if(jude == 3 && parseFloat($("#money").val()) % 100!=0){
            jude = 2;
        }
        var mes = pub_money(jude);

        if (mes !== "") {
            $("#emInfo").html(mes);
            return false;
        }
        window.location.href = rootPath + "/finance/toAuthentication/" + loanApplicationId;
    });

    $("#riskGrade").click(function () {
        $("#riskTip").show().children(".context").addClass("anim7ated fadeInDownBig");
    })

    function moneyVail() {
        var inputMoney = $("#money").val();
        var jude = judeMoney($("#money"), true);
        if (jude == 3 && remain < inputMoney) {
            jude = 4;
        }
        if(jude == 3 && parseFloat($("#money").val()) % 100!=0){
            jude = 2;
        }
        var mes = pub_money(jude);
        if (mes != "") {
            $("#emInfo").html(mes);
            return false;
        }
        return true;
    }
    function _tabli(){

        var _this = $("#tabli");
        var _thisId = _this.attr("data-id");

        _this.addClass("action").siblings("li").removeClass("action")
        $("#"+_thisId).show().siblings().hide()

    }
</script>
<script type="text/javascript" src="/app/js/jq.js"></script>
<script type="text/javascript" src="/app/js/fs_forse.js"></script>
<script>

    var j = jQuery.noConflict();
    j(document).ready(function() {
        j('#tab-prov img').fsgallery()
    })
</script>
</body>
</html>