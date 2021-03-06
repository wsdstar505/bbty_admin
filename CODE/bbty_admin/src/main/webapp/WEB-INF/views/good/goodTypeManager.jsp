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
	
	<!-- 删除商品类型确认提示框 -->
	<div class="modal fade bs-example-modal-lg" id="confirmDelModal"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-warning btn-circle">
						<i class="fa fa-exclamation"></i>
					</button>
					&nbsp;&nbsp;&nbsp;确定要删除选中的商品子类别吗？若商品类别下还有子类别则一并删除子类别!
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						onclick="deleteTypes();">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	
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
							<label for="typeCode" class="col-sm-2 control-label">类型编码:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="typeCode">
							</div>
						</div>
						<div class="form-group">
							<label for="typeName" class="col-sm-2 control-label">类型名称:<font color='red'>*</font></label>
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
	
	<!-- 修改商品类型 -->
	<div class="modal fade" id="typeUptModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="closeModal(2);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">修改商品类型</h4>
				</div>
				<div class="modal-body">
					<form id="typeUptForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/goodType/uptGoodType" method="post">
						<input type="hidden" id="typeId" name="typeId"/>
						<input type="hidden" id="parTypeIdUpt" name="parTypeIdUpt"/>
						<input type="hidden" id="typeSrcCode" name="typeSrcCode"/>
						<div class="form-group">
							<label for="typeCode" class="col-sm-2 control-label">类型编码:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="typeUptCode" id="typeCode" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="typeName" class="col-sm-2 control-label">类型名称:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="typeUptName" id="typeName">
							</div>
						</div>
						<div class="form-group">
							<label for="status" class="col-sm-2 control-label">状态:</label>
							<div class="col-sm-10">
							 <label class="radio-inline">
                             	<input type="radio" name="status" id="statusOpen" value="1">启用
                             </label>
                             <label class="radio-inline">
                             <input type="radio" name="status" id="statusStop" value="0">停用
                             </label>
                             </div>
						</div>
						<div class="form-group">
							<label for="isLeaf" class="col-sm-2 control-label">是否有子类别:</label>
							<div class="col-sm-10">
							
							<input type="hidden" name="isSrcLeaf" id="isSrcLeaf"/>
							
							 <label class="radio-inline">
                             	<input type="radio" name="isLeaf" id="isLeaf" value="1">有
                             </label>
                             <label class="radio-inline">
                             	<input type="radio" name="isLeaf" id="noLeaf" value="0">无
                             </label>
                             </div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">备注:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="remark" id="remark"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="uptType();">保存</button>
							<button type="button" class="btn btn-default"
								onclick="closeModal(2);">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">

		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">商品分类</div>
				<div class="panel-body">
					<div id="tree"></div>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="panel panel-default">
				<div class="panel-heading">商品类别信息列表</div>
				<div class="panel-body" id="typeMenuDiv">
					<button type="button" class="btn btn-primary"
						onclick="toAddType();">新增类别</button>
					<button type="button" class="btn btn-warning"
						onclick="toUptType();">修改类别</button>
					<button type="button" class="btn btn-danger" onclick="toDeleteTypes();">批量删除类别</button>
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
	    						if(nodes != null || parTypeIdStr == "1"){
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
			    							columns : [ 
			    							{
				    								"data":"typeId",
				    								render:function(data,type,full,meta){
				    									return '<input type="checkbox" class="checkchild" value="'+data+'" />';
				    								},
				    								"sortable":false
				    						},{
			    								"data" : "typeCode",
			    								"title" : "类别编码"
			    							}, {
			    								"data" : "typeName",
			    								"title" : "类别名称"
			    							},{
			    								"data" : "isLeaf",
			    								"title" : "是否有子类别",
			    								 render: function (data, type, row, meta) {
			    									 if(row.isLeaf =='1'){
			    										 return '<span>有</span>';
			    									 }else if (row.isLeaf =='0'){
			    										 return '<span>无</span>';
			    									 }
			    				                 }
			    							},{
			    								"data" : "status",
			    								"title" : "状态",
			    								 render: function (data, type, row, meta) {
			    									 if(row.status =='1'){
			    										 return '<span style="background-color:#5cb85c;color:#fff">已启用</span>';
			    									 }else if (row.status =='0'){
			    										 return '<span style="background-color:#888888;color:#fff">已停用</span>';
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
			
			
			
			//新增商品类别表单校验
	    	$('#typeAddForm').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {/*验证*/
		            	typeCode: {/*键名username和input name值对应*/
		                    message: '类型编码无效',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '类型编码不能为空'
		                        },
		                        remote: {
		                        	url: '<%=contextPath%>/goodType/checkAddTypeCode',
		                            message: '类型编码已存在',//提示消息
		                            type: 'post'//请求方式
		                        }
		                    }
		                },
		                typeName: {
		                    message:'类型名称无效',
		                    validators: {
		                        notEmpty: {
		                            message: '类型名称不能为空'
		                        }
		                    }
		                }
		            }
		        });
			
			
	    	//修改商品类别表单校验
	    	$('#typeUptForm').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {/*验证*/
		            	typeUptCode: {/*键名username和input name值对应*/
		                    message: '类型编码无效',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '类型编码不能为空'
		                        }
		                    }
		                },
		                typeUptName: {
		                    message:'类型名称无效',
		                    validators: {
		                        notEmpty: {
		                            message: '类型名称不能为空'
		                        }
		                    }
		                }
		            }
	    	});

		});
		
		 
		function successAlert() {
			$("#successAlert").modal('show');
			//setTimeout('$("#successAlert").hide()',3000);
		}

		function dangerAlert() {
			$("#dangerAlert").modal('show');
		}

		function oneRowAlert() {
			$("#oneRowAlert").modal('show');
		}

		function noRowAlert() {
			$("#noRowAlert").modal('show');
		}

		function reloadTable() {
			var goodTypeTables = $('#goodTypeTables').DataTable();
			goodTypeTables.ajax.reload();
		}

		//关闭商品类型窗口
		function closeModal(par) {
			if (par == "1") {
				//清空表单验证
				$('#typeAddForm').data('bootstrapValidator').resetForm();
				//清空表单内容
				$('#typeAddForm').resetForm();
				$("#typeAddModal").modal('hide');
			} else if (par == "2") {
				//清空表单验证
				$('#typeUptForm').data('bootstrapValidator').resetForm();
				//清空表单内容
				$('#typeUptForm').resetForm();

				$("#statusOpen").removeAttr("checked");
				$("#statusStop").removeAttr("checked");
				$("#isLeaf").removeAttr("checked");
				$("#noLeaf").removeAttr("checked");

				$("#typeUptModal").modal('hide');
			} else {
				$("#confirmDelModal").modal('hide');
			}

		}

		//跳转到新增商品类型
		function toAddType() {
			$('#typeAddModal').modal('show');
		}

		//保存新增商品类型
		function saveType() {
			var parTypeIdStr = $("#parTypeIdStr").val();
			$("#parTypeIdAdd").val(parTypeIdStr);
			var typeAddForm = $('#typeAddForm');
			//验证表单
			var validator = $('#typeAddForm').data('bootstrapValidator');

			if (validator) {
				// 修复记忆的组件不验证
				validator.validate();
				if (!validator.isValid()) {
					return false;
				}
			}

			$.ajax({
				type : "post",
				url : typeAddForm.attr("action"),
				data : typeAddForm.serializeArray(),
				dataType : "json",
				cache : false,
				success : function(dataRtn) {
					var rtnStr = dataRtn.rtn;
					//清空表单验证
					$('#typeAddForm').data('bootstrapValidator').resetForm();
					//清空表单内容
					$('#typeAddForm').resetForm();

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

					//树刷新
					reloadTree();
					//列表刷新
					reloadTable();
				}
			});

		}

		//跳转到删除商品类别
		function toDeleteTypes() {
			/* var goodTypeTables = $('#goodTypeTables').DataTable();
			var length = goodTypeTables.rows('.selected').data().length;
			if (length == 0) {
				noRowAlert();
			} else {
				$("#confirmDelModal").modal('show');
			} */

			if ($(".checkchild:checked").length == 0) {
				noRowAlert();
			} else {
				$("#confirmDelModal").modal('show');
			}
		}

		//删除商品类别
		function deleteTypes() {
			/* var goodTypeTables = $('#goodTypeTables').DataTable();
			var rows = goodTypeTables.rows('.selected').data();
			var length = goodTypeTables.rows('.selected').data().length;
			var rowIdArray = [];
			for(var i =0; i<length; i++){
				rowIdArray.push(rows[i].typeCode);
			} */

			var rowIdArray = [];
			var length = $(".checkchild:checked").length;
			$(".checkchild:checked").each(function() {
				rowIdArray.push($(this).val());
			});

			$.ajax({
				type : "post",
				url : "<%=contextPath%>/goodType/delGoodType",
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
	            	
	            	//刷新树结构
	            	reloadTree();
	            	//列表刷新
	            	reloadTable();
	            }
	        });
		}
	    
		//跳转到修改类别
		function toUptType(){
			/* var goodTypeTables = $('#goodTypeTables').DataTable();
	    	var length = goodTypeTables.rows('.selected').data().length;
	    	if(length >1 || length ==0){
	    		oneRowAlert(); */
	    	if($(".checkchild:checked").length == 0 || $(".checkchild:checked").length >1){
	    			oneRowAlert();
	    	}else{
	    		/* var row = goodTypeTables.rows('.selected').data();
	    		var typeCode = row[0].typeCode;
	    		var type = {typeCode:typeCode}; */
	    		
	    		var typeId = $(".checkchild:checked").val();
	    		var type = {typeId:typeId};
	    		$.ajax({
	    			type : "post",
	                url : "<%=contextPath%>/goodType/getGoodType",
						data : type,
						dataType : "json",
						success : function(dataRtn) {
							var rtnStr = dataRtn.rtn;
							if (rtnStr == "success") {
								$("#typeId").val(dataRtn.goodType.typeId);
								$("#typeSrcCode").val(dataRtn.goodType.typeCode);
								$("#typeCode").val(dataRtn.goodType.typeCode);
								$("#typeName").val(dataRtn.goodType.typeName);
								
								var status = dataRtn.goodType.status;
								if(status=="1"){
									$("#statusOpen").attr('checked','true');
								}else if(status=="0"){
									$("#statusStop").attr('checked','true');
								}
								
								var isLeaf = dataRtn.goodType.isLeaf;
								$("#isSrcLeaf").val(isLeaf);
								if("1"==isLeaf){
									$("#isLeaf").attr('checked','true');
								}else if("0"==isLeaf){
									$("#noLeaf").attr('checked','true');
								}
								
								$("#remark").val(dataRtn.goodType.remark);
								
								$("#parTypeIdUpt").val(dataRtn.goodType.parTypeId);
								
								$('#typeUptModal').modal('show');
							} else {
								dangerAlert();
							}
						}
					});
				}
		}
	    
		   //保存修改商品类别
	    function uptType(){
	    	var typeUptForm = $('#typeUptForm');
			//验证表单
			var validator = $('#typeUptForm').data('bootstrapValidator');

			if (validator) {
				// 修复记忆的组件不验证
				validator.validate();
				if (!validator.isValid()) {
					return false;
				
				}
			}
	        $.ajax({
	            type : "post",
	            url : typeUptForm.attr("action"),
	            data : typeUptForm.serializeArray(),
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	var rtnStr = dataRtn.rtn;
	            	
	            	//清空表单验证
	        		$('#typeUptForm').data('bootstrapValidator').resetForm(); 
	        		//清空表单内容
	        		$('#typeUptForm').resetForm();
	        		$("#statusOpen").removeAttr("checked");
	        		$("#statusStop").removeAttr("checked");
	        		$("#isLeaf").removeAttr("checked");
	        		$("#noLeaf").removeAttr("checked");
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
	            	
	            	//树刷新
	            	reloadTree();
	            	//列表刷新
	            	reloadTable();
	            }
	        });

	    }
		   
		
		function reloadTree(){
			//var goodTypeTree;
			//var parTypeIdStr;
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
	    						if(nodes != null || parTypeIdStr == "1"){
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
			    							columns : [ 
			    							{
				    								"data":"typeId",
				    								render:function(data,type,full,meta){
				    									return '<input type="checkbox" class="checkchild" value="'+data+'" />';
				    								},
				    								"sortable":false
				    						},{
			    								"data" : "typeCode",
			    								"title" : "类别编码"
			    							}, {
			    								"data" : "typeName",
			    								"title" : "类别名称"
			    							},{
			    								"data" : "isLeaf",
			    								"title" : "是否有子类别",
			    								 render: function (data, type, row, meta) {
			    									 if(row.isLeaf =='1'){
			    										 return '<span>有</span>';
			    									 }else if (row.isLeaf =='0'){
			    										 return '<span>无</span>';
			    									 }
			    				                 }
			    							},{
			    								"data" : "status",
			    								"title" : "状态",
			    								 render: function (data, type, row, meta) {
			    									 if(row.status =='1'){
			    										 return '<span style="background-color:#5cb85c;color:#fff">已启用</span>';
			    									 }else if (row.status =='0'){
			    										 return '<span style="background-color:#888888;color:#fff">已停用</span>';
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
		}
	</script>

</body>