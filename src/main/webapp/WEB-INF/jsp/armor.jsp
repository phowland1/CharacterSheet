<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="js" tagdir="/WEB-INF/tags/template"%>

<%--
  Created by IntelliJ IDEA.
  User: PVarnerHowland
  Date: 7/24/2014
  Time: 11:52 AM
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <title></title>
    <style type="text/css" media="screen">
        table {margin-right: 25px; float:left;width:200px;}
        #table_container{float:left;width:1000px;margin:0 auto;}
    </style>
    <template:javascript/>
</head>
<body>
    <div id="entry">
        <form:form id="form" commandName="armor">
            <input type="hidden" name="id" id="id" value="${armor.id}">
            <div id="table_container">
                <table>
                    <tr>
                        <th>Name</th>
                        <td><form:input path="name"></form:input></td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <td><form:input path="description"></form:input></td>
                    </tr>
                    <tr>
                        <th>Type</th>
                        <td><form:select path="armorGroup" items="${armorGroups}" itemValue="id" itemLabel="name"/></td>
                    </tr>
                    <tr>
                        <th>Weight: </th>
                        <td><form:input path="itemWeight" cssClass="input-box-small"></form:input> lb. </td>
                    </tr>
                    <tr>
                        <th>Price: </th>
                        <td>
                            <form:input path="price" cssClass="input-box-small"></form:input>
                            <form:select path="priceDenomination" items="${coins}" itemValue="id" itemLabel="abbr"></form:select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Armor Class: </th>
                        <td><form:input path="armorClass" cssClass="input-box-small"></form:input></td>
                    </tr>
                    <tr>
                        <th>Maximum Dex modifier: </th>
                        <td><form:input path="maxDexModifier" cssClass="input-box-small"></form:input></td>
                    </tr>
                    <tr>
                        <th>Stealth Disadvantage</th>
                            <td><form:checkbox path="stealthDisadvantage" /></td>
                    </tr>
                    <tr>
                        <th>Strength Requirement: </th>
                        <td><form:input path="strength" cssClass="input-box-small"></form:input></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="submit" name='save' value="Save"/>
                            <a href="/CharacterSheet/admin/db-entry/armor.html" style="margin:10px; font-size: 12px;">Clear</a>
                            <a href="/CharacterSheet/admin/db-entry/equipment.html" style="margin:10px; font-size: 12px;">Back</a>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr><td>Armor:</td></tr>
                    <c:forEach items="${allArmor}" var="armor">
                        <tr>
                            <td><a class="entry-link" href="#" id="${armor.id}">${armor.name}</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form:form>
    </div>
</body>
</html>