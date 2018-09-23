<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>开始支付</title>
</head>
<body>
    
</body>
<script>
function onBridgeReady(){
   WeixinJSBridge.invoke(
      'getBrandWCPayRequest', {!!$result!!},
      function(res){
      if(res.err_msg == "get_brand_wcpay_request:ok" ){
        window.location = '/home';
      }else{
        alert("支付取消");
        window.location = '/home';
      }
   });
}
if (typeof WeixinJSBridge == "undefined"){
   if( document.addEventListener ){
       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
   }else if (document.attachEvent){
       document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
   }
}else{
   onBridgeReady();
}
</script>
</html>