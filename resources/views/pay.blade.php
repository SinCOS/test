<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
    
</body>
<script>
 wx.chooseWXPay({
     timestamp: {{$result['timestamp'] }},
     nonceStr: '{{ $result['nonceStr'] }}',
     package: '{{ $result['package'] }}',
     signType: '{{ $result['signType'] }}',
     paySign: '{{ $result['paySign'] }}', // 支付签名
     success: function (res) {
         alert('ss');
         // 支付成功后的回调函数
     }
 });
</script>
</html>