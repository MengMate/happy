<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
    <title><%=Tuser.TABLE_ALIAS%> 维护</title>

    <link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            // 分页需要依赖的初始化动作
            window.simpleTable = new SimpleTable('queryForm', ${page.thisPageNumber}, ${page.pageSize}, '${pageRequest.sortColumns}');
        });
    </script>
</rapid:override>

<rapid:override name="content">
    <form id="queryForm" name="queryForm" action="<c:url value="/pages/Tuser/list.do"/>" method="get"
          style="display: inline;">
        <div class="queryPanel">
            <fieldset>
                <legend>搜索</legend>
                <table>
                    <tr>
                        <td class="tdLabel"><%=Tuser.ALIAS_USERNAME%>
                        </td>
                        <td>
                            <input value="${query.username}" id="username" name="username" maxlength="32" class=""/>
                        </td>
                        <td class="tdLabel"><%=Tuser.ALIAS_USERCODE%>
                        </td>
                        <td>
                            <input value="${query.usercode}" id="usercode" name="usercode" maxlength="32" class=""/>
                        </td>
                        <td class="tdLabel"><%=Tuser.ALIAS_USERIMG%>
                        </td>
                        <td>
                            <input value="${query.userimg}" id="userimg" name="userimg" maxlength="100" class=""/>
                        </td>
                        <td class="tdLabel"><%=Tuser.ALIAS_ACCOUNT%>
                        </td>
                        <td>
                            <input value="${query.account}" id="account" name="account" maxlength="32" class=""/>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdLabel"><%=Tuser.ALIAS_PASSWORD%>
                        </td>
                        <td>
                            <input value="${query.password}" id="password" name="password" maxlength="32" class=""/>
                        </td>
                        <td class="tdLabel"><%=Tuser.ALIAS_STATUS%>
                        </td>
                        <td>
                            <input value="${query.status}" id="status" name="status" maxlength="10" class=""/>
                        </td>
                        <td class="tdLabel"><%=Tuser.ALIAS_CREATEDATE%>
                        </td>
                        <td>
                            <input value="<fmt:formatDate value='${query.createdateBegin}' pattern='<%=Tuser.FORMAT_CREATEDATE%>'/>"
                                   onclick="WdatePicker({dateFmt:'<%=Tuser.FORMAT_CREATEDATE%>'})" id="createdateBegin"
                                   name="createdateBegin"/>
                            <input value="<fmt:formatDate value='${query.createdateEnd}' pattern='<%=Tuser.FORMAT_CREATEDATE%>'/>"
                                   onclick="WdatePicker({dateFmt:'<%=Tuser.FORMAT_CREATEDATE%>'})" id="createdateEnd"
                                   name="createdateEnd"/>
                        </td>
                        <td class="tdLabel"><%=Tuser.ALIAS_UPDATEDATE%>
                        </td>
                        <td>
                            <input value="<fmt:formatDate value='${query.updatedateBegin}' pattern='<%=Tuser.FORMAT_UPDATEDATE%>'/>"
                                   onclick="WdatePicker({dateFmt:'<%=Tuser.FORMAT_UPDATEDATE%>'})" id="updatedateBegin"
                                   name="updatedateBegin"/>
                            <input value="<fmt:formatDate value='${query.updatedateEnd}' pattern='<%=Tuser.FORMAT_UPDATEDATE%>'/>"
                                   onclick="WdatePicker({dateFmt:'<%=Tuser.FORMAT_UPDATEDATE%>'})" id="updatedateEnd"
                                   name="updatedateEnd"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <div class="handleControl">
                <input type="submit" class="stdButton" style="width:80px" value="查询"
                       onclick="getReferenceForm(this).action='${ctx}/pages/Tuser/list.do'"/>
                <input type="submit" class="stdButton" style="width:80px" value="新增"
                       onclick="getReferenceForm(this).action='${ctx}/pages/Tuser/create.do'"/>
                <input type="button" class="stdButton" style="width:80px" value="删除"
                       onclick="batchDelete('${ctx}/pages/Tuser/delete.do','items',document.forms.queryForm)"/>
                <div>
                </div>

                <div class="gridTable">

                    <simpletable:pageToolbar page="${page}">
                        显示在这里是为了提示你如何自定义表头,可修改模板删除此行
                    </simpletable:pageToolbar>

                    <table width="100%" border="0" cellspacing="0" class="gridBody">
                        <thead>

                        <tr>
                            <th style="width:1px;"></th>
                            <th style="width:1px;"><input type="checkbox"
                                                          onclick="setAllCheckboxState('items',this.checked)"></th>

                            <!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
                            <th sortColumn="USERNAME"><%=Tuser.ALIAS_USERNAME%>
                            </th>
                            <th sortColumn="USERCODE"><%=Tuser.ALIAS_USERCODE%>
                            </th>
                            <th sortColumn="USERIMG"><%=Tuser.ALIAS_USERIMG%>
                            </th>
                            <th sortColumn="ACCOUNT"><%=Tuser.ALIAS_ACCOUNT%>
                            </th>
                            <th sortColumn="PASSWORD"><%=Tuser.ALIAS_PASSWORD%>
                            </th>
                            <th sortColumn="STATUS"><%=Tuser.ALIAS_STATUS%>
                            </th>
                            <th sortColumn="CREATEDATE"><%=Tuser.ALIAS_CREATEDATE%>
                            </th>
                            <th sortColumn="UPDATEDATE"><%=Tuser.ALIAS_UPDATEDATE%>
                            </th>

                            <th>操作</th>
                        </tr>

                        </thead>
                        <tbody>
                        <c:forEach items="${page.result}" var="item" varStatus="status">

                            <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
                                <td>${page.thisPageFirstElementNumber + status.index}</td>
                                <td><input type="checkbox" name="items" value="id=${item.id}&"></td>

                                <td><c:out value='${item.username}'/>&nbsp;</td>
                                <td><c:out value='${item.usercode}'/>&nbsp;</td>
                                <td><c:out value='${item.userimg}'/>&nbsp;</td>
                                <td><c:out value='${item.account}'/>&nbsp;</td>
                                <td><c:out value='${item.password}'/>&nbsp;</td>
                                <td><c:out value='${item.status}'/>&nbsp;</td>
                                <td><c:out value='${item.createdateString}'/>&nbsp;</td>
                                <td><c:out value='${item.updatedateString}'/>&nbsp;</td>
                                <td>
                                    <a href="${ctx}/pages/Tuser/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
                                    <a href="${ctx}/pages/Tuser/edit.do?id=${item.id}&">修改</a>
                                </td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>

                    <simpletable:pageToolbar page="${page}">
                        显示在这里是为了提示你如何自定义表头,可修改模板删除此行
                    </simpletable:pageToolbar>
                </div>
    </form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>

