<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
     <link rel="stylesheet" href="/vendor/laravel-admin/AdminLTE/bootstrap/css/bootstrap.min.css">
    {{-- <link rel="stylesheet" href="http://www.luckwo.com/web/resource/css/common.css?v=20170426"> --}}

    <script src="http://localhost:8000/vendor/laravel-admin/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="http://localhost:8000/vendor/laravel-admin/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="main">


    <style>
        .table td span{display:inline-block;margin-top:4px;}
        .table td input{margin-bottom:0;}
    </style>


    <div class="clearfix " id='app'>
        <form class="form-horizontal form" action="" method="post" enctype="multipart/form-data" @submit.prevent="submit">
            <div class="panel panel-default">
                <div class="panel-heading">信息编辑</div>
                <div class="panel-body">

                    <input type="hidden" name="id" value="">
                    <input type="hidden" name="op" value="edit">

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label"><span style="color:red;">*</span>借款金额（/元）：</label>
                        <div class="col-sm-8 col-xs-12">
                            <input type="number" class="form-control" placeholder="填写纯数字" v-model='jkje' name="jkje" value="" required="required" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label"><span style="color:red;">*</span>借款期限（/月）：</label>
                        <div class="col-sm-8 col-xs-12">
                            <input type="number" class="form-control" placeholder="填写纯数字" v-model='jkqx' name="jkqx" value="" required="required" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label">抵押信息:</label>
                        <div class="col-sm-8 col-xs-12">
                            <select class="form-control" name="dyxx" v-model='dyxx'>
                                <option value="抵押房">抵押房</option>
                                <option value="抵押车" >抵押车</option>
                                <option value="其他不动产">其他不动产</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label">还款方式:</label>
                        <div class="col-sm-8 col-xs-12">
                            <select class="form-control" name="hkfs" v-model='hkfs'>
                                <option value="按月付息，到期还本金" >按月付息，到期还本金</option>
								<option value="按季度付息，到期还本金">按季度付息，到期还本金</option>
                                <option value="到期还本息" >到期还本付息</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label">借款描述</label>
                        <div class="col-sm-8 col-xs-12">
                            <textarea name="jkms" v-model='jkms' placeholder="借款描述" class="form-control" style="height:100px;"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label">性别:</label>
                        <div class="col-sm-8 col-xs-12">
                            <select class="form-control" name="sex" v-model='sex'>
                                <option value="男" >男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label">婚姻状况:</label>
                        <div class="col-sm-8 col-xs-12">
                            <select class="form-control" name="hyzk" v-model='hyzk'>
                                <option value="未婚" >未婚</option>
                                <option value="已婚" >已婚</option>
                                <option value="离异" >离异</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label">最高学历:</label>
                        <div class="col-sm-8 col-xs-12">
                            <select class="form-control" name="zgxl" v-model='zgxl'>
                                <option value="小学" >小学</option>
                                <option value="初中" >初中</option>
                                <option value="高中" >高中</option>
                                <option value="大学专科" >大学专科</option>
                                <option value="大学本科" >大学本科</option>
                                <option value="研究生" >研究生</option>
                                <option value="博士" >博士</option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label"><span style="color:red;">*</span>现居住地址：</label>
                        <div class="col-sm-8 col-xs-12">
                            <input type="text" class="form-control" placeholder="现居住地址" v-model='address' name="address" value="" required="required" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label"><span style="color:red;">*</span>月均收入：</label>
                        <div class="col-sm-8 col-xs-12">
                            <input type="number" class="form-control" placeholder="填写纯数字" v-model='yjsr' name="yjsr" value="" required="required" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label"><span style="color:red;">*</span>年均收入：</label>
                        <div class="col-sm-8 col-xs-12">
                            <input type="number" class="form-control" placeholder="填写纯数字" v-model='njsr' name="njsr" value="" required="required" >
                        </div>
                    </div>

                      <div class="form-group  ">

    <label for="avatar" class="col-xs-12 col-sm-4 col-md-3 col-lg-2 control-label">照片（房产证、土地证、行驶证、身份证正反面、户口本、驾驶证）</label>

    <div class="col-sm-8 col-xs-12">

        
        <input type="file" id='file' class="file" name="avatar" multiple=true />

        
    </div>
</div>


                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <input name="submit" type="submit" value="提交" class="btn btn-primary col-lg-1" style="margin-left:5%;">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<link href="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/css/fileinput.min.css" rel="stylesheet">

<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/fileinput.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/locales/zh.min.js"></script>
<script src="https://cdn.bootcss.com/vue/2.5.15/vue.js"></script>
      <script>

function getCookie(name) 
{ 
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]); 
    else 
        return null; 
} 
    $(function () {
        $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': getCookie('XSRF-TOKEN')
        }
    });
    console.log(getCookie('XSRF-TOKEN'));
});
</script>
<script>
    var app = new Vue({
        el: '#app',
        mounted(){
            let that = this;
                $("#file").fileinput({
                    uploadUrl: "{{route('uploadpic')}}",
    uploadAsync:true,
    showUpload:true,
    language: 'zh',
    maxFileCount: 4,
    maxFileSize:2000,
    shwoRemove: true,
    dropZoneEnabled:false,
    showPreview: true,
    enctype: 'multipart/form-data',
    allowedFileTypes:["image"]
    }).on('filebatchselected',function(event,files){
        $(this).fileinput('upload');
    }).on('fileuploaded',function (event,data) {
        console.log(data.response);
        that.imglist.push(data.response)
    });
        },
        data:{
            njsr: '',
            address: '',
            yjsr: '',
            zgxl: '',
            hyzk: '未婚',
            jkms:'',
            sex:'男',
            jkje: '',
            jkqx: '',
            hkfs: '',
            dyxx: '',
            imglist:[]

        },
        methods:{
            submit(){
                if(this.imglist.length < 2){
                    alert("请上传证件照");
                    return false;
                }
                $.post("/apply/"+'0', this.$data,
                    function (data, textStatus, jqXHR) {
                        console.log(data);
                    },
                    "json"
                );
                return true;
            },
        }
    })
</script>
</html>

