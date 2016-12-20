<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>棒棒体育后台管理系统</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">账户登录</h3>
                    </div>
                    <div class="panel-body">
                        <form id="loginForm" role="form" action="<%=contextPath %>/login/login" method="post" >
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="用户名" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="password" type="password" value="">
                                </div>
                               
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="readMe">自动登录
                                    </label>
                                </div>
                                 
                                <button class="btn btn-lg btn-success btn-block" type="submit">登录</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script type="text/javascript">
	 $(function() {
	    /**
	     * 下面是进行插件初始化
	     * 你只需传入相应的键值对
	     * */
	    $('#loginForm').bootstrapValidator({
	            message: 'This value is not valid',
	            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {/*验证*/
	                username: {/*键名username和input name值对应*/
	                    message: 'The username is not valid',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '用户名不能为空'
	                        }
	                    }
	                },
	                password: {
	                    message:'密码无效',
	                    validators: {
	                        notEmpty: {
	                            message: '密码不能为空'
	                        }
	                    }
	                }
	                
	            }
	        });
	});
	
	</script>
</body>

</html>
