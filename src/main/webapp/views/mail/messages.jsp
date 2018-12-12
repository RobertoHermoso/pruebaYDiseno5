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

<security:authorize access="isAuthenticated()">

<spring:url var="showActor" value="/actor/authenticated/edit.do"/>

<h4><spring:message code="actor.logged" /><a href="${showActor}"><jstl:out value=" ${username}"/></a></h4>

<display:table
	pagesize="10" name="messages" id="row"
	requestURI="messages/authenticated/list.do" >
	
	<display:column	property ="moment"
					titleKey="mail.message.moment"/>
					
	<display:column	titleKey="mail.message.subject">
	
		<spring:url var="showMessage" value="/message/authenticated/show.do?messageId={rowId}">
			<spring:param name="rowId" value="${row.id}"/>
		</spring:url>
	
		<a href="${showMessage}"><jstl:out value="${row.subject}" /></a>
	</display:column>	
							
	<display:column	titleKey="mail.message.sender">
		<jstl:out value="${row.sender.name}" />
	</display:column>	
					
	<display:column titleKey="">
		<spring:url var="replyMessage" value="/message/authenticated/new.do?messageId=*{rowId}">
			<spring:param name="rowId" value="${row.id}"/>
		</spring:url>
	
		<a href="${replyMessage}"><spring:message code="mail.message.reply"/></a>
	</display:column>
	
	<display:column titleKey="">
		<spring:url var="deleteMessage" value="/message/authenticated/delete.do?messageId={rowId}">
			<spring:param name="rowId" value="${row.id}"/>
		</spring:url>
	
		<a href="${deleteMessage}" onclick="return confirm('<spring:message code="mail.delete" />')"><spring:message code="mail.message.delete"/></a>
	</display:column>	
															
</display:table>

<spring:url var="newMessage" value="/message/authenticated/new.do"/>

<p><a href="${newMessage}"><spring:message code="mail.message.new" /></a></p>

<spring:url var="mail" value="/box/authenticated/list.do"/>

<p><a href="${mail}"><spring:message code="mail.back" /></a></p>

</security:authorize>