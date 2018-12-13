<%--
 * header.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div>
	<a href="#"><img src="images/Fondo_log.png" height= 180px width= 700px alt="Acme-Handy-Worker Co., Inc." /></a>
</div>

<div>
	<ul id="jMenu">
		<!-- Do not forget the "fNiv" class for the first level links !! -->
		<security:authorize access="hasRole('ADMIN')">
			<li><a class="fNiv"><spring:message	code="master.page.administrator" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="administrator/banunban.do"><spring:message code="master.page.administrator.banUnban" /></a></li>
					<li><a href="administrator/broadcast.do"><spring:message code="master.page.administrator.broadcast" /></a></li>	
					<li><a href="administrator/computedscore.do"><spring:message code="master.page.administrator.computedscore" /></a></li>					
					<li><a href="administrator/createadmin.do"><spring:message code="master.page.administrator.createadmin" /></a></li>					
					<li><a href="administrator/createreferee.do"><spring:message code="master.page.administrator.createreferee" /></a></li>			
					<li><a href="administrator/goodandbadwordslist.do"><spring:message code="master.page.administrator.goodAndBadWordsList" /></a></li>	
					<li><a href="administrator/showstaitsticspart1.do"><spring:message code="master.page.administrator.showstaitsticspart1" /></a></li>	
					<li><a href="administrator/listcategory.do"><spring:message code="master.page.administrator.listcategory" /></a></li>	
					<li><a href="administrator/listwarranty.do"><spring:message code="master.page.administrator.listwarranty" /></a></li>														
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="hasRole('CUSTOMER')">
			<li><a class="fNiv"><spring:message	code="master.page.customer" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="customer/fixuptask.do"><spring:message code="master.page.customer.fixUpTask" /></a></li>
					<li><a href="customer/listendorsment.do"><spring:message code="master.page.customer.listendorsment" /></a></li>									
				</ul>
			</li>
					
			
		</security:authorize>
		
		<security:authorize access="hasRole('HANDYWORKER')">
			<li><a class="fNiv"><spring:message	code="master.page.handyworker" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="handyworker/applications.do"><spring:message code="master.page.handyworker.applications" /></a></li>
					<li><a href="handyworker/listendorsment.do"><spring:message code="master.page.handyworker.listendorsment" /></a></li>									
				</ul>
			</li>
		</security:authorize>
		
			<security:authorize access="hasRole('REFEREE')">
			<li><a class="fNiv"><spring:message	code="master.page.referee" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="referee/complaints.do"><spring:message code="master.page.referee.complaints" /></a></li>
					<li><a href="referee/complaintsreport.do"><spring:message code="master.page.referee.complaintsreport" /></a></li>									
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="security/login.do"><spring:message code="master.page.login" /></a></li>
			<li><a class="fNiv" href="actor/neweditactor.do"><spring:message code="master.page.actor.neweditactor /></a></li>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li>
				<a class="fNiv"> 
					<spring:message code="master.page.profile" /> 
			        (<security:authentication property="principal.username" />)
				</a>
				<ul>
					<li class="arrow"></li>
					<li><a href="profile/boxes.do"><spring:message code="master.page.profile.boxes" /></a></li>
					<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" /> </a></li>
				</ul>
			</li>
		</security:authorize>
	</ul>
</div>

<div>
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>

