<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="warranty.action.1" /></p>

<security:authorize access="hasRole('ADMIN')">

<display:table
	pagesize="5" name="warranties" id="row"
	requestURI="warranty/list.do" >
	
	<display:column>
	<jstl:if test="${row.isDraftMode == false}"><jstl:out value="disabled='disabled'"/></jstl:if>
		<a href="warranty/edit.do?warrantyId=${row.id}" />
		<spring:message code="warranty.edit" />
	</display:column>
	
	<display:column property="title" titlekey="warranty.title">
		<jstl:out value="${row.title}" />
	</display:column>
	
	<display:column titleKey="warranty.terms">
        <jstl:set var="termsSize" value="${row.terms.size()}" />
        <spring:url var="termsUrl" value="/terms/list.do?warrantyId={warrId}">
              <spring:param name="warrId" value="${row.id}"/>
        </spring:url>
        <a href="${termsUrl}">
              <spring:message var ="viewTerms1" code="warranty.viewTerms" />
              <jstl:out value="$viewTerms1}(${termsSize})" />    
        </a>
    </display:column>
		
	<display:column titleKey="warranty.laws">
        <jstl:set var="lawsSize" value="${row.laws.size()}" />
        <spring:url var="lawsUrl" value="/laws/list.do?warrantyId={warrId}">
              <spring:param name="warrId" value="${row.id}"/>
        </spring:url>
        <a href="${termsUrl}">
              <spring:message var ="viewLaws1" code="warranty.viewLaws" />
              <jstl:out value="$viewLaws1}(${lawsSize})" />    
        </a>
    </display:column>
	
	<display:column property="title" titlekey="warranty.isDraftMode">
		<jstl:out value="${row.isDraftMode}" />
	</display:column>										
</display:table>
</br>

<a href="fixuptask/warranty/edit.do"><spring:message code="warranty.create" /></a>

</security:authorize>