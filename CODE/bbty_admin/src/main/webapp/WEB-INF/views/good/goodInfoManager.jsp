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
	
		<!-- 新增商品信息 -->
	<div class="modal fade" id="infoAddModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="closeModal(1);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">新增商品信息</h4>
				</div>
				<div class="modal-body">
					<form id="infoAddForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/goodInfo/saveGoodInfo" method="post">
						<input type="hidden" id="parTypeIdAdd" name="parTypeIdAdd"/>
						<div class="form-group">
							<label for="infoCode" class="col-sm-2 control-label">商品编号:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="infoCode">
							</div>
						</div>
						<div class="form-group">
							<label for="infoName" class="col-sm-2 control-label">商品名称:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="infoName">
							</div>
						</div>
						<div class="form-group">
							<label for="marker" class="col-sm-2 control-label">制造商:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="marker">
							</div>
						</div>
						<div class="form-group">
							<label for="markAddress" class="col-sm-2 control-label">地址:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="markAddress"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="website" class="col-sm-2 control-label">网站:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="website">
							</div>
						</div>
						<div class="form-group">
							<label for="contact" class="col-sm-2 control-label">联系方式:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="contact">
							</div>
						</div>
						<div class="form-group">
							<label for="fax" class="col-sm-2 control-label">传真:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="fax">
							</div>
						</div>
						<div class="form-group">
							<label for="zipCode" class="col-sm-2 control-label">邮编:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="zipCode">
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
							<label for="remark" class="col-sm-2 control-label">备注:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="remark"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="saveInfo();">保存</button>
							<button type="button" class="btn btn-default"
								onclick="closeModal(1);">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改商品信息 -->
	<div class="modal fade" id="infoUptModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="closeModal(2);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">修改商品信息</h4>
				</div>
				<div class="modal-body">
					<form id="infoUptForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/goodInfo/uptGoodInfo" method="post">
						<input type="hidden" id="infoId" name="infoId"/>
						<input type="hidden" id="typeId" name="typeId"/>
						<input type="hidden" id="infoSrcCode" name="infoSrcCode"/>
						<div class="form-group">
							<label for="infoCode" class="col-sm-2 control-label">商品编号:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="infoCode" id="infoCode">
							</div>
						</div>
						<div class="form-group">
							<label for="infoName" class="col-sm-2 control-label">商品名称:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="infoName" id="infoName">
							</div>
						</div>
						
						<div class="form-group">
							<label for="marker" class="col-sm-2 control-label">制造商:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="marker" id="marker">
							</div>
						</div>
						<div class="form-group">
							<label for="markAddress" class="col-sm-2 control-label">地址:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="markAddress" id="markAddress"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="website" class="col-sm-2 control-label">网站:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="website" id="website">
							</div>
						</div>
						<div class="form-group">
							<label for="contact" class="col-sm-2 control-label">联系方式:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="contact" id="contact">
							</div>
						</div>
						<div class="form-group">
							<label for="fax" class="col-sm-2 control-label">传真:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="fax" id="fax">
							</div>
						</div>
						<div class="form-group">
							<label for="zipCode" class="col-sm-2 control-label">邮编:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="zipCode" id="zipCode">
							</div>
						</div>
						<div class="form-group">
							<label for="status" class="col-sm-2 control-label">状态:</label>
							<div class="col-sm-10">
							 <label class="radio-inline">
                             	<input type="radio" name="status" value="1" id="statusOpen">启用
                             </label>
                             <label class="radio-inline">
                             <input type="radio" name="status" value="0" id="statusStop">停用
                             </label>
                             </div>
						</div>
						<div class="form-group">
							<label for="remark" class="col-sm-2 control-label">备注:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="remark" id="remark"></textarea>
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="uptInfo();">保存</button>
							<button type="button" class="btn btn-default"
								onclick="closeModal(2);">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade bs-example-modal-sm"  id="confirmDelModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm">
    		<div class="modal-content">
    		<div class="modal-body">
    			确定要删除选中的商品信息吗？若商品信息下还有库存则一并删除库存!
    		</div>
    		<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="deleteInfos();">确定</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
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
				<div class="panel-heading">商品信息列表</div>
				<div class="panel-body" id="infoMenuDiv">
					<button type="button" class="btn btn-primary"
						onclick="toAddInfo();">新增商品</button>
					<button type="button" class="btn btn-warning"
						onclick="toUptInfo();">修改商品</button>
					<button type="button" class="btn btn-danger" onclick="toDeleteInfos();">批量删除商品</button>
				</div>
				<input type="hidden" id="parTypeIdStr" />
				<div class="panel-body" id="infoTableDiv">
					<table class="table table-striped table-bordered table-hover" id="goodInfoTables">
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
	    	
			$("#infoMenuDiv").hide();
			
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
	    					
	    					if(parTypeIdStr != "1"){
	    						$("#parTypeIdStr").val(parTypeIdStr);
		    					
		    					var nodes = data.nodes;
		    					
		    						$("#infoMenuDiv").show();
		    						$("#infoTableDiv").show();
		    						
		    						
		    						//表格初始化
			    			        $('#goodInfoTables').DataTable({
			    			        	destroy:true,	    			        	
			    			        	pagingType:"full_numbers",//设置分页控件的模式
			    			        	searching: false,//datatales的查询框,true:开启;false:关闭
			    			        	lengthMenu:[10,20,30],//设置一页展示多少条记录
			    			        	lengthChange: false,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
			    			        	responsive: true,//是否需要分页控件,true:需要,false:不需要
			    			            ajax: {
			    			                "url": "<%=contextPath%>/goodInfo/getInfosByGoodType?parTypeIdStr="+parTypeIdStr
			    							},
			    							columns : [ 
			    							{
			    								"data":"infoId",
			    								render:function(data,type,full,meta){
			    									return '<input type="checkbox" class="checkchild" value="'+data+'" />';
			    								},
			    								"sortable":false
			    							},	
			    							{
			    								"data" : "infoCode",
			    								"title" : "商品编号"
			    							}, {
			    								"data" : "infoName",
			    								"title" : "商品名称"
			    							},{
			    								"data" : "marker",
			    								"title" : "制造商"
			    							},{
			    								"data" : "contact",
			    								"title" : "联系方式"
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
	    						$("#infoMenuDiv").hide();
	    						$("#infoTableDiv").hide();
	    					}
	    					
		    			      
	    					
	    				}
	    			});
	        		
	        		//折叠树节点
	        		 $('#tree').treeview('collapseAll', {
	     				silent : true
	     			});
	            }
	        });
			
			
			
			//新增商品信息表单校验
	    	$('#infoAddForm').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {/*验证*/
		            	infoCode: {/*键名username和input name值对应*/
		                    message: '商品编号无效',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '商品编号不能为空'
		                        },
		                        remote: {
		                        	url: '<%=contextPath%>/goodInfo/checkAddInfoCode',
		                            message: '商品编号已存在',//提示消息
		                            type: 'post'//请求方式
		                        }
		                    }
		                },
		                infoName: {
		                    message:'商品名称无效',
		                    validators: {
		                        notEmpty: {
		                            message: '商品名称不能为空'
		                        }
		                    }
		                }
		            }
		        });
			
	    	//修改商品信息表单校验
	    	$('#infoUptForm').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {/*验证*/
		            	infoCode: {/*键名username和input name值对应*/
		                    message: '商品编号无效',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '商品编号不能为空'
		                        },
		                        remote: {
		                        	url: '<%=contextPath%>/goodInfo/checkInfoCode',
		                            message: '商品编号已存在',//提示消息
		                            type: 'post',//请求方式
		                            data: function(validator) {
			                               return {
			                                   infoSrcCode: $("#infoSrcCode").val()
			                               };
			                            }
		                        },
		                        
		                    }
		                },
		                infoName: {
		                    message:'商品名称无效',
		                    validators: {
		                        notEmpty: {
		                            message: '商品名称不能为空'
		                        }
		                    }
		                }
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
	    	var goodInfoTables = $('#goodInfoTables').DataTable();
	    	goodInfoTables.ajax.reload();
	    }
	    
	    //关闭商品类型窗口
	    function closeModal(par){
	  		if(par =="1"){
	  			//清空表单验证
	    		$('#infoAddForm').data('bootstrapValidator').resetForm(); 
	    		//清空表单内容
	    		$('#infoAddForm').resetForm();
	  			$("#infoAddModal").modal('hide');
	  		}else if(par =="2"){
	  			//清空表单验证
	    		$('#infoUptForm').data('bootstrapValidator').resetForm(); 
	    		//清空表单内容
	    		$('#infoUptForm').resetForm();
	    		
	    		$("#statusOpen").removeAttr("checked");
        		$("#statusStop").removeAttr("checked");
	  			$("#infoUptModal").modal('hide');
	  		}else{
	  			$("#confirmDelModal").modal('hide');
	  		}
	    	
	    }
	    
	    //跳转到新增商品信息
		function toAddInfo(){
			$('#infoAddModal').modal('show');
		}
	    
	    //保存新增商品信息
	    function saveInfo(){
	    	 var parTypeIdStr = $("#parTypeIdStr").val();
	    	 $("#parTypeIdAdd").val(parTypeIdStr);
	    	 var infoAddForm = $('#infoAddForm');
	    	//验证表单
	    	var validator = $('#infoAddForm').data('bootstrapValidator');
	        
	    	if (validator) {
	        // 修复记忆的组件不验证
	            validator.validate();
	            if (!validator.isValid()) {
	                return false;
	            }
	        }
	        
	        $.ajax({
	            type : "post",
	            url : infoAddForm.attr("action"),
	            data : infoAddForm.serializeArray(),
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	var rtnStr = dataRtn.rtn;
	            	//清空表单验证
	        		$('#infoAddForm').data('bootstrapValidator').resetForm(); 
	        		//清空表单内容
	        		$('#infoAddForm').resetForm();
	        		
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
	    
	    //跳转到删除商品信息
	    function toDeleteInfos(){
	    	//var goodInfoTables = $('#goodInfoTables').DataTable();
			//var length = goodInfoTables.rows('.selected').data().length;
			//if (length == 0) {
			//	noRowAlert();
			//} else {
			//	$("#confirmDelModal").modal('show');
			//}
			
			if($(".checkchild:checked").length == 0){
				noRowAlert();
			}else{
				$("#confirmDelModal").modal('show');
			}
	    }
	    
	    //删除商品信息
		function deleteInfos() {
			//var goodInfoTables = $('#goodInfoTables').DataTable();
			//var rows = goodInfoTables.rows('.selected').data();
			//var length = goodInfoTables.rows('.selected').data().length;
			var rowIdArray = [];
			var length = $(".checkchild:checked").length;
			$(".checkchild:checked").each(function(){
				rowIdArray.push($(this).val());
			});
			
	 		$.ajax({
	            type : "post",
	            url : "<%=contextPath%>/goodInfo/delGoodInfo",
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
	    
		//跳转到修改商品信息
		function toUptInfo(){
			//var goodInfoTables = $('#goodInfoTables').DataTable();
	    	//var length = goodInfoTables.rows('.selected').data().length;
	    	if($(".checkchild:checked").length == 0 || $(".checkchild:checked").length >1){
	    			oneRowAlert();
	    	}else{
	    		//var row = goodInfoTables.rows('.selected').data();
	    		//var infoCode = row[0].infoCode;
	    		var infoId = $(".checkchild:checked").val();
	    		var info = {infoId:infoId};
	    		$.ajax({
	    			type : "post",
	                url : "<%=contextPath%>/goodInfo/getGoodInfoByInfoId",
						data : info,
						dataType : "json",
						success : function(dataRtn) {
							var rtnStr = dataRtn.rtn;
							if (rtnStr == "success") {
								$("#typeId").val(dataRtn.goodInfo.typeId);
								$("#infoId").val(dataRtn.goodInfo.infoId);
								$("#infoSrcCode").val(dataRtn.goodInfo.infoCode);
								$("#infoCode").val(dataRtn.goodInfo.infoCode);
								$("#infoName").val(dataRtn.goodInfo.infoName);
								
								var status = dataRtn.goodInfo.status;
								if(status=="1"){
									$("#statusOpen").attr('checked','true');
								}else if(status=="0"){
									$("#statusStop").attr('checked','true');
								}
								
								$("#remark").val(dataRtn.goodInfo.remark);
								$("#marker").val(dataRtn.goodInfo.marker);
								$("#markAddress").val(dataRtn.goodInfo.markAddress);
								$("#website").val(dataRtn.goodInfo.website);
								$("#contact").val(dataRtn.goodInfo.contact);
								$("#fax").val(dataRtn.goodInfo.fax);
								$("#zipCode").val(dataRtn.goodInfo.zipCode);
								
								$('#infoUptModal').modal('show');
							} else {
								dangerAlert();
							}
						}
					});
				}
		}
	    
		   //保存修改商品信息
	    function uptInfo(){
	    	
	    	var infoUptForm = $('#infoUptForm');
	    	//验证表单
	    	 var validator = $('#infoUptForm').data('bootstrapValidator');
	        
	    	if (validator) {
	        // 修复记忆的组件不验证
	            validator.validate();
	            if (!validator.isValid()) {
	                return false;
	            }
	        }
	        
	        $.ajax({
	            type : "post",
	            url : infoUptForm.attr("action"),
	            data : infoUptForm.serializeArray(),
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	var rtnStr = dataRtn.rtn;
	            	
	            	//清空表单验证
	        		$('#infoUptForm').data('bootstrapValidator').resetForm(); 
	        		//清空表单内容
	        		$('#infoUptForm').resetForm();
	        		$("#statusOpen").removeAttr("checked");
	        		$("#statusStop").removeAttr("checked");
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
		
	</script>

</body>