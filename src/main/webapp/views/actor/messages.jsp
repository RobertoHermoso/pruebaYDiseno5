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

<display:table
	pagesize="10" name="messages" id="row"
	requestURI="actor/messages.do" >
	
	<display:column	property ="moment"
					titleKey="actor.message.moment"/>
					
	<display:column	titleKey="actor.message.subject">
		<a href="message/show.do?messageId=${row.id}"><jstl:out value="${row.subject}" /></a>
	</display:column>	
							
	<display:column	titleKey="actor.name">
		<jstl:out value="${row.sender.name}" />
	</display:column>	
					
	<display:column>
		<a href="message/new.do?messageId=${row.id}"><jstl:out value="actor.message.reply" /></a>
	</display:column>
	
	<display:column>
		<a href="message/delete.do?messageId=${row.id}"><jstl:out value="actor.message.delete" /></a>
	</display:column>	
															
</display:table>

<p><a href="message/new.do>"><spring:message code="actor.message.new" /></a></p>

