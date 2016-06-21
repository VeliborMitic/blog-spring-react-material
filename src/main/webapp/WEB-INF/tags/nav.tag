<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%--@elvariable id="meta" type="kr.tinywind.blog.model.BlogMeta"--%>
<%--@elvariable id="_USER" type="org.springframework.social.connect.UserProfile"--%>

<nav class="top-nav transparent">
    <div class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <div class="nav-wrapper"><a class="page-title">${meta.title}</a></div>
                <div class="row center">
                    <h5 class="header col s12 light">${meta.greeting}</h5>
                </div>
            </div>
        </div>
        <div class="parallax"><img src="<c:url value="/image/background1.jpg"/>"/></div>
    </div>
</nav>
<div class="container">
    <a href="#" data-activates="nav-mobile" class="button-collapse top-nav full hide-on-large-only">
        <i class="material-icons">menu</i>
    </a>
</div>
<ul id="nav-mobile" class="side-nav fixed">
    <li class="logo bold">
        <a id="logo-container" href="<c:url value="/"/>" class="brand-logo">
            HOME
        </a>
    </li>
    <li class="search">
        <form method="get" action="<c:url value="/!post/list"/>">
            <div class="search-wrapper card">
                <input id="search" name="search"><i class="material-icons">search</i>
                <div class="search-results"></div>
            </div>
        </form>
    </li>
    <c:choose>
        <c:when test="${_USER == null}">
            <li class="bold">
                <a class="waves-effect waves-teal"
                   href="javascript:$('<form/>',{method:'post', action: '<c:url value="/signin/facebook"/>'})
                        .append($('<input/>',{name:'_csrf', value: '${_csrf.token}'}))
                        .submit();">Connect to Facebook</a>
            </li>
        </c:when>
        <c:otherwise>
            <li class="no-padding">
                <ul class="collapsible collapsible-accordion">
                    <li class="bold active">
                        <a class="collapsible-header waves-effect waves-teal cyan-text">${_USER.name} 님</a>
                        <div class="collapsible-body" style="display: block;">
                            <ul>
                                <li>
                                    <a class="waves-effect waves-teal">
                                        정보 변경
                                    </a>
                                </li>
                                <li>
                                    <a class="waves-effect waves-teal"
                                       href="javascript:$('<form/>',{method:'post', action: '<c:url value="/!user/logout"/>'})
                                        .append($('<input/>',{name:'_csrf', value: '${_csrf.token}'}))
                                        .submit();">Disconnect</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </li>
            <c:if test="${_USER.email.equals(meta.authorFacebookEmail)}">
                <li>
                    <a class="waves-effect waves-teal" href="<c:url value="/!post/add"/>">
                        Post
                    </a>
                </li>
            </c:if>
        </c:otherwise>
    </c:choose>
</ul>

<page:scripts>
    <script>
        $('#search').focusin(function () {
            $(this).parent().addClass('focused');
        }).focusout(function () {
            $(this).parent().removeClass('focused');
        });
    </script>
</page:scripts>