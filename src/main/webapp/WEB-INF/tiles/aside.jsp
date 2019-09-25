<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--<sec:authorize access="isAuthenticated()">--%>
    <nav class="sidebar sidebar-sticky">
        <div class="sidebar-content">
            <a class="sidebar-brand" href="${pageContext.request.contextPath}/home">
                <i class="feather feather-book-open align-middle mr-2" data-feather="book-open"></i>
                <span class="align-middle">multiUniversity</span>
            </a>

            <ul class="sidebar-nav">
                <li class="sidebar-header">
                    <i class="feather feather-menu align-middle mr-2" data-feather="menu"></i>
                    Main
                </li>

                <li class="sidebar-item">
                    <a href="#layouts" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="feather feather-book align-middle mr-2" data-feather="book"></i>
                        <span class="align-middle">University</span>
                    </a>
                    <ul id="layouts" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/public-university">Public University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/private-university">Private University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/engineering-university">Engineering University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/public-medical-college">Public Medical College</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/private-medical-college">Private Medical College</a></li>

                    </ul>
                </li>

                <li class="sidebar-item">

                    <a href="#pages" data-toggle="collapse" class="sidebar-link collapsed">
                        <!-- <i class="align-middle mr-2 fas fa-fw fa-brain"></i> -->
                        <i class="align-middle mr-2 fas fa-fw fa-brain" ></i>
                        <span class="align-middle">Research</span>
                    </a>
                    <ul id="pages" class="sidebar-dropdown list-unstyled collapse ">

                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/public-university-research">Public University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/private-university-research">Private University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/engineering-university-research">Engineering University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/public-medical-college-research">Public Medical College</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/private-medical-college-research">Private Medical College</a></li>

                    </ul>
                </li>

                <%--<li class="sidebar-item">
                    <a class="sidebar-link" href="documentation.html">
                        <i class="align-middle" data-feather="book-open"></i> <span class="align-middle">Documentation</span>
                    </a>
                </li>--%>
                <%--<li class="sidebar-header">
                    Components
                </li>--%>
                <li class="sidebar-item">
                    <a href="#ui" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="feather feather-award align-middle mr-2" data-feather="award"></i>
                        <span class="align-middle">Achievements</span>
                    </a>
                    <ul id="ui" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/public-university-achievement">Public University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/private-university-achievement">Private University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/engineering-university-achievement">Engineering University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/public-medical-college-achievement">Public Medical College</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/private-medical-college-achievement">Private Medical College</a></li>

                    </ul>
                </li>

                <li class="sidebar-item">
                    <a href="#uit" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="feather feather-award align-middle mr-2" data-feather="award"></i>
                        <span class="align-middle">Teacher</span>
                    </a>
                    <ul id="uit" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/public-university-teacher">Public University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/private-university-teacher">Private University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/engineering-university-teacher">Engineering University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/public-medical-college-teacher">Public Medical College</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/private-medical-college-teacher">Private Medical College</a></li>

                    </ul>
                </li>

                <li class="sidebar-item">
                    <a href="#tui" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="feather feather-check-circle align-middle mr-2" data-feather="check-circle"></i>
                        <span class="align-middle">Basic Form</span>
                    </a>
                    <ul id="tui" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/teacher">Teacher</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/university-type">University Type</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/university">University</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/achievement">Achievement</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/research">Research</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/department-type">Department</a></li>
                    </ul>
                </li>

                <li class="sidebar-header">
                    Testing
                </li>
                <li class="sidebar-item">
                    <%--<a href="#maps" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="map-pin"></i> <span class="align-middle">Maps</span>
                    </a>
                    <ul id="maps" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="maps-google.html">Google Maps</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="maps-vector.html">Vector Maps</a></li>
                    </ul>--%>
                    <!-------------------------------------------------------------->
                    <!---------------by me ----------------------------------------->
                    <ul>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/test">Test</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/userregistration">User Registration</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/formtest">Form Test</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>
<%--
</sec:authorize>--%>
