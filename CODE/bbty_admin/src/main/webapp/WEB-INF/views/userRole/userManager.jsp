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
	
	<!-- 警告提示框 -->
	<div class="alert alert-warning" id="noRowAlert">请选择记录！</div>

	<div class="modal fade bs-example-modal-sm"  id="confirmDelModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm">
    		<div class="modal-content">
    		<div class="modal-body">
    			确定要删除选中的员工吗？
    		</div>
    		<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="deleteUsers();">确定</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
    		</div>
  		</div>
  	
	</div>
	
	<!-- 新增员工 -->
	<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">新增员工</h4>
				</div>
				<div class="modal-body">
					<form id="userAddForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/user/saveUserAndOper" method="post">
						<div class="form-group">
							<label for="userid" class="col-sm-2 control-label">登录名:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="userid">
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">姓名:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="username">
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="col-sm-2 control-label">性别:</label>
							<div class="col-sm-10">
							 <label class="radio-inline">
                             	<input type="radio" name="gender" id="genderOpen" value="1" checked>男
                             </label>
                             <label class="radio-inline">
                             <input type="radio" name="gender" id="genderStop" value="0">女
                             </label>
                             </div>
						</div>
						<div class="form-group">
							<label for="birthdate" class="col-sm-2 control-label">出生日期:</label>
							<div class="col-sm-6 date form_date ">
								<input type="text" class="form-control" id="birthdate" name="birthdate">
							</div>
						</div>
						<div class="form-group">
							<label for="mobileno" class="col-sm-2 control-label">手机号码:</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="mobileno">
							</div>
						</div>
						<div class="form-group">
							<label for="status" class="col-sm-2 control-label">状态:</label>
							<div class="col-sm-10">
							 <label class="radio-inline">
                             	<input type="radio" name="status" id="statusOpen" value="1" checked>启用
                             </label>
                             <label class="radio-inline">
                             <input type="radio" name="status" id="statusStop" value="0">停用
                             </label>
                             </div>
						</div>
						<div class="form-group">
							<label for="remark" class="col-sm-2 control-label">备注:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="remark"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="saveUserAndOper();">保存</button>
							<button type="button" class="btn btn-default"
								onclick="closeModal(1);">关闭</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- 员工管理列表 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">员工管理列表</div>
				<div class="panel-body">
					<button type="button" class="btn btn-primary"
						onclick="toAddUser();">新增</button>
					<button type="button" class="btn btn-warning"
						onclick="toUptUser();">修改</button>
					<button type="button" class="btn btn-danger" onclick="toDeleteUsers();">批量删除</button>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover"
						id="userTables">
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
    	$("#noRowAlert").hide();
    	
    	//新增员工表单校验
    	$('#userAddForm').bootstrapValidator({
	            message: 'This value is not valid',
	            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {/*验证*/
	            	userid: {/*键名username和input name值对应*/
	                    message: '登录名无效',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '登录名不能为空'
	                        },
	                        remote: {
	                        	url: '<%=contextPath%>/user/checkUserId',
	                            message: '登录名已存在',//提示消息
	                            type: 'post'//请求方式
	                        }
	                    }
	                },
	                username: {
	                    message:'用户 姓名无效',
	                    validators: {
	                        notEmpty: {
	                            message: '用户 姓名不能为空'
	                        }
	                    }
	                },
	                mobileno: {
	                    message: '手机号码无效',
	                    validators: {
	                        notEmpty: {
	                            message: '手机号码不能为空'
	                        },
	                        stringLength: {
	                            min: 11,
	                            max: 11,
	                            message: '请输入11位手机号码'
	                        },
	                        regexp: {
	                            regexp: /^1[3|4|5|7|8][0-9]{9}$/,
	                            message: '请输入正确的手机号码'
	                        }
	                    }
	                },
	            }
	        });
    	
      	//修改角色表单校验
    	$('#roleUptForm').bootstrapValidator({
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
        $('#userTables').DataTable({
        	pagingType:"full_numbers",//设置分页控件的模式
        	searching: true,//datatales的查询框,true:开启;false:关闭
        	lengthMenu:[10,20,30],//设置一页展示多少条记录
        	lengthChange: true,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
        	responsive: true,//是否需要分页控件,true:需要,false:不需要
            ajax: {
                "url": "<%=contextPath%>/user/getUserList"
				},
				columns : [ {
					"data" : "empid",
					"title" : "员工编号"
				},{
					"data" : "userid",
					"title" : "员工登录名"
				}, {
					"data" : "username",
					"title" : "员工姓名"
				},{
					"data" : "gender",
					"title" : "性别",
					render: function (data, type, row, meta) {
						 if(row.gender =='1'){
							 return '<span>男</span>';
						 }else if (row.status =='0'){
							 return '<span>女</span>';
						 }else if (row.status =='2'){
							 return '<span>保密</span>';
						 }else{
							 return '<span></span>';
						 }
	                 }

				},{
					"data" : "birthdate",
					"title" : "出生日期"
				},{
					"data" : "mobileno",
					"title" : "手机号码"
				},{
					"data" : "htel",
					"title" : "家庭电话"
				},{
					"data" : "status",
					"title" : "员工状态",
					 render: function (data, type, row, meta) {
						 if(row.status =='1'){
							 return '<span style="background-color:#5cb85c;color:#fff">已启用</span>';
						 }else if (row.status =='0'){
							 return '<span style="background-color:#888888;color:#fff">已停用</span>';
						 }
	                 }
				},{
					"data" : "remark",
					"title" : "员工备注"
				}
		         ],
		         columnDefs: [ 
		        	 {
			             targets: 8,
			             data: null,
			             title : "操作",
			             orderable: false,
			             render: function (data, type, row, meta) {
			            	 if(row.status =='1'){
			            		 return '<button type="button" class="btn btn-default btn-circle" onclick="stopStatus('+"'" + row.roleid+"'"+ ');"><i class="fa fa-times"></i></button>' 
								 +'&nbsp'+'&nbsp'+'&nbsp'+ 
								 '<button type="button" class="btn btn-warning" onclick="singleUpt('+"'" + row.roleid+"'"+ ');">修改</button>' 
								 +'&nbsp'+'&nbsp'+'&nbsp'+ 
								 '<button type="button" class="btn btn-danger" onclick="singleDel('+"'" + row.roleid+"'"+ ');">删除</button>';
							 }else if (row.status =='0'){
								 return '<button type="button" class="btn btn-success btn-circle" onclick="openStatus('+"'" + row.roleid+"'"+ ');"><i class="fa fa-check"></i></button>' 
								 +'&nbsp'+'&nbsp'+'&nbsp'+ 
								 '<button type="button" class="btn btn-warning" onclick="singleUpt('+"'" + row.roleid+"'"+ ');">修改</button>' 
								 +'&nbsp'+'&nbsp'+'&nbsp'+ 
								 '<button type="button" class="btn btn-danger" onclick="singleDel('+"'" + row.roleid+"'"+ ');">删除</button>';
							 }
		                       
		                    }
			         }		         
		         ],
				language : {
					loadingRecords : "加载中...",
					processing : "查询中...",
					search : "智能搜索:",
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
        
    	//初始化时间控件
        $('#birthdate').datetimepicker({
            language:  'zh-CN',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
    		autoclose: 1,
    		todayHighlight: 1,
    		startView: 2,
    		minView: 2,
    		forceParse: 0
        });
        
		});
    
    //打开新增员工窗口
    function toAddUser(){
    	$('#userAddModal').modal('show');
    }
    
  	//关闭员工窗口
    function closeModal(par){
  		if(par =="1"){
  			//清空表单验证
    		$('#userAddForm').data('bootstrapValidator').resetForm(); 
    		//清空表单内容
    		$('#userAddForm').resetForm();
  			$("#userAddModal").modal('hide');
  		}else if(par =="2"){
  			$("#userUptModal").modal('hide');
  		}else{
  			$("#confirmDelModal").modal('hide');
  		}
    	
    }
    
    function successAlert(){
    	$("#successAlert").show();
    	//3秒后关闭提示
    	setTimeout('$("#successAlert").hide()',3000);
    }
    
    function dangerAlert(){
    	//失败提示
    	$("#dangerAlert").show();
		
    	//3秒后关闭提示
    	setTimeout('$("#dangerAlert").hide()',3000);
    }
    
    function oneRowAlert(){
    	$("#oneRowAlert").show();
		
    	//3秒后关闭提示
    	setTimeout('$("#oneRowAlert").hide()',3000);
    }
    
    function noRowAlert(){
		$("#noRowAlert").show();
		
    	//3秒后关闭提示
    	setTimeout('$("#noRowAlert").hide()',3000);
    }
    
    function reloadTable(){
    	var userTables = $('#userTables').DataTable();
    	userTables.ajax.reload();
    }
    
    //保存新增员工
    function saveUserAndOper(){
    	
    	var userForm = $('#userAddForm');
    	//验证表单
    	var validator = $('#userAddForm').data('bootstrapValidator');
        
    	if (validator) {
        // 修复记忆的组件不验证
            validator.validate();
            if (!validator.isValid()) {
                return false;
            }
        }
        
        $.ajax({
            type : "post",
            url : userForm.attr("action"),
            data : userForm.serializeArray(),
            dataType : "json",
            cache : false,
            success : function (dataRtn){
            	var rtnStr = dataRtn.rtn;
            	if(rtnStr == "success"){
            		
            		//清空表单验证
            		$('#userAddForm').data('bootstrapValidator').resetForm(); 
            		//清空表单内容
            		$('#userAddForm').resetForm();
            		//关闭窗口
                	closeModal(1);
            		//成功提示
                	successAlert();
            		//列表刷新
                	reloadTable();
            		
            	}else{
            		//清空表单验证
            		$('#userAddForm').data('bootstrapValidator').resetForm(); 
            		
            		//清空表单内容
            		$('#userAddForm').resetForm();
            		
            		//关闭窗口
                	closeModal(1);
            		//成功提示
                	dangerAlert();
            	}
            }
        });

    }
    
    //打开修改角色窗口
    function toUptRole(){
    	var roleTables = $('#roleTables').DataTable();
    	var length = roleTables.rows('.selected').data().length;
    	if(length >1 || length ==0){
    		oneRowAlert();
    	}else{
    		var row = roleTables.rows('.selected').data();
    		var roleid = row[0].roleid;
    		var role = {roleid:roleid};
    		$.ajax({
    			type : "post",
                url : "<%=contextPath%>/role/getRoleByRoleId",
					data : role,
					dataType : "json",
					success : function(dataRtn) {
						var rtnStr = dataRtn.rtn;
						if (rtnStr == "success") {
							$("#roleid").val(dataRtn.role.roleid);
							$("#roleUptid").val(dataRtn.role.roleid);
							$("#rolename").val(dataRtn.role.rolename);
							$("#remark").val(dataRtn.role.remark);
							if(dataRtn.role.status=="1"){
								$("input:radio[value='1']").attr('checked','true');
							}else if(dataRtn.role.status=="0"){
								$("input:radio[value='0']").attr('checked','true');
							}
							$('#roleUptModal').modal('show');
						} else {
							dangerAlert();
						}
					}
				});
			}
		}
    
  //保存修改角色
    function uptRole(){
    	
    	var roleForm = $('#roleUptForm');
    	//验证表单
    	var validator = $('#roleUptForm').data('bootstrapValidator');
        
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
            success : function (dataRtn){
            	var rtnStr = dataRtn.rtn;
            	if(rtnStr == "success"){
            		
            		//清空表单验证
            		$('#roleUptForm').data('bootstrapValidator').resetForm(); 
            		//清空表单内容
            		$('#roleUptForm').resetForm();
            		//关闭窗口
                	closeModal(2);
            		//成功提示
                	successAlert();
            		//列表刷新
                	reloadTable();
            		
            	}else{
            		//清空表单验证
            		$('#roleUptForm').data('bootstrapValidator').resetForm(); 
            		
            		//清空表单内容
            		$('#roleUptForm').resetForm();
            		
            		//关闭窗口
                	closeModal(2);
            		//错误提示
                	dangerAlert();
            	}
            }
        });

    }
  
  		//批量删除角色
		function toDeleteRoles() {
			var roleTables = $('#roleTables').DataTable();
			var length = roleTables.rows('.selected').data().length;
			if (length == 0) {
				noRowAlert();
			} else {
				$("#confirmDelModal").modal('show');
			}
		}

		function deleteRoles() {
			var roleTables = $('#roleTables').DataTable();
			var rows = roleTables.rows('.selected').data();
			var length = roleTables.rows('.selected').data().length;
			var rowIdArray = [];
			for(var i =0; i<length; i++){
				rowIdArray.push(rows[i].roleid);
			}
			
			$.ajax({
	            type : "post",
	            url : "<%=contextPath%>/role/delRole",
	            data : JSON.stringify(rowIdArray),
	            contentType:"application/json",
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	var rtnStr = dataRtn.rtn;
	            	if(rtnStr == "success"){
	            		//关闭窗口
	                	closeModal(3);
	            		//成功提示
	                	successAlert();
	            		//列表刷新
	                	reloadTable();
	            	}else{
	            		//关闭窗口
	                	closeModal(3);
	            		//错误提示
	                	dangerAlert();
	            	}
	            }
	        });
		}
		
		function singleUpt(roleid){
			var role = {roleid:roleid};
    		$.ajax({
    			type : "post",
                url : "<%=contextPath%>/role/getRoleByRoleId",
					data : role,
					dataType : "json",
					success : function(dataRtn) {
						var rtnStr = dataRtn.rtn;
						if (rtnStr == "success") {
							$("#roleid").val(dataRtn.role.roleid);
							$("#roleUptid").val(dataRtn.role.roleid);
							$("#rolename").val(dataRtn.role.rolename);
							$("#remark").val(dataRtn.role.remark);
							if(dataRtn.role.status=="1"){
								$("input:radio[value='1']").attr('checked','true');
							}else if(dataRtn.role.status=="0"){
								$("input:radio[value='0']").attr('checked','true');
							}
							$('#roleUptModal').modal('show');
						} else {
							dangerAlert();
						}
					}
				});
		}
		
		function singleDel(roleid){
			$("#confirmDelModal").modal('show');
		}
		
		function stopStatus(roleid){
			var role = {roleid:roleid,status:"0"};
    		$.ajax({
    			type : "post",
                url : "<%=contextPath%>/role/changeRoleStatus",
					data : role,
					dataType : "json",
					success : function(dataRtn) {
						var rtnStr = dataRtn.rtn;
						if (rtnStr == "success") {
							//成功提示
		                	successAlert();
		            		//列表刷新
		                	reloadTable();
						} else {
							dangerAlert();
						}
					}
				});
		}
		
		function openStatus(roleid){
			var role = {roleid:roleid,status:"1"};
    		$.ajax({
    			type : "post",
                url : "<%=contextPath%>/role/changeRoleStatus",
					data : role,
					dataType : "json",
					success : function(dataRtn) {
						var rtnStr = dataRtn.rtn;
						if (rtnStr == "success") {
							//成功提示
		                	successAlert();
		            		//列表刷新
		                	reloadTable();
						} else {
							dangerAlert();
						}
					}
				});
		}
	</script>
</body>
</html>