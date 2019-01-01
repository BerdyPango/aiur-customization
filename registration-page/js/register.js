$('document').ready(function()
{
    /* validation */
    $("#register-form").validate({
        rules:
        {
            user: {
                required: true,
                minlength: 3
            },
            pass: {
                required: true,
                minlength: 3,
                maxlength: 15
            },
            pass2: {
                required: true,
                equalTo: '#pass'
            }
        },
        messages:
        {
            user: "用户名至少需要 3 个字符",
            pass:{
                required: "请输入密码",
                minlength: "密码至少需要 3 个字符"
            },
            pass2:{
                required: "请再次输入密码",
                equalTo: "两次密码不匹配，请重试"
            }
        },
        submitHandler: submitForm
    });
    /* validation */

    /* form submit */
    function submitForm()
    {
        var data = $("#register-form").serialize();

        $.ajax({

            type : 'POST',
            url  : 'functions/register.php',
            data : data,
            beforeSend: function()
            {
                $("#error").fadeOut();
                $("#btn-submit").html('<span class="glyphicon glyphicon-transfer"></span> &nbsp; sending ...');
            },
            success :  function(data)
            {
                if(data==1){

                    $("#error").fadeIn(1000, function(){


                        $("#error").html('<div class="alert alert-danger"> <span class="glyphicon glyphicon-info-sign"></span> &nbsp; 用户名已存在</div>');

                        $("#btn-submit").html('<span class="glyphicon glyphicon-log-in"></span> &nbsp; Create Account');

                    });

                }
                else if(data=="registered")
                {
                    $(".form-signin").fadeOut(500);
                    $("#success").html("<div class=\'alert alert-success alert-dismissable fade in\'>注册成功！</div>");
                    $("#btn-submit").html('Signing Up');
                }
                else{

                    $("#error").fadeIn(1000, function(){

                        $("#error").html('<div class="alert alert-danger"><span class="glyphicon glyphicon-info-sign"></span> &nbsp; '+data+' !</div>');

                        $("#btn-submit").html('<span class="glyphicon glyphicon-log-in"></span> &nbsp; Create Account');

                    });

                }
            }
        });
        return false;
    }
    /* form submit */

});
