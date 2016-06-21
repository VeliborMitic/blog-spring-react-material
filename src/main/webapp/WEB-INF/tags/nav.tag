<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="meta" type="kr.tinywind.blog.model.BlogMeta"--%>
<%--@elvariable id="_USER" type="org.springframework.social.connect.UserProfile"--%>

<nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="<c:url value="/"/>" class="brand-logo">HOME</a>
        <ul class="right hide-on-med-and-down">
            <c:choose>
                <c:when test="${_USER == null}">
                    <li>
                        <a href="javascript:$('<form/>',{method:'post', action: '<c:url value="/signin/facebook"/>'})
                        .append($('<input/>',{name:'_csrf', value: '${_csrf.token}'}))
                        .submit();">Connect to Facebook</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="cyan-text">${_USER.name} 님</li>
                    <li>
                        <a href="javascript:$('<form/>',{method:'post', action: '<c:url value="/!user/logout"/>'})
                        .append($('<input/>',{name:'_csrf', value: '${_csrf.token}'}))
                        .submit();">Disconnect</a>
                    </li>
                    <c:if test="${_USER.email.equals(meta.authorFacebookEmail)}">
                        <li><a href="<c:url value="/!post/add"/>">Post</a></li>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <c:choose>
                <c:when test="${_USER == null}">
                    <li>
                        <a href="javascript:$('<form/>',{method:'post', action: '<c:url value="/signin/facebook"/>'})
                        .append($('<input/>',{name:'_csrf', value: '${_csrf.token}'}))
                        .submit();">Connect to Facebook</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="cyan-text">${_USER.name} 님</li>
                    <li>
                        <a href="javascript:$('<form/>',{method:'post', action: '<c:url value="/!user/logout"/>'})
                        .append($('<input/>',{name:'_csrf', value: '${_csrf.token}'}))
                        .submit();">Disconnect</a>
                    </li>
                    <c:if test="${_USER.email.equals(meta.authorFacebookEmail)}">
                        <li><a href="<c:url value="/!post/add"/>">Post</a></li>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>