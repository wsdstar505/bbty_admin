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
	
	<!-- 新增商品类型 -->
	<div class="modal fade" id="typeAddModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="closeModal(1);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">新增商品类型</h4>
				</div>
				<div class="modal-body">
					<form id="typeAddForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/goodType/saveGoodType" method="post">
						<input type="hidden" id="parTypeIdAdd" name="parTypeIdAdd"/>
						<div class="form-group">
							<label for="typeCode" class="col-sm-2 control-label">类型编码:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="typeCode">
							</div>
						</div>
						<div class="form-group">
							<label for="typeName" class="col-sm-2 control-label">类型名称:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="typeName">
							</div>
						</div>
						<div class="form-group">
							<label for="status" class="col-sm-2 control-label">状态:</label>
							<div class="col-sm-10">
							 <label class="radio-inline">
                             	<input type="radio" name="status" value="1" checked>启用
                             </label>
                             <label class="radio-inline">
                             <input type="radio" name="status" value="0">停用
                             </label>
                             </div>
						</div>
						<div class="form-group">
							<label for="isLeaf" class="col-sm-2 control-label">是否有子类别:</label>
							<div class="col-sm-10">
							 <label class="radio-inline">
                             	<input type="radio" name="isLeaf" value="1" checked>有
                             </label>
                             <label class="radio-inline">
                             <input type="radio" name="isLeaf" value="0">无
                             </label>
                             </div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">备注:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="remark"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="saveType();">保存</button>
							<button type="button" class="btn btn-default"
								onclick="closeModal(1);">关闭</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	
	<div class="row">

		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">商品类别</div>
				<div class="panel-body">
					<div id="tree"></div>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="panel panel-default">
				<div class="panel-heading">商品类别列表</div>
				<div class="panel-body" id="typeMenuDiv">
					<button type="button" class="btn btn-primary"
						onclick="toAddType();">新增</button>
					<button type="button" class="btn btn-warning"
						onclick="toUptType();">修改</button>
					<button type="button" class="btn btn-danger" onclick="toDeleteMeters();">批量删除</button>
				</div>
				<input type="hidden" id="parTypeIdStr" />
				<div class="panel-body" id="typeTableDiv">
					<table class="table table-striped table-bordered table-hover" id="goodTypeTables">
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var goodTypeTree;
		var parTypeIdStr;
		$(function() {
			//隐藏成功提示框
	    	$("#successAlert").hide();
	    	//隐藏失败提示框
	    	$("#dangerAlert").hide();
	    	//隐藏警告提示框
	    	$("#oneRowAlert").hide();
	    	$("#noRowAlert").hide();
	    	
			$("#typeMenuDiv").hide();
			
			$.ajax({
	            type : "post",
	            url : "<%=contextPath%>/goodType/getGoodTypeTree",
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	goodTypeTree = dataRtn.treeList;
	            	
	        		$('#tree').treeview({
	    				data : goodTypeTree,
	    				emptyIcon : "glyphicon glyphicon-book",
	    				onNodeSelected : function(event, data) {
	    					
	    					parTypeIdStr=data.tags;
	    					
	    					$("#parTypeIdStr").val(parTypeIdStr);
	    					
	    					var nodes = data.nodes;
	    					
	    					if(nodes != null){
	    						$("#typeMenuDiv").show();
	    						$("#typeTableDiv").show();
	    						//表格初始化
		    			        $('#goodTypeTables').DataTable({
		    			        	destroy:true,	    			        	
		    			        	pagingType:"full_numbers",//设置分页控件的模式
		    			        	searching: false,//datatales的查询框,true:开启;false:关闭
		    			        	lengthMenu:[10,20,30],//设置一页展示多少条记录
		    			        	lengthChange: false,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
		    			        	responsive: true,//是否需要分页控件,true:需要,false:不需要
		    			        	bDestory:true,
		    			            ajax: {
		    			                "url": "<%=contextPath%>/goodType/getChildGoodTypesByTypeCode?parTypeIdStr="+parTypeIdStr
		    							},
		    							columns : [ {
		    								"data" : "typeCode",
		    								"title" : "类别编码"
		    							}, {
		    								"data" : "typeName",
		    								"title" : "类别名称"
		    							},{
		    								"data" : "status",
		    								"title" : "状态"
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
	    					}else{
	    						$("#typeMenuDiv").hide();
	    						$("#typeTableDiv").hide();
	    					}
	    				}
	    			});
	        		
	        		//折叠树节点
	        		 $('#tree').treeview('collapseAll', {
	     				silent : true
	     			});
	            }
	        });
	
		});
		
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
	    	var goodTypeTables = $('#goodTypeTables').DataTable();
	    	goodTypeTables.ajax.reload();
	    }
	    
	    //关闭商品类型窗口
	    function closeModal(par){
	  		if(par =="1"){
	  			//清空表单验证
	    		//$('#typeAddForm').data('bootstrapValidator').resetForm(); 
	    		//清空表单内容
	    		$('#typeAddForm').resetForm();
	  			$("#typeAddModal").modal('hide');
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
	    
	    //跳转到新增商品类型
		function toAddType(){
			$('#typeAddModal').modal('show');
		}
	    
	    //保存新增商品类型
	    function saveType(){
	    	 var parTypeIdStr = $("#parTypeIdStr").val();
	    	 $("#parTypeIdAdd").val(parTypeIdStr);
	    	 var typeAddForm = $('#typeAddForm');
	    	//验证表单
	    	/*var validator = $('#meterAddForm').data('bootstrapValidator');
	        
	    	if (validator) {
	        // 修复记忆的组件不验证
	            validator.validate();
	            if (!validator.isValid()) {
	                return false;
	            }
	        } */
	        
	        $.ajax({
	            type : "post",
	            url : typeAddForm.attr("action"),
	            data : typeAddForm.serializeArray(),
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	var rtnStr = dataRtn.rtn;
	            	//清空表单验证
	        		//$('#typeAddForm').data('bootstrapValidator').resetForm(); 
	        		//清空表单内容
	        		$('#typeAddForm').resetForm();
	        		
	        		
	        		
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
	            	
	            	var goodTypeTree;
	            	$.ajax({
	    	            type : "post",
	    	            url : "<%=contextPath%>/goodType/getGoodTypeTree",
	    	            dataType : "json",
	    	            cache : false,
	    	            success : function (dataRtn){
	    	            	goodTypeTree = dataRtn.treeList;
	    	            	
	    	        		$('#tree').treeview({
	    	    				data : goodTypeTree,
	    	    				emptyIcon : "glyphicon glyphicon-book",
	    	    				onNodeSelected : function(event, data) {
	    	    					
	    	    					parTypeIdStr=data.tags;
	    	    					
	    	    					$("#parTypeIdStr").val(parTypeIdStr);
	    	    					
	    	    					var nodes = data.nodes;
	    	    					
	    	    					if(nodes != null){
	    	    						$("#typeMenuDiv").show();
	    	    						$("#typeTableDiv").show();
	    	    						//表格初始化
	    		    			        $('#goodTypeTables').DataTable({
	    		    			        	destroy:true,	    			        	
	    		    			        	pagingType:"full_numbers",//设置分页控件的模式
	    		    			        	searching: false,//datatales的查询框,true:开启;false:关闭
	    		    			        	lengthMenu:[10,20,30],//设置一页展示多少条记录
	    		    			        	lengthChange: false,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
	    		    			        	responsive: true,//是否需要分页控件,true:需要,false:不需要
	    		    			        	bDestory:true,
	    		    			            ajax: {
	    		    			                "url": "<%=contextPath%>/goodType/getChildGoodTypesByTypeCode?parTypeIdStr="+parTypeIdStr
	    		    							},
	    		    							columns : [ {
	    		    								"data" : "typeCode",
	    		    								"title" : "类别编码"
	    		    							}, {
	    		    								"data" : "typeName",
	    		    								"title" : "类别名称"
	    		    							},{
	    		    								"data" : "status",
	    		    								"title" : "状态"
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
	    	    					}else{
	    	    						$("#typeMenuDiv").hide();
	    	    						$("#typeTableDiv").hide();
	    	    					}
	    	    				}
	    	    			});
	    	        		
	    	        		//折叠树节点
	    	        		 $('#tree').treeview('collapseAll', {
	    	     				silent : true
	    	     			});
	    	            }
	    	        });
	        		
	            	//列表刷新
	            	reloadTable();
	            }
	        });

	    }
	    
	    
		
		
		
	</script>

</body>