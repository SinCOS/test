//开启手势密码
function ios(){
    //window.zcb.setUnlockPattern();
    if($("#radio-1-3").is(':checked')) {
        var modelNumber = window.zcb.removeUserInfo('resultInfo');
        if(modelNumber != null && modelNumber != ''){
            closeGesturePassword(modelNumber);
        }
    }else{
        var modelNumber = window.zcb.setUnlockPattern("SET");
        window.zcb.setUserInfo('resultInfo', saveGesturePassword(modelNumber,'1'));
    }
    window.location.reload();
}
function android(){
    //window.zcb.setUnlockPattern();
    if($("#radio-1-2").is(':checked')) {
        var modelNumber = window.zcb.removeUserInfo('resultInfo');
        if(modelNumber != null && modelNumber != ''){
            closeGesturePassword(modelNumber);
        }
    }else{
        var modelNumber = window.zcb.setUnlockPattern("SET");
        window.zcb.saveUserInfo('resultInfo', saveGesturePassword(modelNumber,'2'));
    }
    window.location.reload();
}
//保存手势密码
function saveGesturePassword(modelNumber,type){
    var result = null;
    $.ajax({
        type: 'POST',
        cache: false,
        async: false,
        url: rootPath+'/saveGesturePassword',
        data: {
            modelNumber: modelNumber,
            type: type
        },
        success: function (data) {
            if (data.result == "success") {
                result = data.data;
            }
        },
        error: function (html) {
            window.location.href = rootPath+"/person/account/overview";
        }
    });
    return result;
}
//清除手势密码
function closeGesturePassword(modelNumber){
    var result = false;
    $.ajax({
        type: 'POST',
        cache: false,
        async: false,
        url: rootPath+'/closeGesturePassword',
        data: {
            modelNumber: modelNumber
        },
        success: function (data) {
            if (data.result == "success") {
                result = true;
            }
        },
        error: function (html) {
            window.location.href = rootPath+"/person/account/overview";
        }
    });
    return result;
}
//启动手势密码
function startGesturePassword(){
    //获取保存的数据
    var resultInfo1 = window.zcb.getUserInfo('resultInfo');
    var resultInfo =  eval('(' + resultInfo1 + ')');
    if(resultInfo != null){
        //本地验证
        var modelNumber = window.zcb.getDeviceId();
        if(modelNumber != null && modelNumber != ''){
            //和服务器验证
            var validateResult = gesturePasswordIfOpen(modelNumber,resultInfo.userId);
            if(validateResult){
                //本地手势密码验证
                window.zcb.verifyUnlockPattern();
            }
        }
    }
}
//手势密码是否开启
function gesturePasswordIfOpen(modelNumber,userId){
    var result = false;
    $.ajax({
        type: 'POST',
        cache: false,
        async: false,
        url: rootPath+'/gesturePasswordIfOpen',
        data: {
            modelNumber: modelNumber,
            userId: userId
        },
        success: function (data) {
            if (data.result == "success") {
                result = true;
            }
        },
        error: function (html) {
            window.location.href = rootPath+"/user/toLogin";
        }
    });
    return result;
}
//验证成功的回调
function verifyUnlockPatternSuccess(type){
    var resultInfo1 = window.zcb.getUserInfo('resultInfo');
    var resultInfo =  eval('(' + resultInfo1 + ')');
    var login = simulatedLogin(resultInfo.gesturePasswordSign, type);
    if(login){
        window.location.href = rootPath;
    }
}
//验证失败的回调
function verifyUnlockPatternFailed(type){
    window.location.href = rootPath+"/user/toLogin";
}
//模拟登陆
function simulatedLogin(gesturePasswordSign,type){
    var result = false;
    $.ajax({
        type: 'POST',
        cache: false,
        async: false,
        url: rootPath+'/simulatedLogin',
        data: {
            gesturePasswordSign: gesturePasswordSign,
            type: type
        },
        success: function (data) {
            if (data.result == "success") {
                result = true;
            }
        },
        error: function (html) {
            window.location.href = rootPath+"/user/toLogin";
        }
    });
    return result;
}