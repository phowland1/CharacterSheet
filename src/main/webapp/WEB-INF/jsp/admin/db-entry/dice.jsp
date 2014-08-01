<%--
  Created by IntelliJ IDEA.
  User: PVarnerHowland
  Date: 7/31/2014
  Time: 6:26 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="js" tagdir="/WEB-INF/tags/template"%>
<%--<link href="/webapp/resources/css/global.css" rel="stylesheet">--%>
<script src="<c:url value="/resources/js/lib/require.js"/>"></script>
<script src="<c:url value="/resources/js/require-config.js"/>"></script>


<html>
<head>
    <title></title>
    <style type="text/css" media="screen">
        table {margin-right: 25px; float:left;width:200px;}
        #table_container{float:left;width:1000px;margin:0 auto;}
    </style>
</head>
<body>
    <div id="diceEntry">
        <form:form id="diceForm" commandName="dice">
            <input type="hidden" name="id" id="id" value="${dice.id}">
            <div id="table_container">
                <table>
                    <tr>
                        <th>Name</th>
                        <td><form:input path="name"></form:input></td>
                    </tr>
                    <tr>
                        <th>Max Value</th>
                        <td><form:input path="maxRoll"></form:input></td>
                    </tr>
                    <tr>
                        <th>Min Value</th>
                        <td><form:input path="minRoll"></form:input></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="submit" name='save' value="Save"/>
                            <a href="/CharacterSheet/admin/db-entry.html" style="margin:10px; font-size: 12px;">Cancel</a>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr><td>Dice:</td></tr>
                    <c:forEach items="${dice}" var="dice">
                        <tr>
                            <td><a class="diceEntry" href="#" id="${dice.id}">${dice.name}</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form:form>
    </div>
</body>
</html>