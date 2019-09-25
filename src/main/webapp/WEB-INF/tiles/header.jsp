<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<sec:authorize access="isAuthenticated()">--%>
<nav class="navbar navbar-expand navbar-light" style="background-color: cornflowerblue;">
    <a class="sidebar-toggle d-flex mr-2">
        <i class="hamburger align-self-center"></i>
    </a>

    <%--<form class="form-inline d-none d-sm-inline-block"> navbar navbar-expand navbar-light bg-white
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
    </form>--%>

    <div class="navbar-collapse collapse" >
        <ul class="navbar-nav ml-auto">

            <%--<li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}" id="userDropdown" data-toggle="dropdown">
                  <span class="d-inline-block d-md-none">
                    <i class="align-middle" data-feather="settings"></i>
                  </span>
                    <span class="d-none d-sm-inline-block">
                    <img src="img/alamin.jpg" class="avatar img-fluid rounded-circle mr-1" alt="Alamin Arefen" /> <span class="text-dark">Alamin Arefen</span>
                  </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}"><i class="align-middle mr-1" data-feather="user"></i> Profile</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}"><i class="align-middle mr-1" data-feather="pie-chart"></i> Analytics</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}">Settings & Privacy</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}">Help</a>
                    <a class="dropdown-item" href="<c:url value='/logout' />">Sign out</a>
                </div>
            </li>--%>
            <div>
                <a style=" border-radius: 5px; font-weight: bold; color: whitesmoke;" class="active nav-link " href="${pageContext.request.contextPath}/home">Home</a>
            </div>
                <div >
                    <a style=" border-radius: 5px; font-weight: bold; color: whitesmoke;" class="active nav-link " href="${pageContext.request.contextPath}/all-job-sites">Link</a>
                </div>
                <div class="dropdown ">
                    <a class="active nav-link dropdown-toggle"   data-toggle="dropdown" style=" border-radius: 5px; font-weight: bold; color: whitesmoke;">
                        <i class="align-middle mr-2 fas fa-fw fa-newspaper"></i>Newspaper
                        <%--<span class="caret"></span>--%>
                        <%--<li role="separator" class="divider"></li>--%>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu2"style="padding:10px;">
                        <a href="${pageContext.request.contextPath}/bd-newspaper"><li class="dropdown-header" style="font-weight: bolder; font-size: larger;"><i class="align-middle mr-2 fas fa-fw fa-flag"></i>Bangladesh</li></a>

                        <%--<div style="font-size: medium;" >
                            <li ><a href="#" target="_blank">Prothom Alo</a></li>
                            <%--<span class="caret"></span>--%>



                        <li role="separator" class="divider"></li>
                        <a href="${pageContext.request.contextPath}/international-newspaper"><li class="dropdown-header" style="font-weight: bolder; font-size: larger;"><i class="align-middle mr-2 fas fa-fw fa-flag-checkered"></i>International</li></a>

                    </ul>
                </div>

            <div>
                <a <%--style=" border-radius: 5px; font-weight: bold; color: black;"dropdown-item--%>  class="nav-link" href="<c:url value='/logout' />" style=" border-radius: 5px; font-weight: bold; color: whitesmoke;"><i class="align-middle mr-2 fas fa-fw fa-sign-out-alt"></i>Sign out</a>
            </div>
        </ul>
    </div>
</nav>
<%--
</sec:authorize>--%>
