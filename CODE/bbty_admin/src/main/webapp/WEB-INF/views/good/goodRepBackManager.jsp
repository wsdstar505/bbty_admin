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
	
	<!-- 采购退货信息 -->
	<div class="modal fade" id="repBackModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="closeModal(2);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">采购退货信息</h4>
				</div>
				<div class="modal-body">
					<form id="repBackForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/goodRep/backGoodRep" method="post">
						<input type="hidden" id="repId" name="repId"/>
						<div class="form-group">
							<label for="pici" class="col-sm-2 control-label">批次:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="pici" id="pici" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="meterId" class="col-sm-2 control-label">计量单位:</label>
							<div class="col-sm-6">
								<select id="uptMeterId" name="meterId" style="width: 460px" disabled="disabled">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="repNum" class="col-sm-2 control-label">现有数量:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="repNum" id="repNum" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="backNum" class="col-sm-2 control-label">退货数量:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="backNum" id="backNum">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="backRep();">保存</button>
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
				<div class="panel-heading">商品信息</div>
				<div class="panel-body">
					<div id="tree"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-8">
			<div class="panel panel-default">
				<div class="panel-heading">库存信息列表</div>
				<div class="panel-body" id="repMenuDiv">
					<button type="button" class="btn btn-danger" onclick="toBackRep();">退货处理</button>
				</div>
				<input type="hidden" id="infoIdStr" />
				<div class="panel-body" id="repTableDiv">
					<table class="table table-striped table-bordered table-hover" id="goodRepTables">
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var goodTypeTree;
		var infoIdStr;
		var repNum;
		$(function() {
			$("#repMenuDiv").hide();
			
			$.ajax({
	            type : "post",
	            url : "<%=contextPath%>/goodInfo/getGoodInfoTree",
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	goodTypeTree = dataRtn.treeList;
	            	
	        		$('#tree').treeview({
	    				data : goodTypeTree,
	    				emptyIcon : "glyphicon glyphicon-book",
	    				onNodeSelected : function(event, data) {
	    					
	    					infoIdStr=data.tags;
	    					var type = data.type;
	    					
	    					if(infoIdStr != "1" && type =="0"){
	    						$("#infoIdStr").val(infoIdStr);
		    					
		    					var nodes = data.nodes;
		    					var isLeaf = data.isLeaf;
		    					
		    						if(nodes == null && isLeaf=="0"){
		    							$("#repMenuDiv").show();
			    						$("#repTableDiv").show();
			    						
			    						//表格初始化
				    			        $('#goodRepTables').DataTable({
				    			        	destroy:true,	    			        	
				    			        	pagingType:"full_numbers",//设置分页控件的模式
				    			        	searching: false,//datatales的查询框,true:开启;false:关闭
				    			        	lengthMenu:[10,20,30],//设置一页展示多少条记录
				    			        	lengthChange: false,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
				    			        	responsive: true,//是否需要分页控件,true:需要,false:不需要
				    			            ajax: {
				    			                "url": "<%=contextPath%>/goodRep/getRepsByGoodInfo?infoIdStr="+infoIdStr
				    							},
				    							columns : [ 
				    							{
				    								"data":"repId",
				    								render:function(data,type,full,meta){
				    									return '<input type="checkbox" class="checkchild" value="'+data+'" />';
				    								},
				    								"sortable":false
				    							},	
				    							{
				    								"data" : "pici",
				    								"title" : "批次"
				    							},{
				    								"data" : "meterName",
				    								"title" : "计量单位"
				    							},{
				    								"data" : "repNum",
				    								"title" : "库存数量"
				    							}, {
				    								"data" : "cbp",
				    								"title" : "成本价格"
				    							},{
				    								"data" : "pfp",
				    								"title" : "批发价格"
				    							},{
				    								"data" : "sczdp",
				    								"title" : "市场指导价格"
				    							},{
				    								"data" : "xsp",
				    								"title" : "销售价格"
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
		    							$("#repMenuDiv").hide();
			    						$("#repTableDiv").hide();
		    						}
		    					
		    						
	    					}else{
	    						$("#repMenuDiv").hide();
	    						$("#repTableDiv").hide();
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
		
		 
		function successAlert() {
			$("#successAlert").modal('show');
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
			var goodRepTables = $('#goodRepTables').DataTable();
			goodRepTables.ajax.reload();
		}

		
		//关闭商品类型窗口
		function closeModal(par) {
			//清空表单验证
			$('#repBackForm').data('bootstrapValidator').resetForm();
			//清空表单内容
			$('#repBackForm').resetForm();
			$("#repBackModal").modal('hide');
		}

		//跳转到采购退货信息
		function toBackRep() {
			
		
			if ($(".checkchild:checked").length == 0
					|| $(".checkchild:checked").length > 1) {
				oneRowAlert();
			} else {
				
				var repId = $(".checkchild:checked").val();
				var rep = {
					repId : repId
				};
				$
						.ajax({
							type : "post",
							url : "<%=contextPath%>/goodRep/getGoodRep",
						data : rep,
						dataType : "json",
						success : function(dataRtn) {
							var rtnStr = dataRtn.rtn;
							if (rtnStr == "success") {
								$("#repId").val(dataRtn.goodRep.repId);
								$("#infoId").val(dataRtn.goodRep.infoId);
								$("#pici").val(dataRtn.goodRep.pici);
								$("#repNum").val(dataRtn.goodRep.repNum);
								
								repNum = $("#repNum").val();
								
								$("#uptMeterId").select2({
						        	 placeholder: "请选择计量单位",
						        	 allowClear: true,
						        	 closeOnSelect: true,
						        	 minimumResultsForSearch:-1,
						        	 separator: ",",  
						        	 ajax: {
						        		 url: "<%=contextPath%>/meter/getMeterJson",
						        		 dataType: 'json',
						        		 delay: 250,
						        		 processResults: function (data, params) {
						        		      return {
						        		        results: data.selectJsons,
						        		      };
						        		 },
						        		 cache: true
						        	 }
						        });
								
								var selectJson = dataRtn.selectJson;
								var ht = $("#uptMeterId").html();
									if(ht == ""){
										$("#uptMeterId").html('<option value='+selectJson.id+'>'+selectJson.text+'</option>');
									}else{
										ht=ht+'<option value='+selectJson.id+'>'+selectJson.text+'</option>';
										$("#uptMeterId").html(ht);
									}
								var	meterId =selectJson.id;
							
								$("#uptMeterId").val(meterId).trigger("change");
								
								
								//退货信息表单校验
						    	$('#repBackForm').bootstrapValidator({
							            message: 'This value is not valid',
							            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
							                valid: 'glyphicon glyphicon-ok',
							                invalid: 'glyphicon glyphicon-remove',
							                validating: 'glyphicon glyphicon-refresh'
							            },
							            fields: {/*验证*/
							            	backNum: {
							                    message:'退货数量无效',
							                    validators: {
							                        notEmpty: {
							                            message: '退货数量不能为空'
							                        },
							                        numeric:{
							                        	message: '退货数量只能输入数字'
							                        },
							                        greaterThan:{
							                        	value:1,
							                        	message:'退货数量必须大于0',
														isclusive:true							                       
							                        },
							                        lessThan:{
							                        	value:Number($("#repNum").val())+1,
							                        	message:'退货数量必须小于现有库存',
														isclusive:true							                       
							                        }
							                    }
							                }
							            }
							        });
								
								
								$('#repBackModal').modal('show');
							} else {
								dangerAlert();
							}
						}
					});
				}
		}
	    
		   //保存修改库存信息
	    function backRep(){
	    	
	    	var repBackForm = $('#repBackForm');
	    	//验证表单
	    	 var validator = $('#repBackForm').data('bootstrapValidator');
	        
	    	if (validator) {
	        // 修复记忆的组件不验证
	            validator.validate();
	            if (!validator.isValid()) {
	                return false;
	            }
	        }
	        
	        $.ajax({
	            type : "post",
	            url : repBackForm.attr("action"),
	            data : repBackForm.serializeArray(),
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	var rtnStr = dataRtn.rtn;
	            	
	            	//清空表单验证
	        		$('#repBackForm').data('bootstrapValidator').resetForm(); 
	        		//清空表单内容
	        		$('#repBackForm').resetForm();
	        		
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