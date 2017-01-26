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

	<!-- 删除计量单位确认提示框 -->
	<div class="modal fade bs-example-modal-sm" id="confirmDelModal"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-warning btn-circle">
						<i class="fa fa-exclamation"></i>
					</button>
					&nbsp;&nbsp;&nbsp;确定要删除选中的计量单位吗？
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						onclick="deleteMeters();">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 新增计量单位 -->
	<div class="modal fade" id="meterAddModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closeModal(1);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">新增计量单位</h4>
				</div>
				<div class="modal-body">
					<form id="meterAddForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/meter/saveMeter" method="post">
						<div class="form-group">
							<label for="meterCode" class="col-sm-2 control-label">计量编码:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="meterCode">
							</div>
						</div>
						<div class="form-group">
							<label for="meterName" class="col-sm-2 control-label">计量名称:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="meterName">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="saveMeter();">保存</button>
							<button type="button" class="btn btn-default"
								onclick="closeModal(1);">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改计量单位 -->
	<div class="modal fade" id="meterUptModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closeModal(2);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">修改计量单位</h4>
				</div>
				<div class="modal-body">
					<form id="meterUptForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/meter/uptMeter" method="post">
						<input type="hidden" name="meterId" id="meterId">
						<div class="form-group">
							<label for="meterCode" class="col-sm-2 control-label">计量编码:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="meterCode"
									id="meterCode" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="meterName" class="col-sm-2 control-label">计量名称:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="meterName"
									id="meterName">
							</div>
						</div>
						<div class="form-group">
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									onclick="uptMeter();">保存</button>
								<button type="button" class="btn btn-default"
									onclick="closeModal(2);">关闭</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 计量单位配置管理列表 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">计量单位配置管理列表</div>
				<div class="panel-body">
					<button type="button" class="btn btn-primary"
						onclick="toAddMeter();">新增</button>
					<button type="button" class="btn btn-warning"
						onclick="toUptMeter();">修改</button>
					<button type="button" class="btn btn-danger"
						onclick="toDeleteMeters();">批量删除</button>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover"
						id="meterTables">
					</table>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
    $(function() {
    	
    	//新增计量表单校验
    	$('#meterAddForm').bootstrapValidator({
	            message: 'This value is not valid',
	            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {/*验证*/
	            	meterCode: {/*键名username和input name值对应*/
	                    message: '计量单位编码无效',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '计量单位编码不能为空'
	                        },
	                        remote: {
	                        	url: '<%=contextPath%>/meter/checkMeterCode',
	                            message: '计量单位编码已存在',//提示消息
	                            type: 'post'//请求方式
	                        }
	                    }
	                },
	                meterName: {
	                    message:'计量单位名称无效',
	                    validators: {
	                        notEmpty: {
	                            message: '计量单位名称不能为空'
	                        }
	                    }
	                }
	            }
	        });
    	
      	//修改计量表单校验
    	$('#meterUptForm').bootstrapValidator({
	            message: 'This value is not valid',
	            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {/*验证*/
	            	meterCode: {/*键名username和input name值对应*/
	                    message: '计量单位编码无效',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '计量单位编码不能为空'
	                        }
	                    }
	                },
	                meterName: {
	                    message:'计量单位名称无效',
	                    validators: {
	                        notEmpty: {
	                            message: '计量单位名称不能为空'
	                        }
	                    }
	                }
	            }
	        });
      	
    	//表格初始化
        $('#meterTables').DataTable({
        	pagingType:"full_numbers",//设置分页控件的模式
        	searching: true,//datatales的查询框,true:开启;false:关闭
        	lengthMenu:[10,20,30],//设置一页展示多少条记录
        	lengthChange: true,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
        	responsive: true,//是否需要分页控件,true:需要,false:不需要
            ajax: {
                "url": "<%=contextPath%>/meter/getMeterList"
				},
				columns : [ 
				{
					"data":"meterId",
					render:function(data,type,full,meta){
						return '<input type="checkbox" class="checkchild" value="'+data+'" onclick="checkChange('+data+');"/>';
					},
					"sortable":false
				},
				{
					"data" : "meterCode",
					"title" : "计量单位编码"
				}, 
				{
					"data" : "meterName",
					"title" : "计量单位名称"
				}
		         ],
		         columnDefs: [ {
		             targets: 3,
		             data: null,
		             title : "操作",
		             orderable: false,
		             render: function (data, type, row, meta) {
		            		 return  '<button type="button" class="btn btn-warning" onclick="singleUpt('+"'" + row.meterId+"'"+ ');">修改</button>' 
							 +'&nbsp'+'&nbsp'+'&nbsp'+
							 '<button type="button" class="btn btn-danger" onclick="singleDel('+"'" + row.meterId+"'"+ ');">删除</button>';
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
/*         $('#meterTables tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');
        } ); */
        
		});
    
    function checkChange(meterId){
    	$(".checkchild").each(function(){
    		if(meterId == $(this).val()){
    			if ($(this).attr('checked')) {
    				$(this).removeAttr("checked");
                } else {
                	$(this).attr('checked',true);
                }
    		}
		});
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
    
    function reloadTable(){
    	var meterTables = $('#meterTables').DataTable();
    	meterTables.ajax.reload();
    }
    
    //打开新增计量窗口
    function toAddMeter(){
    	$('#meterAddModal').modal('show');
    }
    
  //关闭计量窗口
    function closeModal(par){
  		if(par =="1"){
  			//清空表单验证
    		$('#meterAddForm').data('bootstrapValidator').resetForm(); 
    		//清空表单内容
    		$('#meterAddForm').resetForm();
  			$("#meterAddModal").modal('hide');
  		}else if(par =="2"){
  			//清空表单验证
    		$('#meterUptForm').data('bootstrapValidator').resetForm(); 
    		//清空表单内容
    		$('#meterUptForm').resetForm();
  			$("#meterUptModal").modal('hide');
  		}else{
  			$("#confirmDelModal").modal('hide');
  		}
    }
  
    //保存新增计量单位
    function saveMeter(){
    	
    	var meterForm = $('#meterAddForm');
    	//验证表单
    	var validator = $('#meterAddForm').data('bootstrapValidator');
        
    	if (validator) {
        // 修复记忆的组件不验证
            validator.validate();
            if (!validator.isValid()) {
                return false;
            }
        }
        
        $.ajax({
            type : "post",
            url : meterForm.attr("action"),
            data : meterForm.serializeArray(),
            dataType : "json",
            cache : false,
            success : function (dataRtn){
            	var rtnStr = dataRtn.rtn;
            	//清空表单验证
        		$('#meterAddForm').data('bootstrapValidator').resetForm(); 
        		//清空表单内容
        		$('#meterAddForm').resetForm();
        		
            	if(rtnStr == "success"){
            		//关闭窗口
                	closeModal(1);
            		//成功提示
                	successAlert();
            		
            	}else{
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
    
    //打开修改计量窗口
    function toUptMeter(){
    /* 	var meterTables = $('#meterTables').DataTable();
    	var length = meterTables.rows('.selected').data().length;
    	if(length >1 || length ==0){
    		oneRowAlert();
    	} */
    	if($(".checkchild:checked").length == 0 || $(".checkchild:checked").length >1){
			oneRowAlert();
		}else{
    		/* var row = meterTables.rows('.selected').data();
    		var meterCode = row[0].meterCode;
    		var meter = {meterCode:meterCode}; */
    		
    		var meterId = $(".checkchild:checked").val();
    		var meter = {meterId:meterId};
    		$.ajax({
    			type : "post",
                url : "<%=contextPath%>/meter/getMeter",
					data : meter,
					dataType : "json",
					success : function(dataRtn) {
						var rtnStr = dataRtn.rtn;
						if (rtnStr == "success") {
							$("#meterId").val(dataRtn.meter.meterId);
							$("#meterCode").val(dataRtn.meter.meterCode);
							$("#meterName").val(dataRtn.meter.meterName);
							$('#meterUptModal').modal('show');
						} else {
							dangerAlert();
						}
					}
				});
			}
		}
    
    //保存修改计量
    function uptMeter(){
    	
    	var meterForm = $('#meterUptForm');
    	//验证表单
    	var validator = $('#meterUptForm').data('bootstrapValidator');
        
    	if (validator) {
        // 修复记忆的组件不验证
            validator.validate();
            if (!validator.isValid()) {
                return false;
            }
        }
        
        $.ajax({
            type : "post",
            url : meterForm.attr("action"),
            data : meterForm.serializeArray(),
            dataType : "json",
            cache : false,
            success : function (dataRtn){
            	var rtnStr = dataRtn.rtn;
            	
            	//清空表单验证
        		$('#meterUptForm').data('bootstrapValidator').resetForm(); 
        		//清空表单内容
        		$('#meterUptForm').resetForm();
        		
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
    
  //批量删除计量单位
	function toDeleteMeters() {
/* 		var meterTables = $('#meterTables').DataTable();
		var length = meterTables.rows('.selected').data().length;
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
  
	function deleteMeters() {
/* 		var meterTables = $('#meterTables').DataTable();
		var rows = meterTables.rows('.selected').data();
		var length = meterTables.rows('.selected').data().length;
		var rowIdArray = [];
		for(var i =0; i<length; i++){
			rowIdArray.push(rows[i].meterCode);
		} */
		
		var rowIdArray = [];
		var length = $(".checkchild:checked").length;
		$(".checkchild:checked").each(function(){
			rowIdArray.push($(this).val());
		});
		
		$.ajax({
            type : "post",
            url : "<%=contextPath%>/meter/delMeter",
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
            	}else{
            		//关闭窗口
                	closeModal(3);
            		//错误提示
                	dangerAlert();
            	}
            	
            	//列表刷新
            	reloadTable();
            }
        });
	}
    
	function singleDel(meterId){
		$(".checkchild").each(function(){
			if(meterId == $(this).val()){
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
	
	function singleUpt(meterId){
		$(".checkchild").each(function(){
			if(meterId == $(this).val()){
				 if (true == $(this).attr("checked")) {
					 this.checked=false;
                } else {
                    this.checked=true;
                }
			}
		});
		
		var meter = {meterId:meterId};
		
		if($(".checkchild:checked").length == 0 || $(".checkchild:checked").length >1){
			oneRowAlert();
		}else{
			$.ajax({
				type : "post",
				  url : "<%=contextPath%>/meter/getMeter",
					data : meter,
					dataType : "json",
					success : function(dataRtn) {
						var rtnStr = dataRtn.rtn;
						if (rtnStr == "success") {
							$("#meterId").val(dataRtn.meter.meterId);
							$("#meterCode").val(dataRtn.meter.meterCode);
							$("#meterName").val(dataRtn.meter.meterName);
							$('#meterUptModal').modal('show');
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