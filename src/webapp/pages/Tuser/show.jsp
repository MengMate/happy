<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
    <title><%=Tuser.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
    <form action="${ctx}/pages/Tuser/list.do" method="post">
        <input type="button" value="返回列表" onclick="window.location='${ctx}/pages/Tuser/list.do'"/>
        <input type="button" value="后退" onclick="history.back();"/>

        <input type="hidden" id="id" name="id" value="${tuser.id}"/>

        <table class="formTable">
            <tr>
                <td class="tdLabel"><%=Tuser.ALIAS_USERNAME%>
                </td>
                <td><c:out value='${tuser.username}'/></td>
            </tr>
            <tr>
                <td class="tdLabel"><%=Tuser.ALIAS_USERCODE%>
                </td>
                <td><c:out value='${tuser.usercode}'/></td>
            </tr>
            <tr>
                <td class="tdLabel"><%=Tuser.ALIAS_USERIMG%>
                </td>
                <td><c:out value='${tuser.userimg}'/></td>
            </tr>
            <tr>
                <td class="tdLabel"><%=Tuser.ALIAS_ACCOUNT%>
                </td>
                <td><c:out value='${tuser.account}'/></td>
            </tr>
            <tr>
                <td class="tdLabel"><%=Tuser.ALIAS_PASSWORD%>
                </td>
                <td><c:out value='${tuser.password}'/></td>
            </tr>
            <tr>
                <td class="tdLabel"><%=Tuser.ALIAS_STATUS%>
                </td>
                <td><c:out value='${tuser.status}'/></td>
            </tr>
            <tr>
                <td class="tdLabel"><%=Tuser.ALIAS_CREATEDATE%>
                </td>
                <td><c:out value='${tuser.createdateString}'/></td>
            </tr>
            <tr>
                <td class="tdLabel"><%=Tuser.ALIAS_UPDATEDATE%>
                </td>
                <td><c:out value='${tuser.updatedateString}'/></td>
            </tr>
        </table>
    </form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>