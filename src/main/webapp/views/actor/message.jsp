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

<h4><spring:message code="actor.logged" /><jstl:out value=" ${username}"/></h4>

<ul>
	<li><spring:message code="actor.message.moment"/><jstl:out value=": ${message.moment}" /></li>
	<li><spring:message code="actor.message.subject"/><jstl:out value=": ${message.subject}" /></li>
	<li><spring:message code="actor.name"/><jstl:out value=": ${message.name}" /></li>
</ul>

<p><spring:message code="actor.message.move"/></p>
<form name="move" id="move" action="message/move.do" method="get">
	<input type="text" id="messageId" name="messageId" value="<jstl:out value="${message.id}" />" hidden=""/>
	<select name="boxes" id="boxes">
		<jstl:forEach var="box" items="boxes">
			<option value="${box.id}"><jstl:out value="${box.name}"/></option>
		</jstl:forEach>
	</select>
	<input type="submit" name = "save" value="<spring:message code="actor.save"/>"/>
</form>

<ul>
	<li><a href="message/new.do?messageId=<jstl:out value="${message.id}"/>"><spring:message code="actor.message.reply"/></a></li>
	<li><a href="message/delete.do?messageId=<jstl:out value="${message.id}"/>"><spring:message code="actor.message.delete"/></a></li>
</ul>

<p><jstl:out value="${message.body}"/></p>

<p><a href="actor/mail.do"><spring:message code="actor.back"/></a></p>

