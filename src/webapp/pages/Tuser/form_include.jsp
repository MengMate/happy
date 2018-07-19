<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<input type="hidden" id="id" name="id" value="${tuser.id}"/>

<tr>
    <td class="tdLabel">
        <%=Tuser.ALIAS_USERNAME%>:
    </td>
    <td>
        <form:input path="tuser.username" id="username" cssClass="" maxlength="32"/>
        <font color='red'><form:errors path="username"/></font>
    </td>
</tr>

<tr>
    <td class="tdLabel">
        <%=Tuser.ALIAS_USERCODE%>:
    </td>
    <td>
        <form:input path="tuser.usercode" id="usercode" cssClass="" maxlength="32"/>
        <font color='red'><form:errors path="usercode"/></font>
    </td>
</tr>

<tr>
    <td class="tdLabel">
        <%=Tuser.ALIAS_USERIMG%>:
    </td>
    <td>
        <form:input path="tuser.userimg" id="userimg" cssClass="" maxlength="100"/>
        <font color='red'><form:errors path="userimg"/></font>
    </td>
</tr>

<tr>
    <td class="tdLabel">
        <%=Tuser.ALIAS_ACCOUNT%>:
    </td>
    <td>
        <form:input path="tuser.account" id="account" cssClass="" maxlength="32"/>
        <font color='red'><form:errors path="account"/></font>
    </td>
</tr>

<tr>
    <td class="tdLabel">
        <%=Tuser.ALIAS_PASSWORD%>:
    </td>
    <td>
        <form:input path="tuser.password" id="password" cssClass="" maxlength="32"/>
        <font color='red'><form:errors path="password"/></font>
    </td>
</tr>

<tr>
    <td class="tdLabel">
        <%=Tuser.ALIAS_STATUS%>:
    </td>
    <td>
        <form:input path="tuser.status" id="status" cssClass="" maxlength="10"/>
        <font color='red'><form:errors path="status"/></font>
    </td>
</tr>

<tr>
    <td class="tdLabel">
        <%=Tuser.ALIAS_CREATEDATE%>:
    </td>
    <td>
        <input value="${tuser.createdateString}" onclick="WdatePicker({dateFmt:'<%=Tuser.FORMAT_CREATEDATE%>'})"
               id="createdateString" name="createdateString" maxlength="0" class=""/>
        <font color='red'><form:errors path="createdate"/></font>
    </td>
</tr>

<tr>
    <td class="tdLabel">
        <%=Tuser.ALIAS_UPDATEDATE%>:
    </td>
    <td>
        <input value="${tuser.updatedateString}" onclick="WdatePicker({dateFmt:'<%=Tuser.FORMAT_UPDATEDATE%>'})"
               id="updatedateString" name="updatedateString" maxlength="0" class=""/>
        <font color='red'><form:errors path="updatedate"/></font>
    </td>
</tr>
	


