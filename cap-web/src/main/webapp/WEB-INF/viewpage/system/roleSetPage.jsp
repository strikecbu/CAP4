<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>
<html>
<head>
<meta name="decorator" content="form">
<title><spring:message code="roleSet.title"><!--角色權限--></spring:message></title>
</head>
<body>
	<script>
		loadScript('js/system/roleSetPage');
	</script>
	<div class="button-menu funcContainer">
		<button type="button" id="save_btn">
			<spring:message code="btn.save"></spring:message><!-- 儲存  -->
		</button>
		<button type="button" id="close_btn" onclick="window.close();">
			<spring:message code="btn.leave"></spring:message><!-- 離開  -->
		</button>
	</div>
	<div class="clear"></div>
		<!--Start : 編輯-->
		<div id="EDIT">
            <form id="JForm">
	            <fieldset>
					<legend><spring:message code="role"></spring:message></legend>
	                <table class="tb2" width="99%" border="0" cellspacing="0" cellpadding="0">
	                    <tbody>
	                        <tr>
	                            <td width="20%" class="hd1">
	                                <span class="color-red">＊</span><spring:message code="rolCode"></spring:message></td>
	                            <td width="30%">
	                                <input type="text" size="10" id="roleId" name="roleId" maxlength="10" class="validate[required]"/>
	                            </td>
	                            <td width="20%" class="hd1">
	                                <span class="color-red">＊</span><spring:message code="rolName"></spring:message></td>
	                            <td width="30%">
	                                <input type="text" size="15" id="rolName" name="rolName" maxlength="48" class="validate[required]"/>
	                            </td>
	                            <td width="20%" class="hd1">
	                            	<spring:message code="sysTyp"></spring:message></td>
	                            <td>
	                                <select id="sysTyp" name="sysTyp" combokey="authSysId" combotype="2"></select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td width="20%" class="hd1">
	                            	<spring:message code="stu"></spring:message></td>
	                            <td>
	                            	<input type="radio" id="stu" name="stu" checked class="validate[required]" value="0"/><spring:message code="on"></spring:message>
	                            	<input type="radio" id="stu" name="stu" class="validate[required]" value="1"/><spring:message code="off"></spring:message>
	                            </td>
	                            <td width="20%" class="hd1"><spring:message code="note"></spring:message></td>
	                            <td colspan="3">
	                                <input type="text" id="note" name="note" size="60" maxlength="40"/>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
                </fieldset>
                <fieldset>
					<legend><spring:message code="usr"></spring:message></legend>
					<div id="btns_usr">
						<button id="add" type="button" class="btn1">
							<spring:message code="btn.add">
								<!--新增-->
							</spring:message>
						</button>
						<button id="delete" type="button" class="btn1">
							<spring:message code="btn.delete">
								<!--刪除-->
							</spring:message>
						</button>
					</div>
					<div id="gridview_usr"></div>
				</fieldset>
				<fieldset>
					<legend><spring:message code="func"></spring:message></legend>
					<div id="btns_func">
						<button id="add" type="button" class="btn1">
							<spring:message code="btn.add">
								<!--新增-->
							</spring:message>
						</button>
						<button id="delete" type="button" class="btn1">
							<spring:message code="btn.delete">
								<!--刪除-->
							</spring:message>
						</button>
					</div>
					<div id="gridview_func"></div>
				</fieldset>
            </form>
        </div>
        <div id="editUsr" style="display:none">
            <form id="mform">
	            <table class="tb2" width="99%" border="0" cellspacing="0" cellpadding="0">
	            	<tr>
	                	<td width="40%" class="hd1">
	                    	<spring:message code="js.departNm"></spring:message></td>
	                    <td>
	                    	<select id="unit" name="unit" combotype="2"></select>
	                    	<button id="query" type="button" class="btn1">
								<spring:message code="btn.query">
									<!--查詢-->
								</spring:message>
							</button>
	                    </td>
	                </tr>
                </table>
                <div id="gridviewUsr"></div>
            </form>
        </div>
        <div id="editFunc" style="display:none">
            <form id="mform">
            	<table class="tb2" width="99%" border="0" cellspacing="0" cellpadding="0">
	            	<tr>
	                	<td width="20%" class="hd1">
	                    	<spring:message code="js.topItem"></spring:message></td>
	                    <td>
	                    	<select id="pgmTyp" name="pgmTyp" combotype="2"></select>
	                    	<button id="query" type="button" class="btn1">
								<spring:message code="btn.query">
									<!--查詢-->
								</spring:message>
							</button>
	                    </td>
	                </tr>
                </table>
                <div id="gridviewFunc"></div>
            </form>
        </div>
		<!-- dialog end-->
</body>
</html>
