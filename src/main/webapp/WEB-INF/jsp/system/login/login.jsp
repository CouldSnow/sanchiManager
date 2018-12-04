<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    pageContext.setAttribute("path", path);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="教学管理" />
    <meta name="author" content="" />

    <title>log in</title>

    <link rel="stylesheet" href="${path}/static/assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${path}/static/assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="${path}/static/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${path}/static/assets/css/xenon-core.css">
    <link rel="stylesheet" href="${path}/static/assets/css/xenon-forms.css">
    <link rel="stylesheet" href="${path}/static/assets/css/xenon-components.css">
    <link rel="stylesheet" href="${path}/static/assets/css/xenon-skins.css">
    <link rel="stylesheet" href="${path}/static/assets/css/custom.css">

    <script src="${path}/static/assets/js/jquery-1.11.1.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${path}/static/assets/js/html5shiv.min.js"></script>
    <script src="${path}/static/static/assets/js/respond.min.js"></script>
    <![endif]-->


</head>
<body class="page-body login-page ">


<div class="login-container">

    <div class="row">

        <div class="col-sm-6">

            <script type="text/javascript">
                jQuery(document).ready(function($)
                {
                    // Reveal Login form
                    setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);


                    // Validation and Ajax action
                    $("#login").validate({
                        rules: {
                            username: {
                                required: true
                            },

                            password: {
                                required: true
                            }
                        },

                        messages: {
                            username: {
                                required: 'Please enter your username.'
                            },

                            password: {
                                required: 'Please enter your password.'
                            }
                        },

                        // Form Processing via AJAX
                        submitHandler: function(form)
                        {
                            show_loading_bar(70); // Fill progress bar to 70% (just a given value)

                            var opts = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-top-full-width",
                                "onclick": null,
                                "showDuration": "300",
                                "hideDuration": "1000",
                                "timeOut": "5000",
                                "extendedTimeOut": "1000",
                                "showEasing": "swing",
                                "hideEasing": "linear",
                                "showMethod": "fadeIn",
                                "hideMethod": "fadeOut"
                            };

                            $.ajax({
                                url: "data/login-check.php",
                                method: 'POST',
                                dataType: 'json',
                                data: {
                                    do_login: true,
                                    username: $(form).find('#username').val(),
                                    password: $(form).find('#password').val(),
                                },
                                success: function(resp)
                                {
                                    show_loading_bar({
                                        delay: .5,
                                        pct: 100,
                                        finish: function(){

                                            // Redirect after successful login page (when progress bar reaches 100%)
                                            if(resp.accessGranted)
                                            {
                                                window.location.href = 'dashboard-1.html';
                                            }
                                            else
                                            {
                                                toastr.error("You have entered wrong password, please try again. User and password is <strong>demo/demo</strong> :)", "Invalid Login!", opts);
                                                $passwd.select();
                                            }
                                        }
                                    });

                                }
                            });

                        }
                    });

                    // Set Form focus
                    $("form#login .form-group:has(.form-control):first .form-control").focus();/*选中用户名*/
                });
            </script>

            <!-- Errors container -->
            <div class="errors-container">


            </div>

            <!-- Add class "fade-in-effect" for login form effect -->
            <form method="post" role="form" id="login" class="login-form fade-in-effect">

                <div class="login-header">
                    <a href="#" class="logo">
                        <img src="${path}/static/assets/images/logo@2x.png" alt="" width="80" />
                        <span>log in</span>
                    </a>

                    <p>Dear user, log in to access the admin area!</p>
                </div>


                <div class="form-group">
                    <label class="control-label" for="username">Username</label>
                    <input type="text" class="form-control input-dark" name="username" id="username" autocomplete="off" />
                </div>

                <div class="form-group">
                    <label class="control-label" for="password">Password</label>
                    <input type="password" name="password" style="display:none"><!--解决google浏览器自动填充用户名和密码-->
                    <input type="password" class="form-control input-dark" name="password" id="password" autocomplete="off" />
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-dark  btn-block text-left">
                        <i class="fa-lock"></i>
                        登入
                    </button>
                </div>

                <%--<div class="login-footer">
                    <a href="#">忘记密码?</a>

                    &lt;%&ndash;<div class="info-links">
                        <a href="#">ToS</a> -
                        <a href="#">Privacy Policy</a>
                    </div>&ndash;%&gt;

                </div>--%>

            </form>

        </div>

    </div>

</div>



<!-- Bottom Scripts -->
<script src="${path}/static/assets/js/bootstrap.min.js"></script>
<script src="${path}/static/assets/js/TweenMax.min.js"></script>
<script src="${path}/static/assets/js/resizeable.js"></script>
<script src="${path}/static/assets/js/joinable.js"></script>
<script src="${path}/static/assets/js/xenon-api.js"></script>
<script src="${path}/static/assets/js/xenon-toggles.js"></script>
<script src="${path}/static/assets/js/jquery-validate/jquery.validate.min.js"></script>
<script src="${path}/static/assets/js/toastr/toastr.min.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="${path}/static/assets/js/xenon-custom.js"></script>

</body>
</html>