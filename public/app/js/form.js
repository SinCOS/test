//金额
function judeMoney(iptMoney, _true) {

    var accord = 0; // 1. 空值或输入不正确 2. 金额小于100 3. 输入正确
    if (!_true && iptMoney.val() == "") return 0;

    if (iptMoney.val() == "" || !/^[0-9]+([.]{1}[0-9]+){0,1}$/.test(iptMoney.val())) return 1;
    if (parseFloat(iptMoney.val()) < 100) accord = 2;
    else accord = 3;
    return accord;
}

//比较金额
function judeMoneyVail(iptMoney, _true, _justMoney) {
    var accord = 0; // 1. 空值或输入不正确 2. 金额小于100 3. 输入正确
    if (!_true && iptMoney.val() == "") return 0;

    if (iptMoney.val() == "" || !/^[0-9]+([.]{1}[0-9]+){0,1}$/.test(iptMoney.val())) return 1;

    if (parseFloat(iptMoney.val()) < 100) return 2;

    if (rmoney(_justMoney.html()) < parseFloat(iptMoney.val())) return 3
    if (isTriDecimal(iptMoney.val())) accord = 4
    else accord = 5;

    return accord;
}
//密码
function exMsg(iptMoney, _true) {

    var accord = 0; // 1. 空值 2. 交易密码不正确 3. 输入正确
    if (!_true && iptMoney.val() == "") return 0;

    if (iptMoney.val() == "") return 1;
    if (iptMoney.val().length < 6) accord = 2;
    else accord = 3;
    return accord;
}
//手机号
function iPhone(ipt, _true) {
    var accord = 0 //
    if (!_true && ipt.val() == "") return 0;
    if (ipt.val() == "") return 1;
    if (!/(^1[3|5|7|8][0-9]{9}$)/.test(ipt.val())) return 2;
    else accord = 3;
    return accord;
}
//姓名
function justName(ipt, _true) {

    var accord = 0; // 1. 空值 2. 交易密码不正确 3. 输入正确
    if (!_true && ipt.val() == "") return 0;

    if (ipt.val() == "") return 1;
    if (ipt.val().length < 2) accord = 2;
    else accord = 3;
    return accord;
}
//身份证
function justBodyId(ipt, _true) {

	var accord = 0 // 
	if(!_true && ipt.val()=="") return 0;
	if( ipt.val()=="" ) return 1;
	if(!checkCard(ipt.val())) return 2;
	else accord = 3;
	return accord;
}
//银行卡 、开户行地区
function justBank(ipt, _true) {

    var accord = 0; // 1. 空值 2. 交易密码不正确 3. 输入正确
    if (!_true && ipt.val() == "") return 0;

    if (ipt.val() == "") return 1;
    if (ipt.val().length < 1) accord = 2;
    else accord = 3;
    return accord;
}
//下拉框
function justSelect(ipt, _true) {
    var accord = 0; // 1. 空值 2. 交易密码不正确 3. 输入正确
    if (!_true && ipt.val() == 0) return 0;

    if (ipt.val() == 0) return 1;
    else accord = 3;
    return accord;
}
//判断小数后两位
function isTriDecimal(value) {

    if (value != null && value != '') {
        var decimalIndex = value.indexOf('.');
        if (decimalIndex == '-1') {
            return false;
        } else {
            var decimalPart = value.substring(decimalIndex + 1, value.length);
            if (decimalPart.length > 2) {
                return true;
            } else {
                return false;
            }
        }
    }
    return false;
}

//判断传来的值不能小于几位
function justIdenty(ipt, _true, _num) {

    var accord = 0; // 1. 空值 2. 交易密码不正确 3. 输入正确
    if (!_true && ipt.val() == "") return 0;

    if (ipt.val() == "") return 1;
    if (ipt.val().length < _num) accord = 2;
    else accord = 3;
    return accord;
}
//值
function pub_money(jude) {
    var mes = ""
    switch (jude) {
        case 0, 3:
            mes = ""
            break;
        case 1:
            mes = "请输入金额"
            break;
        case 2:
            mes = "输入金额必须大于等于100"
            break;
    }
    return mes;
}
//值
function pub_WithMoney(jude) {
    var mes = ""
    switch (jude) {
        case 0, 5:
            mes = ""
            break;
        case 1:
            mes = "请输入金额"
            break;
        case 2:
            mes = "输入金额必须大于等于100"
            break;
        case 3:
            mes = "提现金额不能大于可用余额"
            break;
        case 4:
            mes = "金额精确至小数点后两位"
            break;
    }
    return mes;
}
//密码值
function pub_exMsg(info) {
    var mes = ""
    switch (info) {
        case 0, 3:
            mes = ""
            break;
        case 1:
            mes = "请输入密码"
            break;
        case 2:
            mes = "密码格式有误"
            break;
    }
    return mes;
}
//值
function pub_iphone(jude) {
    var mes = ""
    switch (jude) {
        case 0, 3:
            mes = ""
            break;
        case 1:
            mes = "请输入手机号"
            break;
        case 2:
            mes = "手机号码格式错误"
            break;
    }
    return mes;
}
//密码值
function pub_Name(info) {
    var mes = ""
    switch (info) {
        case 0, 3:
            mes = ""
            break;
        case 1:
            mes = "请输入您的姓名"
            break;
        case 2:
            mes = "请输入正确的姓名"
            break;
    }
    return mes;
}
//身份证 值
function pub_BodyId(jude) {
    var mes = ""
    switch (jude) {
        case 0, 3:
            mes = ""
            break;
        case 1:
            mes = "请输入身份证号码"
            break;
        case 2:
            mes = "身份证号码有误"
            break;
    }
    return mes;
}
//银行卡值
function pub_Bank(info) {
    var mes = ""
    switch (info) {
        case 0, 3:
            mes = ""
            break;
        case 1:
            mes = "请输入银行卡号"
            break;
        case 2:
            mes = "输入的银行卡号格式有误"
            break;
    }
    return mes;
}

