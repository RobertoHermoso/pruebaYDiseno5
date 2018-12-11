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
	pagesize="10" name="boxes" id="row"
	requestURI="actor/boxes.do" >
	
	<display:column	property ="name"
					titleKey="actor.box.name"/>
					
	<display:column	titleKey="actor.messages">
		<jstl:out value="${row.messages.size}" />
	</display:column>	
	
	<jstl:choose>
		<jstl:when test="${row.isSystem}"></jstl:when>
		
		<display:column>
		</display:column>
		
		<display:column>
		</display:column>
		
		<jstl:otherwise>
		
		<display:column>
			<a href="box/delete.do?boxId=${row.id}"><jstl:out value="actor.box.delete" /></a>
		</display:column>
	
		<display:column>
			<a href="box/edit.do?boxId=${row.id}"><jstl:out value="actor.box.edit" /></a>
		</display:column>	
		
		</jstl:otherwise>
	</jstl:choose>
															
</display:table>

<p><a href="box/create.do"><spring:message code="actor.box.create" /></a></p>

