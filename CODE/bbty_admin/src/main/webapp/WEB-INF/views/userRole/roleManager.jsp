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

	<!-- 成功提示框 -->
	<div class="alert alert-success" id="successAlert">操作成功！</div>

	<!-- 失败提示框 -->
	<div class="alert alert-danger" id="dangerAlert">操作失败，出现异常！</div>

	<!-- 警告提示框 -->
	<div class="alert alert-warning" id="oneRowAlert">请选择一条记录！</div>
	
	<!-- 新增角色 -->
	<div class="modal fade" id="roleModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		data-backdrop="static">
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
						action="<%=contextPath%>/role/saveRole" method="post">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">角色ID:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="roleid">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">角色名称:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="rolename">
							</div>
						</div>
						<div class="form-group">
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									onclick="saveRole();">保存</button>
								<button type="button" class="btn btn-default"
									onclick="closeModal();">关闭</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- 角色管理列表 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">角色管理列表</div>
				<div class="panel-body">
					<button type="button" class="btn btn-primary"
						onclick="toAddRole();">新增</button>
					<button type="button" class="btn btn-primary" onclick="toUptRole();">修改</button>
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

	<script type="text/javascript">
    $(function() {
    	
    	//隐藏成功提示框
    	$("#successAlert").hide();
    	//隐藏失败提示框
    	$("#dangerAlert").hide();
    	//隐藏警告提示框
    	$("#oneRowAlert").hide();
    	//表单校验
    	$('#roleForm').bootstrapValidator({
	            message: 'This value is not valid',
	            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {/*验证*/
	            	roleid: {/*键名username和input name值对应*/
	                    message: '角色id无效',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '角色id不能为空'
	                        },
	                        remote: {
	                        	url: '<%=contextPath%>/role/getRoleByRoleId',
	                            message: '角色id已存在',//提示消息
	                            type: 'post'//请求方式
	                        }
	                    }
	                },
	                rolename: {
	                    message:'角色名称无效',
	                    validators: {
	                        notEmpty: {
	                            message: '角色名称不能为空'
	                        }
	                    }
	                }
	            }
	        });
    	 
    	//表格初始化
        $('#roleTables').DataTable({
        	pagingType:"full_numbers",//设置分页控件的模式
        	searching: false,//datatales的查询框,true:开启;false:关闭
        	aLengthMenu:[10,20,30],//设置一页展示多少条记录
        	bLengthChange: false,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
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
    	
    	//行选中更改颜色
        $('#roleTables tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');
        } );
        
		});
    
    //打开新增角色窗口
    function toAddRole(){
    	$('#roleModal').modal('show');
    }
    
    //关闭新增角色窗口
    function closeModal(){
    	$('#roleForm').data('bootstrapValidator').resetForm(); 
    	$('#roleModal').modal('hide');
    }
    
    //保存新增角色
    function saveRole(){
    	
    	var roleForm = $('#roleForm');
    	//验证表单
    	var validator = $('#roleForm').data('bootstrapValidator');
        
    	if (validator) {
        // 修复记忆的组件不验证
            validator.validate();
            if (!validator.isValid()) {
                return false;
            }
        }
        
        $.ajax({
            type : "post",
            url : roleForm.attr("action"),
            data : roleForm.serializeArray(),
            dataType : "json",
            cache : false,
            success : function call(dataRtn){
            	var rtnStr = dataRtn.rtn;
            	if(rtnStr == "success"){
            		
            		//清空表单验证
            		$('#roleForm').data('bootstrapValidator').resetForm(); 
            		
            		//清空表单内容
            		$('#roleForm').resetForm();
            		
            		//关闭窗口
                	$('#roleModal').modal('hide');
            		
            		//成功提示
                	$("#successAlert").show();
            		
                	//3秒后关闭提示
                	setTimeout('$("#successAlert").hide()',3000);
                	
            		//列表刷新
                	var roleTables=$('#roleTables').DataTable();
                	roleTables.ajax.reload();
            		
            	}else{
            		//清空表单验证
            		$('#roleForm').data('bootstrapValidator').resetForm(); 
            		
            		//清空表单内容
            		$('#roleForm').resetForm();
            		
            		//关闭窗口
                	$('#roleModal').modal('hide');
            		
            		//失败提示
                	$("#dangerAlert").show();
            		
                	//3秒后关闭提示
                	setTimeout('$("#dangerAlert").hide()',3000);
            	}
            }
        });

    }
    
    //打开修改角色窗口
    function toUptRole(){
    	var roleTables = $('#roleTables').DataTable();
    	var length = roleTables.rows('.selected').data().length;
    	if(length >1 || length ==0){
    		//成功提示
        	$("#oneRowAlert").show();
        	//3秒后关闭提示
        	setTimeout('$("#oneRowAlert").hide()',3000);
    	}else{
    		var row = roleTables.rows('.selected').data();
    		//row[0].roleid
    		
    	}
    }
	</script>
</body>
</html>