//下拉框值
function pub_Select(info, _lbl) {
    var mes = ""
    switch (info) {
        case 0, 3:
            mes = ""
            break;
        case 1:
            mes = "请选择" + _lbl
            break;
    }
    return mes;
}

var intDiff = parseInt(60);//倒计时总秒数量
function timer(timeval){

	timeval.attr("disabled",true);
	timeval.val('60s后重新获取');
	$("#getViste").addClass("btnGray").removeClass("btnBlue");
	intDiff=59;
	interval=window.setInterval(function(){
		timeval.val(intDiff+'s后重新获取');
		if(intDiff<=0){
			timeval.removeAttr("disabled");
			$("#getViste").addClass("btnBlue").removeClass("btnGray");
			timeval.val('重新获取');
			clearTimeout(interval);
			return;
		}
		intDiff--;
	}, 1000);
}
//验证码值
function pub_Identy(jude){
	var mes = ""
	switch (jude){
		case 0,3:
			mes = ""
			break;
		case 1:
			mes = "请输入验证码"
			break;
		case 2:
			mes = "验证码为六位数"
			break;
	}
	return mes;
}

checkCard = function (obj) {
	//var card = document.getElementById('card_no').value;
	//是否为空
	// if(card == '')
	// {

	//     return false;
	//}
	//校验长度，类型
	if (!isCardNo(obj)) {

		return false;
	}
	//检查省份
	if (!checkProvince(obj)) {

		return false;
	}
	//校验生日
	if (!checkBirthday(obj)) {

		return false;
	}
	//检验位的检测
	if (!checkParity(obj)) {

		return false;
	}
	return true;
};


//检查号码是否符合规范，包括长度，类型
isCardNo = function (obj) {
	//身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
	var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
	if (reg.test(obj) == false) {
		return false;
	}

	return true;
};

//取身份证前两位,校验省份
checkProvince = function (obj) {
	var province = obj.substr(0, 2);
	if (vcity[province] == undefined) {
		return false;
	}
	return true;
};

//检查生日是否正确
checkBirthday = function (obj) {
	var len = obj.length;
	//身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
	if (len == '15') {
		var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
		var arr_data = obj.match(re_fifteen);
		var year = arr_data[2];
		var month = arr_data[3];
		var day = arr_data[4];
		var birthday = new Date('19' + year + '/' + month + '/' + day);
		return verifyBirthday('19' + year, month, day, birthday);
	}
	//身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
	if (len == '18') {
		var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
		var arr_data = obj.match(re_eighteen);
		var year = arr_data[2];
		var month = arr_data[3];
		var day = arr_data[4];
		var birthday = new Date(year + '/' + month + '/' + day);
		return verifyBirthday(year, month, day, birthday);
	}
	return false;
};

//校验日期
verifyBirthday = function (year, month, day, birthday) {
	var now = new Date();
	var now_year = now.getFullYear();

	//年月日是否合理
	if (birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day) {
		//判断年份的范围（3岁到100岁之间)
		var time = now_year - year;
		if (time >= 0 && time <= 130) {
			return true;
		}
		return false;
	}
	return false;
};

//校验位的检测
checkParity = function (obj) {
	//15位转18位
	obj = changeFivteenToEighteen(obj);
	var len = obj.length;
	if (len == '18') {
		var arrInt = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
		var arrCh = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
		var cardTemp = 0, i, valnum;
		for (i = 0; i < 17; i++) {
			cardTemp += obj.substr(i, 1) * arrInt[i];
		}
		valnum = arrCh[cardTemp % 11];
		if (valnum == obj.substr(17, 1)) {
			return true;
		}
		return false;
	}
	return false;
};

//15位转18位身份证号
changeFivteenToEighteen = function (obj) {
	if (obj.length == '15') {
		var arrInt = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
		var arrCh = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
		var cardTemp = 0, i;
		obj = obj.substr(0, 6) + '19' + obj.substr(6, obj.length - 6);
		for (i = 0; i < 17; i++) {
			cardTemp += obj.substr(i, 1) * arrInt[i];
		}
		obj += arrCh[cardTemp % 11];
		return obj;
	}
	return obj;
};
var vcity = {
	11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古",
	21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏",
	33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南",
	42: "湖北", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆",
	51: "四川", 52: "贵州", 53: "云南", 54: "西藏", 61: "陕西", 62: "甘肃",
	63: "青海", 64: "宁夏", 65: "新疆", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外"
};
