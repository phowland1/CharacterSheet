<%--
  Created by IntelliJ IDEA.
  User: PVarnerHowland
  Date: 7/22/2014
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>

<html>
</head>
<body>
    <div id="character-list">
        <input type="hidden" id="id" name="id" value="0"/>
        <head>
            <title>Characters</title>
            <template:javascript/>
        <input type="hidden" id="name" name="name" value=""/>
        <form:form commandName="character" id="characterForm">
            <table>
                <c:forEach items="${characters}" var="character">
                    <tr id="row-${character.id}">
                        <td>${character}</td>
                        <td><a href="#no" onclick="submitCharacter(${character.id})" class='characterLink' id="${character.id}" />
                                ${character.name} - ${raceMap[character.race].raceName} ${classMap[character.clazz].name}
                            <a href="#" class="delete-char link-small" id="${character.id}-delete" class="link-small">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>
                        <a href="#" id="new-character">Create new character</a>
                    </td>
                </tr>
            </table>
            </form:form>
    </div>
</body>
</html>
