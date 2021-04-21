<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
   	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   	<title><spring:message code="title.adminMain"/></title>

    <!-- Bootstrap -->
    <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <link href="<c:url value='/resources/css/admin/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<c:url value='/resources/css/admin/font-awesome.min.css'/>" rel="stylesheet">
    <!-- NProgress -->
    <link href="<c:url value='/resources/css/admin/nprogress.css'/>" rel="stylesheet">
	<!-- iCheck -->
    <link href="<c:url value='/resources/css/admin/green.css'/>" rel="stylesheet">
    <!-- Datatables -->
    <link href="<c:url value='/resources/css/admin/dataTables.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/buttons.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/fixedHeader.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/responsive.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/scroller.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/grey.css'/>" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b494d45b9b.js" crossorigin="anonymous"></script>
    <!-- Custom styling plus plugins -->
    <link href="<c:url value='/resources/css/admin/custom.min.css'/>" rel="stylesheet">
    <style>
    	#cke_1_contents{
    		height: 500px !important;
    	}
    </style>
</head>
<body class="nav-md">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
    <div class="container body">
    	<jsp:include page="/WEB-INF/jsp/layout/adminSideMenu.jsp"/>
	</div>
	<!-- page content -->
	<div class="right_col" role="main">
    	<div class="">
        	<div class="page-title">
            	<div class="title_left">
                	<h3>공지사항 <small>정보</small></h3>
              	</div>
              	<div class="title_right">
                	<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  		<div class="input-group">
                  		</div>
                	</div>
              	</div>
            </div>
            <div class="clearfix"></div>
			<div class="row">
    			<div class="col-md-12 col-sm-12 ">			
					<div class="x_panel">
		            	<div class="x_title">
		                  	<div class="clearfix"></div>
						</div>
		                <div class="x_content">
		               		<div class="row">
		                    	<div class="col-sm-12">
		                        	<div class="card-box table-responsive">
		                        		<form:form commandName="notifyVO" action="${contextPath}/admin/userService/notifyUpdate">
		                    				<table id="datatable" class="table table-striped table-bordered" style="width:100%">
			                      				<tbody style="font-size: 0.7em;">
			                      					<tr>
								                    	<th>
								                    		공지사항 제목
								                    	</th>
								                    	<td>
								                    		<form:input path="notifyTitle" readonly="true" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorTitle">
								                    			<form:errors path="notifyTitle" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		공지사항 구분
								                    	</th>
								                    	<td>
								                    		<form:radiobuttons path="notifyType" items="${notifyType}" onclick="readOn(event)"/>
								                    		<div style="font-size: 0.9em;" id="errorType">
								                    			<form:errors path="notifyType" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		공지사항 내용
								                    	</th>
								                    	<td>
								                    		<form:textarea path="notifyContent" readonly="true" cssStyle="resize: none; width:100%; height:100px;" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorContent">
								                    			<form:errors path="notifyContent" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		공지사항 등록일
								                    	</th>
								                    	<td>
								                    		<form:input type="date" path="notifyDate" readonly="true" cssStyle="resize: none; width:100%; height:100px;" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorDate">
								                    			<form:errors path="notifyDate" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<td colspan="2" style="text-align: center;">
								                    		<button type="button" onclick="notifyCheck()" class="btn btn-app" id="submitBtn" disabled>
								                    			<i class="fa fa-save"></i>
								                    			등록하기
								                    		</button>
						                    				<button type="button" class="btn btn-app" onclick="formChange()">
						                    					<i class="fa fa-edit"></i>
						                    					수정하기
						                    				</button>
						                    				<button type="reset" class="btn btn-app" value="다시쓰기">
						                    					<i class="fa fa-repeat"></i>
						                    					다시쓰기
						                    				</button>  
						                    				<button type="reset" class="btn btn-app" value="돌아가기" onclick="location.href='<c:url value="/admin/userService/notifyList?pageIndex=${notifyVO.pageIndex}&searchCondition=${notifyVO.searchCondition}&searchKeyword=${notifyVO.searchKeyword}"/>';">
						                    					<i class="fas fa-long-arrow-alt-left" style="display: block; height: 20px; font-size: 20px;"></i>
						                    					돌아가기
						                    				</button>
								                    	</td>
								                    </tr>
                      							</tbody>
		                    				</table>
		                    				<form:hidden path="notifyIdx"/>
		                    				<form:hidden path="pageIndex"/>
		                    				<form:hidden path="searchCondition"/>
		                    				<form:hidden path="searchKeyword"/>
		                    			</form:form>
		                  			</div>
		                  		</div>
		              		</div>
		            	</div>
					</div>
				</div>
    			<!-- /page content -->
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<c:url value='/validator'/>" ></script>
	<validator:javascript formName="notifyVO" staticJavascript="false" xhtml="true" cdata="false"/>
	<script src="<c:url value='/resources/js/admin/icheck.min.js'/>"></script>
    <script>
	    jQuery(document).ready(function ($) {
		    $('input').iCheck({
		        checkboxClass: 'icheckbox_flat-grey',
		        radioClass: 'iradio_flat-grey'
		    });
		    
		    $('input').on("ifClicked",function(event){
		    	if(!readSw){
		    		var icheck = $(this);
	    	        setTimeout(function() {
	    	        	alert("수정 버튼을 눌러서 수정하세요.");
	    	            $(icheck).iCheck('uncheck');
	    	            return false;
	    	        }, 100);
	    		}
		    });
	
		    $('input.all').on('ifToggled', function (event) {
		        var chkToggle;
		        $(this).is(':checked') ? chkToggle = "check" : chkToggle = "uncheck";
		        $('input.selector:not(.all)').iCheck(chkToggle);
		    });
		});
	    
	    var vailMode = "notify";
	    function notifyCheck(){
			var notifyForm = document.getElementById("notifyVO");
			if(!validateNotifyVO(notifyForm)){
				return false;
			}else{
				notifyForm.submit();
			}
	    }
    </script>
	<script>
		function readOn(event){
			if(!readSw){
				alert("수정 버튼을 눌러서 수정하세요.");
				event.preventDefault();
				return false;
			}
		}
		
		function formChange(){
			$("#notifyTitle").attr("readonly", false);
			$("#notifyContent").attr("readonly", false);
			$("#notifyDate").attr("readonly", false);
			$("#submitBtn").attr("disabled", false);
			readSw = true;
		}
	</script>
	<!-- jQuery -->
	<script src="<c:url value='/resources/js/admin/jquery.min.js'/>"></script>
	<!-- Bootstrap -->
	<script src="<c:url value='/resources/js/admin/bootstrap.bundle.min.js'/>"></script>
	<!-- FastClick -->
	<script src="<c:url value='/resources/js/admin/fastclick.js'/>"></script>
	<!-- NProgress -->
	<script src="<c:url value='/resources/js/admin/nprogress.js'/>"></script>
	<!-- Custom Theme Scripts -->
	<script src="<c:url value='/resources/js/admin/custom.min.js'/>"></script>
    <!-- iCheck -->
    <script src="<c:url value='/resources/js/admin/icheck.min.js'/>"></script>
    <!-- Datatables -->
    <script src="<c:url value='/resources/js/admin/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.buttons.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/buttons.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/buttons.flash.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/buttons.html5.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/buttons.print.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.fixedHeader.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.keyTable.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.responsive.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/responsive.bootstrap.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.scroller.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/jszip.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/pdfmake.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/vfs_fonts.js'/>"></script>
</body>
</html>