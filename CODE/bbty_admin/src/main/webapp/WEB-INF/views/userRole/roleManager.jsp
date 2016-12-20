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

</head>

<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">查询条件</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">角色管理列表</div>
				<div class="panel-body">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#roleModal">新增</button>
					<button type="button" class="btn btn-primary">修改</button>
					<button type="button" class="btn btn-primary">删除</button>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover"
						id="roleTables">
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="roleModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">新增角色</h4>
				</div>
				<div class="modal-body">
					<form id="roleForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/login/login" method="post">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">角色ID:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="firstname">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">角色名称:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="lastname">
							</div>
						</div>
						<div class="form-group">
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">保存</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
    $(function() {
        $('#roleTables').DataTable({
        	pagingType:"full_numbers",//设置分页控件的模式
        	searching: false,//datatales的查询框,true:开启;false:关闭
        	aLengthMenu:[10,20,30],//设置一页展示多少条记录
        	bLengthChange: true,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
            responsive: true,//是否需要分页控件,true:需要,false:不需要
            ajax: {
                "url": "<%=contextPath%>/role/getRoleList"
				},
				columns : [ {
					"data" : "roleid",
					"title" : "角色ID"
				}, {
					"data" : "rolename",
					"title" : "角色名称"
				} ],
				language : {
					loadingRecords : "加载中...",
					processing : "查询中...",
					lengthMenu : "每页显示 _MENU_ 条记录",
					zeroRecords : "没有找到记录",
					info : "当前显示第 _START_ 至 _END_条记录，总共 _TOTAL_ 条记录",
					infoEmpty : "无记录",
					infoFiltered : "(从 _MAX_ 条记录过滤)",
					paginate : {
						first : "首页",
						last : "尾页",
						next : "下页",
						previous : "上页"
					}
				}

			});
		});
	</script>
</body>
</html>