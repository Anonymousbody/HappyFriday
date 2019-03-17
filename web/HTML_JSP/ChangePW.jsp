<%--
  Created by IntelliJ IDEA.
  User: LI
  Date: 2018/12/10 0010
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="../bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="../bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/navigation.css">
    <script type="text/javascript" src="../JS/LoginPC.js"></script>
    <style type="text/css">
        body{
            background-color: #f8fafc;
        }
        body.modal-open {
            overflow-y: auto !important;
            padding-right: 0!important;
        }
        tbody tr td:not(:first-child){
            padding-top: 32px !important;
        }

        td button{
            margin-top: -7px;
        }

        .cover{
            width: 100px;height: 65px;margin-right: 5px
        }

        .found_class {
            display: inline-block;
            margin-bottom: 5px;
            font-weight: bold;
            margin-top: 5px;
        }

        .found_class_text{
            height: 40px !important;
            resize: none;
            width: 80%;
            float: right;
        }
        .container_right{
            font-size: 14px;
            line-height: 1.42857143;
            color: #333;
        }
        .main-col{
            min-height: 400px;
        }
        .main-default{
            border-color: #ddd;
        }
        .main-heading{
            border-color: #ddd;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
        }
        /*  .main-col .main-heading {
              background: transparent;
              font-weight: bold;
              color: #393d4d;
              padding: 20px 20px;
          }*/

        .main-body{
            padding: 15px;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
        }
        .alert-success {
            color: #3c763d;
            background-color: #dff0d8;
            border-color: #d6e9c6;
        }
        .alert-danger {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }
        .glyphicon {
            position: relative;
            top: 1px;
            display: inline-block;
            font-family: 'Glyphicons Halflings', serif;
            font-style: normal;
            font-weight: normal;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
        }
        .form-group {
            height: 34px;
            margin-bottom: 50px;
            margin-right: -15px;
            margin-left: -15px;
            display: flex;
        }
        .control-label {
            width: 110px;
            margin-bottom: 0;
            vertical-align: middle;
            padding-right: 15px;
            padding-left: 15px;
            position: relative;
            min-height: 1px;
            text-align: right;
            padding-top: 7px;
            margin-top: 0;
        }

        .control-col{
            position: relative;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
            width: 75%;
        }


        .help-block {
            margin-top: 5px;
            margin-bottom: 10px;
            color: red;
        }


    </style>
    <script type="text/javascript">
        var flag1 = false;
        var flag2 = false;
        var flag3 = false;
        var form_currentPassword;
        var form_confirmPassword;
        var form_newPassword;
        $(document).ready(function(){
            form_currentPassword = $("#form-currentPassword");
            var currentPassword_waring = $('#currentPassword_waring');
            form_currentPassword.focus(function(){
                currentPassword_waring.css('display','none');
                flag1 = false;
            });
            form_currentPassword.blur(function(){
                if (form_currentPassword.val().length<6 || form_currentPassword.val().indexOf(" ") !== -1){
                    currentPassword_waring.css('display','block');
                }else flag1 = true;
            });

            form_newPassword = $('#form_newPassword');
            var form_newPassword_waring = $('#form_newPassword_waring');
            form_newPassword.focus(function () {
                form_newPassword_waring.css('display','none');
                flag2 = false;
            });
            form_newPassword.blur(function(){
                if (form_newPassword.val().length<6 || form_newPassword.val().indexOf(" ") !== -1){
                    form_newPassword_waring.css('display','block');
                }else if (form_confirmPassword.val()!==form_newPassword.val()){
                    form_confirmPassword_waring2.css('display','block');
                    flag2 = true;
                }else {
                    form_confirmPassword_waring2.css('display','none');
                    flag2 = true;
                }
            });

            form_confirmPassword = $('#form_confirmPassword');
            var form_confirmPassword_waring1 = $('#form_confirmPassword_waring1');
            var form_confirmPassword_waring2 = $('#form_confirmPassword_waring2');
            form_confirmPassword.focus(function () {
                form_confirmPassword_waring1.css('display','none');
                form_confirmPassword_waring2.css('display','none');
                flag3 = false;
            });
            form_confirmPassword.blur(function(){
                if (form_confirmPassword.val().length<6 || form_confirmPassword.val().indexOf(" ") !== -1){
                    form_confirmPassword_waring1.css('display','block');
                }else  if (form_confirmPassword.val()!==form_newPassword.val()) {
                    form_confirmPassword_waring2.css('display','block');
                    flag3 = true;
                }else flag3 = true;
            });
        });

        function post_PW() {
            //alert(flag1+','+flag2+','+flag3);
            if (flag1===true&&flag2===true&&flag3===true&&form_confirmPassword.val()===form_newPassword.val()) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/changepw",
                    data: {
                        username:user,
                        form_currentPassword:form_currentPassword.val(),
                        form_confirmPassword:form_confirmPassword.val()
                    },
                    type: "POST",
                    dataType: "json",
                    asynch: "false",
                    success: function (state) {
                        switch (state) {
                            case 0:
                                alert('修改成功');
                                form_currentPassword.val('');
                                form_confirmPassword.val('');
                                form_newPassword.val('');
                                break;
                            case 1:
                                alert('原密码错误');
                                break;
                            case 2:
                                alert('修改失败');
                                break;
                        }
                    }
                });
            }
        }
    </script>

