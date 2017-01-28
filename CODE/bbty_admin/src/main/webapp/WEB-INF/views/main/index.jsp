<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">

			<!-- 系统顶部	标题 -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">棒棒体育后台管理系统</a>
			</div>

			<!-- 系统顶部	标题右侧-->
			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>个人信息</a></li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>安全退出</a>
						</li>
					</ul></li>
			</ul>

			<!-- 系统左侧菜单-->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="#"><i class="fa fa-dashboard fa-fw"></i>系统首页</a>
						</li>
						<li><a href="#"><i class="fa fa-table fa-fw"></i>商品管理<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="javascript:void(0);" onclick="toTab('<%=contextPath %>/index/toGoodMeterManager');">计量配置</a></li>
								<li><a href="javascript:void(0);" onclick="toTab('<%=contextPath %>/index/toGoodTypeManager');">商品分类</a></li>
								<li><a href="javascript:void(0);" onclick="toTab('<%=contextPath %>/index/toGoodInfoManager');">商品维护</a></li>
							</ul></li>
						<li><a href="#"><i class="fa fa-table fa-fw"></i>采购管理<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="javascript:void(0);" onclick="toTab('<%=contextPath %>/index/toGoodRepManager');">采购入库</a></li>
								<li><a href="#">采购退货</a></li>
							</ul></li>
						<li><a href="#"><i class="fa fa-files-o fa-fw"></i>销售管理<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">销售出库</a></li>
								<li><a href="#">销售退货</a></li>
							</ul></li>
						<li><a href="#"><i class="fa fa-files-o fa-fw"></i>库存管理<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">库存查询</a></li>
								<li><a href="#">库存盘点</a></li>
							</ul></li>
						<li><a href="#"><i class="fa fa-files-o fa-fw"></i>系统管理<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">菜单管理</a></li>
								<li><a href="#">系统设置</a></li>
								<li><a href="#">系统日志</a></li>
							</ul></li>
						<li><a href="#"><i class="fa fa-files-o fa-fw"></i>人员管理<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="javascript:void(0);" onclick="toTab('<%=contextPath %>/index/toRoleManager');">角色管理</a></li>
								<li><a href="javascript:void(0);" onclick="toTab('<%=contextPath %>/index/toUserManager');">员工管理</a></li>
								<li><a href="#">个人信息</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		
		 <div id="page-wrapper">
         	
         </div>
	</div>
	
	<script type="text/javascript">
		function toTab(url){
			$.ajax({
			    type:"post",
			    url:url,
			    dataType:"html",
			    success: function(str){
			      $("#page-wrapper").html(str);
			    }
			});
		}
	</script>
</body>
</html>