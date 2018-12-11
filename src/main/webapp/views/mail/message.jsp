<%--
 * action-1.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize access="sAuthenticated()">

<spring:url var="showActor" value="/actor/authenticated/edit.do"/>

<h4><spring:message code="actor.logged" /><a href="${showActor}"><jstl:out value=" ${username}"/></a></h4>

<ul>
	<li><spring:message code="mail.message.moment"/><jstl:out value=": ${message.moment}" /></li>
	<li><spring:message code="mail.message.subject"/><jstl:out value=": ${message.subject}" /></li>
	<li><spring:message code="mail.message.sender"/><jstl:out value=": ${message.name}" /></li>
</ul>

<p><spring:message code="mail.message.sender"/></p>

<spring:url var="moveMessage" value="/message/authenticated/move.do"/>

<form name="move" id="move" action="${moveMessage}" method="get">
	<input type="text" id="messageId" name="messageId" value="${message.id}" hidden=""/>
	<select name="boxId" id="boxId">
	<spring:message code="mail.move.to"/>
		<jstl:forEach var="box" items="${boxes}">
			<option value="${box.id}"><jstl:out value="${box.name}"/></option>
		</jstl:forEach>
	</select>
	<input type="submit" name = "move" value="<spring:message code="mail.move"/>"/>
</form>

<spring:url var="replyMessage" value="/message/authenticated/new.do?messageId={messageId}">
	<spring:param name="messageId" value="${message.id}"/>
</spring:url>
<spring:url var="deleteMessage" value="/message/authenticated/delete.do?messageId={messageId}">
	<spring:param name="messageId" value="${message.id}"/>
</spring:url>

<ul>
	<li><a href="${replyMessage}"><spring:message code="mail.message.reply"/></a></li>
	<li><a href="${deleteMessage}"><spring:message code="mail.message.delete"/></a></li>
</ul>

<p><jstl:out value="${message.body}"/></p>

<spring:url var="mail" value="/box/authenticated/list.do"/>

<p><a href="${mail}"><spring:message code="mail.back"/></a></p>

</security:authorize>