</head>
<body onload="checkCookie();ifActive();addClass(1)">
<jsp:include page="navigation.jsp"/>
<div style="width: 100%;height: 450px">
    <div style="width: 80%;margin: auto">
        <jsp:include page="VerticalNav.jsp"/>
        <div class="container_right">
            <div >
                <h3 class="container_right_head">
                    修改密码
                </h3>
                <div >
                    <div class="main main-col main-default">
                        <div class="main-body">
                            <form id="settings-password-form" class="form-horizontal bv-form" method="post" novalidate="novalidate" data-widget-cid="widget-0">
                                <div class="form-group">
                                    <div class="control-label">
                                        <label for="form-currentPassword" class="required">当前密码</label>
                                    </div>
                                    <div class="control-col">
                                        <input type="password" id="form-currentPassword" name="oldPassword" required="required" class="form-control" data-widget-cid="widget-1" data-explain data-bv-field="oldPassword" />
                                        <%--<div class="help-block" style="display: none"></div>--%>
                                        <small id="currentPassword_waring" data-bv-validator="notEmpty" data-bv-validator-for="oldPassword" class="help-block" style="display: none">请输入6-16位密码，区分大小写，不能使用空格</small>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="control-label">
                                        <label for="form_newPassword" class="required">新密码</label>
                                    </div>
                                    <div class="control-col">
                                        <input type="password" id="form_newPassword" name="Password" required="required" class="form-control" data-widget-cid="widget-2" data-explain data-bv-field="Password" />
                                        <%--<div class="help-block" style="display: none"></div>--%>
                                        <small id="form_newPassword_waring" data-bv-validator="notEmpty" data-bv-validator-for="Password" class="help-block" style="display: none">请输入6-16位密码，区分大小写，不能使用空格</small>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="control-label">
                                        <label for="form_confirmPassword" class="required">确认密码</label>
                                    </div>
                                    <div class="control-col">
                                        <input type="password" id="form_confirmPassword" name="confirmPassword" required="required" class="form-control" data-widget-cid="widget-3" data-explain data-bv-field="confirmPassword" />
                                        <div class="help-block" style="display: none"></div>
                                        <small id="form_confirmPassword_waring1" data-bv-validator="notEmpty" data-bv-validator-for="confirmPassword" class="help-block" style="display: none">请输入6-16位密码，区分大小写，不能使用空格</small>
                                        <small id="form_confirmPassword_waring2" data-bv-validator="identical" data-bv-validator-for="confirmPassword" class="help-block" style="display: none">前后密码不一致</small>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="control-label"></div>
                                    <div class="control-col">
                                        <button type="button" class="btn btn-primary" onclick="post_PW()">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
