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
	<div class="modal fade bs-example-modal-sm" id="successAlert"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-success btn-circle">
						<i class="fa fa-check"></i>
					</button>
					&nbsp;&nbsp;&nbsp;操作成功！
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 失败提示框 -->
	<div class="modal fade bs-example-modal-sm" id="dangerAlert"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-danger btn-circle">
						<i class="fa fa-times"></i>
					</button>
					&nbsp;&nbsp;&nbsp;操作失败，出现异常！
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 没选择一条警告提示框 -->
	<div class="modal fade bs-example-modal-sm" id="oneRowAlert"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-warning btn-circle">
						<i class="fa fa-exclamation"></i>
					</button>
					&nbsp;&nbsp;&nbsp;请选择一条记录！
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 未选择警告提示框 -->
	<div class="modal fade bs-example-modal-sm" id="noRowAlert"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-warning btn-circle">
						<i class="fa fa-exclamation"></i>
					</button>
					&nbsp;&nbsp;&nbsp;请选择记录！
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade bs-example-modal-sm" id="confirmDelModal"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-warning btn-circle">
						<i class="fa fa-exclamation"></i>
					</button>
					&nbsp;&nbsp;&nbsp;确定要删除选中的员工吗？
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
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
					<button type="button" class="close" data-dismiss="modal"
						onclick="closeModal(1);">
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
							<label for="password" class="col-sm-2 control-label">密码:</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="password">
							</div>
						</div>
						<div class="form-group">
							<label for="repassword" class="col-sm-2 control-label">确认密码:</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="repassword">
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
								<label class="radio-inline"> <input type="radio"
									name="gender" id="genderOpen" value="1" checked>男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="genderStop" value="0">女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="birthdate" class="col-sm-2 control-label">出生日期:</label>
							<div class="col-sm-6 date form_date ">
								<input type="text" class="form-control" id="birthdate" readonly
									name="birthdate">
							</div>
						</div>
						<div class="form-group">
							<label for="mobileno" class="col-sm-2 control-label">手机号码:</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="mobileno">
							</div>
						</div>
						<div class="form-group">
							<label for="usertype" class="col-sm-2 control-label">拥有角色:</label>
							<div class="col-sm-6">
								<select id="roleids" name="roleids" multiple="multiple"
									style="width: 460px">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="status" class="col-sm-2 control-label">状态:</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="status" id="statusOpen" value="1" checked>启用
								</label> <label class="radio-inline"> <input type="radio"
									name="status" id="statusStop" value="0">停用
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

	<!-- 修改员工 -->
	<div class="modal fade" id="userUptModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closeModal(2);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">修改员工</h4>
				</div>
				<div class="modal-body">
					<form id="userUptForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/user/uptUserAndOper" method="post">
						<input type="hidden" name="empid" id="empid">
						<div class="form-group">
							<label for="userid" class="col-sm-2 control-label">登录名:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="userid"
									id="userid" readonly="readonly">

							</div>
						</div>
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">姓名:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="username"
									id="username">
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="col-sm-2 control-label">性别:</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="uptGenderMan" value="1">男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="uptGenderWoman" value="0">女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="birthdate" class="col-sm-2 control-label">出生日期:</label>
							<div class="col-sm-6 date form_date ">
								<input type="text" class="form-control" id="uptBirthdate"
									readonly name="birthdate">
							</div>
						</div>
						<div class="form-group">
							<label for="mobileno" class="col-sm-2 control-label">手机号码:</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="mobileno"
									id="mobileno">
							</div>
						</div>
						<div class="form-group">
							<label for="usertype" class="col-sm-2 control-label">拥有角色:</label>
							<div class="col-sm-6">
								<select id="uptRoleids" name="roleids" style="width: 460px"></select>
							</div>
						</div>
						<div class="form-group">
							<label for="status" class="col-sm-2 control-label">状态:</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="status" id="uptStatusOpen" value="1">启用
								</label> <label class="radio-inline"> <input type="radio"
									name="status" id="uptStatusStop" value="0">停用
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="remark" class="col-sm-2 control-label">备注:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="remark"
									id="remark"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="uptUserAndOper();">保存</button>
							<button type="button" class="btn btn-default"
								onclick="closeModal(2);">关闭</button>
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
					<button type="button" class="btn btn-danger"
						onclick="toDeleteUsers();">批量删除</button>
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
	                password: {
	                    message:'密码无效',
	                    validators: {
	                        notEmpty: {
	                            message: '密码不能为空'
	                        },
	                        different: {//不能和用户名相同
	                            field: 'userid',//需要进行比较的input name值
	                            message: '不能和登录名相同'
	                        }
	                    }
	                },
	                repassword: {
	                    message: '密码无效',
	                    validators: {
	                        notEmpty: {
	                            message: '密码不能为空'
	                        },
	                        identical: {//相同
	                            field: 'password',
	                            message: '两次密码不一致'
	                        },
	                        different: {//不能和用户名相同
	                            field: 'userid',
	                            message: '不能和登录名相同'
	                        }
	                    }
	                },
	                roleids: {/*键名username和input name值对应*/
	                    message: '拥有角色无效',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '拥有角色不能为空'
	                        }
	                    }
	                }
	            }
	        });
    	
      	//修改员工表单校验
    	$('#userUptForm').bootstrapValidator({
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
                roleids: {/*键名username和input name值对应*/
                    message: '拥有角色无效',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '拥有角色不能为空'
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
				columns : [ 
				{
					"data":"empid",
					render:function(data,type,full,meta){
						return '<input type="checkbox" class="checkchild" value="'+data+'" onclick="checkChange('+data+');"/>';
					},
					"sortable":false
				},	
				{
					"data" : "userid",
					"title" : "登录名"
				}, {
					"data" : "username",
					"title" : "姓名"
				},{
					"data" : "gender",
					"title" : "性别",
					render: function (data, type, row, meta) {
						 if(row.gender =='1'){
							 return '<span>男</span>';
						 }else if (row.gender =='0'){
							 return '<span>女</span>';
						 }else if (row.gender =='2'){
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
					"data" : "status",
					"title" : "员工状态",
					 render: function (data, type, row, meta) {
						 if(row.status =='1'){
							 return '<span style="background-color:#5cb85c;color:#fff">已启用</span>';
						 }else if (row.status =='0'){
							 return '<span style="background-color:#888888;color:#fff">已停用</span>';
						 }
	                 }
				}
		         ],
		         columnDefs: [ 
		        	 {
			             targets: 7,
			             data: null,
			             title : "操作",
			             orderable: false,
			             render: function (data, type, row, meta) {
			            	 if(row.status =='1'){
			            		 return '<button type="button" class="btn btn-default btn-circle" onclick="stopStatus('+"'" + row.empid+"'"+ ');"><i class="fa fa-times"></i></button>' 
								 +'&nbsp'+'&nbsp'+'&nbsp'+ 
								 '<button type="button" class="btn btn-warning" onclick="singleUpt('+"'" + row.empid+"'"+ ');">修改</button>' 
								 +'&nbsp'+'&nbsp'+'&nbsp'+ 
								 '<button type="button" class="btn btn-danger" onclick="singleDel('+"'" + row.empid+"'"+ ');">删除</button>';
							 }else if (row.status =='0'){
								 return '<button type="button" class="btn btn-success btn-circle" onclick="openStatus('+"'" + row.empid+"'"+ ');"><i class="fa fa-check"></i></button>' 
								 +'&nbsp'+'&nbsp'+'&nbsp'+ 
								 '<button type="button" class="btn btn-warning" onclick="singleUpt('+"'" + row.empid+"'"+ ');">修改</button>' 
								 +'&nbsp'+'&nbsp'+'&nbsp'+ 
								 '<button type="button" class="btn btn-danger" onclick="singleDel('+"'" + row.empid+"'"+ ');">删除</button>';
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
       /*  $('#userTables tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');
        } ); */
        
    	//初始化新增时的时间控件
        $('#birthdate').datetimepicker({
            language:  'zh-CN',
            format: 'yyyymmdd',
            weekStart: 1,
            todayBtn:  1,
    		autoclose: 1,
    		todayHighlight: 1,
    		startView: 2,
    		minView: 2,
    		forceParse: 0
        });
    	
      //初始化修改时的时间控件
        $('#uptBirthdate').datetimepicker({
            language:  'zh-CN',
            format: 'yyyymmdd',
            weekStart: 1,
            todayBtn:  1,
    		autoclose: 1,
    		todayHighlight: 1,
    		startView: 2,
    		minView: 2,
    		forceParse: 0
        });
        
    	//在窗口关闭时清除验证、select内容和表单内容（用于没有点击关闭按钮的窗口关闭）
        /* $('#userAddModal').on('hide.bs.modal', function () {
        	//清空表单验证
			$('#userAddForm').data('bootstrapValidator').resetForm();
			$("#roleids").empty();
			//清空表单内容
			$('#userAddForm').resetForm();
        }); */
        
    	//初始化新增的select控件
        $("#roleids").select2({
        	 placeholder: "请选择角色",
        	 allowClear: true,
        	 closeOnSelect: false,
        	 separator: ",",  
        	 ajax: {
        		 url: "<%=contextPath%>/role/getRoleJson",
        		 dataType: 'json',
        		 delay: 250,
        		 processResults: function (data, params) {
        		      return {
        		        results: data.roleJsons,
        		      };
        		 },
        		 cache: true
        	 }
        });
        
		});

		//打开新增员工窗口
		function toAddUser() {
			$('#userAddModal').modal('show');
		}
		
		//关闭员工窗口(新增、修改)
		function closeModal(par) {
			if (par == "1") {
				//清空表单验证
				$('#userAddForm').data('bootstrapValidator').resetForm();
				$("#roleids").empty();
				//清空表单内容
				$('#userAddForm').resetForm();
				$("#userAddModal").modal('hide');
			} else if (par == "2") {
				//清空表单验证
				$('#userUptForm').data('bootstrapValidator').resetForm();
				$("#uptRoleids").empty();
				//清空表单内容
				$('#userUptForm').resetForm();
				$("#userUptModal").modal('hide');
			} else {
				$("#confirmDelModal").modal('hide');
			}

		}

		function successAlert(){
	    	$("#successAlert").modal('show');
	    	//setTimeout('$("#successAlert").hide()',3000);
	    }
	    
	    function dangerAlert(){
	    	$("#dangerAlert").modal('show');
	    }
	    
	    function oneRowAlert(){
	    	$("#oneRowAlert").modal('show');
	    }
	    
	    function noRowAlert(){
			$("#noRowAlert").modal('show');
	    }

		function reloadTable() {
			var userTables = $('#userTables').DataTable();
			userTables.ajax.reload();
		}

		//保存新增员工
		function saveUserAndOper() {

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
				success : function(dataRtn) {
					var rtnStr = dataRtn.rtn;
					//清空表单验证
					$('#userAddForm').data('bootstrapValidator').resetForm();
					//清空角色select
					$("#roleids").empty();
					//清空表单内容
					$('#userAddForm').resetForm();
					
					
					if (rtnStr == "success") {
						//关闭窗口
						closeModal(1);
						//成功提示
						successAlert();
					} else {
						//关闭窗口
						closeModal(1);
						//成功提示
						dangerAlert();
					}
					//列表刷新
					reloadTable();
				}
			});

		}

		//打开修改员工窗口
		function toUptUser() {
			/* var userTables = $('#userTables').DataTable();
			var length = userTables.rows('.selected').data().length;
			if (length > 1 || length == 0) {
				oneRowAlert();
			} else { */
				
			if($(".checkchild:checked").length == 0 || $(".checkchild:checked").length >1){
					oneRowAlert();
				}else{	
		
				/* var row = userTables.rows('.selected').data();
				var userid = row[0].userid;
				var user = {
					userid : userid
				}; */
				
				var empid = $(".checkchild:checked").val();
	    		var user = {empid:empid};
	    		
				$.ajax({
					type : "post",
					url : "<%=contextPath%>/user/getUser",
					data : user,
					dataType : "json",
					success : function(dataRtn) {
						var rtnStr = dataRtn.rtn;
						if (rtnStr == "success") {
							
							$("#remark").val(dataRtn.user.remark);
							$("#empid").val(dataRtn.user.empid);
							$("#userid").val(dataRtn.user.userid);
							$("#username").val(dataRtn.user.username);
							var gender = dataRtn.user.gender;
							if(gender=="1"){
								$("#uptGenderMan").attr('checked','true');
							}
							if(gender=="0"){
								$("#uptGenderWoman").attr('checked','true');
							}
							if(dataRtn.user.status=="1"){
								$("#uptStatusOpen").attr('checked','true');
							}
							if(dataRtn.user.status=="0"){
								$("#uptStatusStop").attr('checked','true');
							}
							$('#uptBirthdate').val(dataRtn.user.birthdate);
							$('#mobileno').val(dataRtn.user.mobileno);
							
							$("#uptRoleids").select2({
	        	 				placeholder: "请选择角色",
	        	 				allowClear: true,
	        	 				closeOnSelect: false,
	        	 				multiple:true,
	        	 				ajax: {
	        		 				url: "<%=contextPath%>/role/getRoleJson",
	        		 				dataType: 'json',
	        		 				delay: 250,
	        		 				processResults: function (data, params) {
	        		      				return {
	        		        				results: data.roleJsons,
	        		      				};
	        		 				}
	        	 				}
	        				});
							
							var roleJsons = dataRtn.roleJsons;
							var roleids = new Array();
							for(var i=0;i<roleJsons.length;i++){
								var ht = $("#uptRoleids").html();
								if(ht == ""){
									$("#uptRoleids").html('<option value='+roleJsons[i].id+'>'+roleJsons[i].text+'</option>');
								}else{
									ht=ht+'<option value='+roleJsons[i].id+'>'+roleJsons[i].text+'</option>';
									$("#uptRoleids").html(ht);
								}
								roleids[i]=roleJsons[i].id;
							}
							$("#uptRoleids").val(roleids).trigger("change");
							$('#userUptModal').modal('show');
						} else {
							dangerAlert();
						}
					}
				});
			}
		}
    
  //保存修改员工
    function uptUserAndOper(){
    	
    	var userForm = $('#userUptForm');
    	//验证表单
    	var validator = $('#userUptForm').data('bootstrapValidator');
        
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
            	//清空表单验证
        		$('#userUptForm').data('bootstrapValidator').resetForm(); 
        		//清空表单内容
        		$('#userUptForm').resetForm();
        		//清空角色select
        		$("#uptRoleids").empty();
        		
            	if(rtnStr == "success"){
            		//关闭窗口
                	closeModal(2);
            		//成功提示
                	successAlert();
            	}else{
            		//关闭窗口
                	closeModal(2);
            		//错误提示
                	dangerAlert();
            	}
            	//列表刷新
            	reloadTable();
            }
        });

    }
    
  		//跳转到批量删除员工确认框
		function toDeleteUsers() {
		/* 	var userTables = $('#userTables').DataTable();
			var length = userTables.rows('.selected').data().length;
			if (length == 0) {
				noRowAlert();
			} else {
				$("#confirmDelModal").modal('show');
			} */
			
			if($(".checkchild:checked").length == 0){
				noRowAlert();
			}else{
				$("#confirmDelModal").modal('show');
			}
		}

  		//批量删除员工
		function deleteUsers() {
/* 			var userTables = $('#userTables').DataTable();
			var rows = userTables.rows('.selected').data();
			var length = userTables.rows('.selected').data().length;
			var rowIdArray = [];
			for(var i =0; i<length; i++){
				rowIdArray.push(rows[i].userid);
			} */
			
			var rowIdArray = [];
			var length = $(".checkchild:checked").length;
			$(".checkchild:checked").each(function(){
				rowIdArray.push($(this).val());
			});
			
			$.ajax({
	            type : "post",
	            url : "<%=contextPath%>/user/delUserAndOperAndRole",
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
		
		function singleUpt(empid){
			
			$(".checkchild").each(function(){
				if(empid == $(this).val()){
					 if (true == $(this).attr("checked")) {
						 this.checked=false;
	                } else {
	                    this.checked=true;
	                }
				}
			});
			
			var user = {
					empid : empid
				};
			
			if($(".checkchild:checked").length == 0 || $(".checkchild:checked").length >1){
				oneRowAlert();
			}else{
				$.ajax({
					type : "post",
					url : "<%=contextPath%>/user/getUser",
					data : user,
					dataType : "json",
					success : function(dataRtn) {
						var rtnStr = dataRtn.rtn;
						if (rtnStr == "success") {
							
							$("#remark").val(dataRtn.user.remark);
							$("#empid").val(dataRtn.user.empid);
							$("#userid").val(dataRtn.user.userid);
							$("#username").val(dataRtn.user.username);
							var gender = dataRtn.user.gender;
							if(gender=="1"){
								$("#uptGenderMan").attr('checked','true');
							}
							if(gender=="0"){
								$("#uptGenderWoman").attr('checked','true');
							}
							if(dataRtn.user.status=="1"){
								$("#uptStatusOpen").attr('checked','true');
							}
							if(dataRtn.user.status=="0"){
								$("#uptStatusStop").attr('checked','true');
							}
							$('#uptBirthdate').val(dataRtn.user.birthdate);
							$('#mobileno').val(dataRtn.user.mobileno);
							
							$("#uptRoleids").select2({
	        	 				placeholder: "请选择角色",
	        	 				allowClear: true,
	        	 				closeOnSelect: false,
	        	 				multiple:true,
	        	 				ajax: {
	        		 				url: "<%=contextPath%>/role/getRoleJson",
	        		 				dataType: 'json',
	        		 				delay: 250,
	        		 				processResults: function (data, params) {
	        		      				return {
	        		        				results: data.roleJsons,
	        		      				};
	        		 				}
	        	 				}
	        				});
							
							var roleJsons = dataRtn.roleJsons;
							var roleids = new Array();
							for(var i=0;i<roleJsons.length;i++){
								var ht = $("#uptRoleids").html();
								if(ht == ""){
									$("#uptRoleids").html('<option value='+roleJsons[i].id+'>'+roleJsons[i].text+'</option>');
								}else{
									ht=ht+'<option value='+roleJsons[i].id+'>'+roleJsons[i].text+'</option>';
									$("#uptRoleids").html(ht);
								}
								roleids[i]=roleJsons[i].id;
							}
							$("#uptRoleids").val(roleids).trigger("change");
							$('#userUptModal').modal('show');
						} else {
							dangerAlert();
						}
					}
				});
			}
			
			
    		
		}
		
		function singleDel(empid){
			$(".checkchild").each(function(){
				if(empid == $(this).val()){
					 if (true == $(this).attr("checked")) {
						 this.checked=false;
	                } else {
	                    this.checked=true;
	                }
				}
			});
			 if($(".checkchild:checked").length == 0){
				noRowAlert();
			}else{
				$("#confirmDelModal").modal('show');
			}
		}
		
		//员工状态-更新为已停用
		function stopStatus(empid){
			
			$(".checkchild").each(function(){
				if(empid == $(this).val()){
					 if (true == $(this).attr("checked")) {
						 this.checked=false;
	                } else {
	                    this.checked=true;
	                }
				}
			});
			
			var user = {empid:empid,status:"0"};
			
			if($(".checkchild:checked").length == 0 || $(".checkchild:checked").length >1){
				oneRowAlert();
			}else{
				$.ajax({
	    			type : "post",
	                url : "<%=contextPath%>/user/changeUserStatus",
						data : user,
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
		}
		
		//员工状态-更新为已启用
		function openStatus(empid){
			$(".checkchild").each(function(){
				if(empid == $(this).val()){
					 if (true == $(this).attr("checked")) {
						 this.checked=false;
	                } else {
	                    this.checked=true;
	                }
				}
			});
			
			var user = {empid:empid,status:"1"};
			
			if($(".checkchild:checked").length == 0 || $(".checkchild:checked").length >1){
				oneRowAlert();
			}else{
				$.ajax({
	    			type : "post",
	    			  url : "<%=contextPath%>/user/changeUserStatus",
						data : user,
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
		}
	</script>
</body>
</html>