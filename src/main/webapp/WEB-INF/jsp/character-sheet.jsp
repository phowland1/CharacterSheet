<%--
  Created by IntelliJ IDEA.
  User: PVarnerHowland
  Date: 7/22/2014
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="modals" tagdir="/WEB-INF/tags/modals" %>
<link href="/CharacterSheet/resources/css/global.css" rel="stylesheet">

<html>
<head>
    <title>${character.characterDescription.name}</title>
    <template:javascript/>
</head>
<body id="body">
    <div id="character-sheet">
        <form:form id="characterForm" commandName="character">
            <input type="hidden" id="pathContext" value="${pageContext.request.contextPath}">
            <c:choose>
                <c:when test="${character.id != undefined}">
                    <c:set var="charId" value="${character.id}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="charId" value="0"/>
                </c:otherwise>
            </c:choose>
            <input id="characterId" name="id" type="hidden" value="${character.id}"/>
            <table>
                <tr>
                    <td><spring:message code="character.name"/></td>
                    <td><input id="name" /></td>

                    <td><spring:message code="character.race"/></td>
                    <c:choose>
                        <c:when test="${create}">
                            <td><select id="race" disabled="true">
                                <option value="0" >Select a race</option>
                                <c:forEach items="${races}" var="race">
                                    <option value="${race.id}">${race.raceName}</option>
                                </c:forEach>
                            </select></td>
                        </c:when>
                        <c:otherwise>
                            <td>${characterModel.race.raceName}</td>
                        </c:otherwise>
                    </c:choose>
                    <td class="subraces">
                    <td id="subrace-label"><spring:message code="character.subrace"/></td>
                    <c:choose>
                        <c:when test="${create}">
                            <td><select id="subrace" class="subraces" disabled="true">
                                <option value="0">Select a sub-race</option>
                            </select></td>
                        </c:when>
                        <c:otherwise>
                            <td>${characterModel.subrace.name}</td>
                        </c:otherwise>
                    </c:choose>
                    </td>
                    <td><spring:message code="character.class"/></td>
                    <c:choose>
                        <c:when test="${create}">
                            <td><form:select id="class-select" path="clazz" disabled="true">
                                <form:option value="0" label="Select a class"/>
                                <c:forEach items="${classes}" var="clazz">
                                    <form:option value="${clazz.id}" label="${clazz.name}"/>
                                </c:forEach>
                            </form:select></td>
                        </c:when>
                        <c:otherwise>
                            <td>${characterModel.clazz.name}</td>
                        </c:otherwise>
                    </c:choose>
                <table class="float-right">
                    <tr><td><input type="button" class="float-right" id="level-character" value="Level Up"></td></tr>
                    <tr><td><input type="button" class="float-right" id="long-rest-btn" value="Long Rest"></td></tr>
                    <tr><td><input type="button" class="float-right" id="short-rest-btn" value="Short Rest"></td></tr>
                </table>
                </tr>
                <tr >
                    <td><spring:message code="character.level"/></td>
                    <td colspan="2">
                        <input class="input-box-small" id="level" readonly="true"/>
                        <spring:message code="character.ac"/>
                        <input class="input-box-small" id="armor-class" readonly="true"/>
                    </td>
                </tr>
            </table>
            <a href="javascript:void(0);" class="link-small" id="choose-subclass">Select a Sub-Class</a>
            <table>
                <tr>
                    <td>
                        <spring:message code="character.currentHealth"/>
                        <form:input cssClass="input-box-small" id="currentHealth" path="currentHealth" />
                        <spring:message code="character.maxHeath"/>
                        <form:input cssClass="input-box-small" id="maxHealth" path="maxHealth" value="${character.maxHealth}" readonly="true"/>
                        <spring:message code="character.speed"/>
                        <form:input cssClass="input-box-small" id="speed" path="speed" readonly="true"/>
                    </td>
                </tr>
            </table>
            <table id="hit-dice-table">
                <tr>
                    <td>Hit Dice:</td>
                    <c:if test="${character.hitDiceD6 > 0}"><td>d6: <input id="hit-dice-d6" class="input-box-small" readonly="true" value = ${character.hitDiceD6}></td></c:if>
                    <c:if test="${character.hitDiceD8 > 0}"><td>d8: <input id="hit-dice-d8" class="input-box-small" readonly="true" value = ${character.hitDiceD8}></td></c:if>
                    <c:if test="${character.hitDiceD10 > 0}"><td>d10: <input id="hit-dice-d10" class="input-box-small" readonly="true" value = ${character.hitDiceD10}></td></c:if>
                    <c:if test="${character.hitDiceD12 > 0}"><td>d12: <input id="hit-dice-d12" class="input-box-small" readonly="true" value = ${character.hitDiceD12}></td></c:if>
                </tr>
            </table>
            <br/>
            <c:if test="${create}">
                <c:set var="placeholderShow" value='show'/>
                <c:set var="minusHide" value="style='display: none;'"/>
            </c:if>
            <div class="table-container">
                <table class="side-by-side header">
                    <tr><td><h3><spring:message code="character.ability" /><a href="javascript:void(0);" id="ability-score-reset" class="link-small">Reset</a></h3></td></tr>
                    <tr><td><span id="ability-point-label"></span></td></tr>
                    <tr><td><input type="button" id="ability-confirm" class="hide" value="Confirm"></td></tr>
                    <tr><td><input type="button" id="buy-feat-btn" class="hide" value="Buy Feat"></td></tr>
                </table>
                <table class="side-by-side currencyheader">
                    <tr><td><h3><spring:message code="character.currency" /></h3></td></tr>
                </table>
                <table class="side-by-side header">
                    <tr><td><h3><spring:message code="character.equipped" /></h3></td></tr>
                </table>
            </div>
            <div class="clear"></div>
            <div class="table-container">
                <table class="side-by-side ability-row" id="abilties">
                    <c:forEach items="${abilityTypes}" var="ability">
                        <tr>
                            <td>${ability}</td>
                            <td class="ability-input">
                                <input class="input-box-small ability"
                                       id="${ability}"
                                       readonly="true"/>
                                <a class="modLabel" id="${ability}Mod" value=""></a>
                                <c:if test="${create}">
                                    <input type="button" id="${ability}-minus" class="ability-change hide" value="-" ${minusHide}>
                                    <div class="placeholder ${placeholderShow} hide" id="${ability}-placeholder"></div>
                                    <input type="button" id="${ability}-plus" class="ability-change  hide" value="+">
                                </c:if>
                            </td>

                        </tr>
                    </c:forEach>
                </table>
                <table class="side-by-side ability-row">
                    <tr>
                        <td>Copper:</td><td> <input class="input-box-small" id="money-copper" value="${character.coinPurse.CP}"/></td>
                    </tr>
                    <tr>
                        <td>Silver:</td><td> <input class="input-box-small" id="money-silver" value="${character.coinPurse.SP}"/></td>
                    </tr>
                    <tr>
                        <td>Electrum:</td><td> <input class="input-box-small" id="money-electrum" value="${character.coinPurse.EP}"/></td>
                    </tr>
                    <tr>
                        <td>Gold:</td><td> <input class="input-box-small" id="money-gold" value="${character.coinPurse.GP}"/></td>
                    </tr>
                    <tr>
                        <td>Platinum:</td><td> <input class="input-box-small" id="money-platinum" value="${character.coinPurse.PP}"/></td>
                    </tr>
                </table>
                <table class="side-by-side ability-row">
                    <tr>
                        <td>Main Hand: </td>
                        <td><form:select id="main-select" path="equippedMainHand">
                            <form:option value="0" label="Select one"/>
                            <c:forEach items="${inventoryWeapons}" var="weapon">
                                <form:option class="main-hand-option" value="${weapon.id}" label="${weapon.name}"/>
                            </c:forEach>
                        </form:select></td>
                    </tr>
                    <tr>
                        <td>Off Hand: </td>
                        <td><form:select id="off-select" path="equippedOffHand">
                            <form:option value="0" label="Select one"/>
                            <c:forEach items="${inventoryOffHandItems}" var="item">
                                <form:option class="off-hand-option" value="${item.id}" label="${item.name}"/>
                            </c:forEach>
                        </form:select></td>
                    </tr>
                    <tr>
                        <td>Armor: </td>
                        <td><form:select id="armor-select" path="equippedArmor">
                            <form:option value="0" label="Select one"/>
                            <c:forEach items="${inventoryArmor}" var="armor">
                                <form:option class="armor-option" value="${armor.id}" label="${armor.name}"/>
                            </c:forEach>
                        </form:select></td>
                    </tr>
                </table>
            </div>
            <div class="clear"></div>
            <h3><spring:message code="character.inventory"/></h3>
            <span class="hide" id="encumbered-label"><spring:message code="character.encumbered"/></span>
            <div class="table-container">
                <table class="side-by-side" id="weapon-inventory-table">
                    <tr><th>Weapons</th></tr>
                    <c:forEach items="${inventoryWeapons}" var="weapon">
                        <tr class="inventory-item">
                            <td><span id="weapon_${weapon.id}">${weapon.name}</span></td>
                        </tr>
                    </c:forEach>
                </table>
                <table class="side-by-side" id="armor-inventory-table">
                    <tr><th>Armor</th></tr>
                    <c:forEach items="${inventoryArmor}" var="armor">
                        <tr class="inventory-item" >
                            <td><span id="armor_${armor.id}">${armor.name}</span></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="clear"></div>
            <br/>
            <a href="javascript:void(0);" id="store-link">Store</a> <a href="javascript:void(0);" id="clear-inventory" class="link-small">Clear</a>
            <br/>
            <h3><spring:message code="character.proficiencies"/></h3>
            <span>Proficiency Bonus: </span>
            <input class="input-box-small" id="proficiency-bonus" readonly="true" value="${character.characterAdvancement.proficiencyBonus}"/>
            <span class="skill-select-label" id="skill-select-label"></span>

            <div class="table-container">
                <table class="side-by-side proficiencies" id="skillProfs">
                    <tr><th>Skills</th></tr>
                    <c:forEach items="${skillProficiencies}" var="skill">
                        <tr class="proficiency-row"><td>${skill.name}</td></tr>
                    </c:forEach>
                </table>
                <table class="side-by-side proficiencies" id="toolProfs">
                    <tr><th>Tools</th></tr>
                    <c:forEach items="${toolProficiencies}" var="tool">
                        <tr class="proficiency-row"><td>${tool.name}</td></tr>
                    </c:forEach>
                </table>
                <table class="side-by-side proficiencies" id="weaponProfs">
                    <tr><th>Weapons</th></tr>
                    <c:forEach items="${weaponProficiencies}" var="weapon">
                        <tr class="proficiency-row"><td>${weapon.name}</td></tr>
                    </c:forEach>
                </table>
                <table class="side-by-side proficiencies" id="armorProfs">
                    <tr><th>Armor</th></tr>
                    <c:forEach items="${armorProficiencies}" var="armor">
                        <tr class="proficiency-row"><td>${armor.name}</td></tr>
                    </c:forEach>
                </table>
                <table class="side-by-side proficiencies" id="saveProfs">
                    <tr class="proficiency-row"><th>Saving Throws</th></tr>
                    <c:forEach items="${savingThrowProficiencies}" var="save">
                        <tr><td>${save.name}</td></tr>
                    </c:forEach>
                </table>
            </div>
            <div class="clear"></div>
            <br/>
            <h3><spring:message code="character.languages"/></h3>
            <table id="languages">
                <c:forEach items="${character.languages}" var="language">
                    <tr class="language-row"><td>${language.name}</td></tr>
                </c:forEach>
            </table>
            <br/>

            <h3>Feats</h3>
            <div class="feats">
                <table>
                    <c:forEach items="${character.feats}" var="feat">
                        <tr class="feat-row"><td><a href="javascript:void(0);" id="feat-${feat.id} title=${feat.description}">${feat.name}</a></td></tr>
                    </c:forEach>
                </table>
            </div>
            <h3>Traits</h3>
            <div class="traits">
                <table>
                    <c:forEach items="${character.traits}" var="trait">
                        <tr><td><a href="javascript:void(0);" id="trait-${trait.id}" title="${trait.description}">${trait.name}</a></td></tr>
                    </c:forEach>
                </table>
            </div>

            <h3>Spells <a href="javascript:void(0);" class="link-small" id="all-spells">View All</a></h3>
            <div id="spell-slots"></div><br/>

            <h3>Prepared Spells</h3>
            <table id="spells-prepared">
            </table>
            <br/>

            <h4>Spells Known</h4>
            <span id="new-spells-notifier" class="link-small hide">**You can learn ${character.numSpellsAllowed} more spells!**</span>
            <div id="spells-known" class="table-container">
                <table id="level-0-spells" class="side-by-side spells-known-table">
                    <tr><th>Cantrips</th></tr>
                </table>
                <table id="level-1-spells" class="side-by-side spells-known-table">
                    <tr><th>Level One</th></tr>
                </table>
                <table id="level-2-spells" class="side-by-side spells-known-table">
                    <tr><th>Level Two</th></tr>
                </table>
                <table id="level-3-spells" class="side-by-side spells-known-table">
                    <tr><th>Level Three</th></tr>
                </table>
                <table id="level-4-spells" class="side-by-side spells-known-table">
                    <tr><th>Level Four</th></tr>
                </table>
                <table id="level-5-spells" class="side-by-side spells-known-table">
                    <tr><th>Level Five</th></tr>
                </table>
                <table id="level-6-spells" class="side-by-side spells-known-table">
                    <tr><th>Level Six</th></tr>
                </table>
                <table id="level-7-spells" class="side-by-side spells-known-table">
                    <tr><th>Level Seven</th></tr>
                </table>
                <table id="level-8-spells" class="side-by-side spells-known-table">
                    <tr><th>Level Eight</th></tr>
                </table>
                <table id="level-9-spells" class="side-by-side spells-known-table">
                    <tr><th>Level Nine</th></tr>
                </table>
            </div>
            <div class="clear"/>
            <a href="javascript:void(0);" id="add-spells">Learn Spells</a>
            <br/>
            <br/>
            <br/>
            <tr colspan="3">
                <td>
                    <input type="submit" value="Save"/>
                </td>
            </tr>
            <modals:language-modal />
            <modals:store-modal/>
            <modals:spell-modal/>
            <modals:description-modal/>
            <modals:spell-book-modal/>
            <modals:level-options-modal/>
            <modals:empty-modal/>
            <modals:hit-dice-modal/>
            <modals:feat-selection-modal/>
        </form:form>
    </div>
</body>
</html>
