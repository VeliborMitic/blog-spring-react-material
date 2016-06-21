<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%--@elvariable id="meta" type="kr.tinywind.blog.model.BlogMeta"--%>

<page:layout>
    <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <br>
                <br>
                <h1 class="header center teal-text text-lighten-2">${meta.title}</h1>
                <div class="row center">
                    <h5 class="header col s12 light">${meta.greeting}</h5>
                </div>
                    <%--
                    <div class="row center">
                        <a href="http://materializecss.com/getting-started.html" id="download-button"
                           class="btn-large waves-effect waves-light teal lighten-1">Get Started</a>
                    </div>
                    --%>
                <br>
                <br>
            </div>
        </div>
        <div class="parallax"><img src="<c:url value="/image/background1.jpg"/>"/></div>
    </div>

    <div class="container">
        <div class="row">
            <div class="l8 offset-l2 m10 offset-m1">
                <jsp:include page="/!post/list-index.section" flush="true"/>
            </div>
        </div>
    </div>
</page:layout>