
$(".tab-head ul li").tap(function(){
	var _this = $(this);
	var _thisId = _this.data("id");

	_this.addClass("action").siblings("li").removeClass("action")
	$("#"+_thisId).show().siblings().hide()
})

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

//还原小数
function rmoney(s) {  

	return parseFloat(s.toString().replace(/[^\d\.-]/g, ""));

}
function checkTextLength(obj, length) {

	if(obj.value.length > length)   {

		obj.value = obj.value.substr(0, length);
	}

}
//弹出框
$(function(){
	$("*[data-mask=mask]").tap(function(){
		maskAnim($(this).attr("data-id"));

	})
	$(".mask").on("click", "a[data-id=close]", function(){

		$(this).parents(".mask").hide();
	});
	function maskAnim(_ipt){

		$("#"+_ipt).show().children(".context").addClass(" animated fadeInDownBig");
	}

})