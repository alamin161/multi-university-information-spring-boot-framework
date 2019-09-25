<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title><tiles:insertAttribute name="title" /></title>

    <link rel="stylesheet" href="/css/app.css">
    <link rel="stylesheet" href="/css/custom-design.css">


    <script src="/plugins/js/jquery-3.1.1.min.js"></script>





</head>
<body>
    <div class="wrapper">
        <div class="d-flex">
            <tiles:insertAttribute name="aside" />
            <div class="main">
                <tiles:insertAttribute name="header" />
                <tiles:insertAttribute name="content" />
                <tiles:insertAttribute name="footer" />
            </div>
        </div>
    </div>
    <!-- BEGIN BASE JS -->

    <script src="/js/app.js"></script>
    <script src="/js/charts.js"></script>
    <script src="/js/forms.js"></script>
    <script src="/js/maps.js"></script>
    <script src="/js/tables.js"></script>
</body>
</html>