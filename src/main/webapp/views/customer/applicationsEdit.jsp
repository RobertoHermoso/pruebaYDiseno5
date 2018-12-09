<%--
 * action-2.jsp
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

<p><spring:message code="customer.action.2" /></p>

<form:form modelAttribute="application">
	<form:label path="status"><spring:message code="customer.status" />:</form:label>
	<select name="status">
  	<option value="PENDING"><spring:message code="customer.status.pending" /></option>
  	<option value="ACCEPTED"><spring:message code="customer.status.accepted" /></option>
 	 <option value="REJECTED"><spring:message code="customer.status.rejected" /></option>
	</select>
	</br>

	<form:label path="creditCard"><spring:message code="customer.creditCard" />:</form:label>
	<form:input path="creditCard" />
	<form:errors path="creditCard" />
	
	<input type="submit" name="save" value="<spring:message code="customer.save" />" />


	<input type="submit" name="cancel" value="<spring:message code="customer.cancel" />"
		onClick="javascript: relativeRedir('customer/applicationsList.do');" />
</form:form>