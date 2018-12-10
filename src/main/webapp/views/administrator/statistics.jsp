<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<h3><spring:message code="administrator.statistics" /></h3>	

<security:authorize access="hasRole('ADMIN')">

<spring:message code="statistics.table1" />
<br />
<table>
	<tr>
		<td><spring:message code="statistics.table1.average" /></td> 
		<td><jstl:out value="${statistics.get('applicationPerFixUpTask').get(0)}" /> </td>
	</tr>
	<tr>
		<td><spring:message code="statistics.table1.minimum"/></td> 
		<td><jstl:out value="${statistics.get('applicationPerFixUpTask').get(1)}" /> </td>
	</tr>
	<tr>
		<td><spring:message code="statistics.table1.maximum"/></td> 
		<td><jstl:out value="${statistics.get('applicationPerFixUpTask').get(2)}" /> </td>
	</tr>
	<tr>
		<td><spring:message code="statistics.table1.standardDeviation"/></td> 
		<td><jstl:out value="${statistics.get('applicationPerFixUpTask').get(3)}" /> </td>
	</tr>
</table>
<br />
<br />

<spring:message code="statistics.table2" />
<br />
<table>
	<tr>
		<td><spring:message code="statistics.table2.average" /></td> 
		<td><jstl:out value="${statistics.get('priceOferredPerApplication').get(0)}" /> </td>
	</tr>
	<tr>
		<td><spring:message code="statistics.table2.minimum"/></td> 
		<td><jstl:out value="${statistics.get('priceOferredPerApplication').get(1)}" /> </td>
	</tr>
	<tr>
		<td><spring:message code="statistics.table2.maximum"/></td>
		<td><jstl:out value="${statistics.get('priceOferredPerApplication').get(2)}" /> </td>
	</tr>
	<tr>
		<td><spring:message code="statistics.table2.standardDeviation"/></td> 
		<td><jstl:out value="${statistics.get('priceOferredPerApplication').get(3)}" /> </td>
	</tr>
</table>
<br />
<br />

<spring:message code="statistics.ratioPendingApplications" /> <jstl:out  value="${ratios.get('ratioPendingElapsedApplications')}"/>
	
</security:authorize>
