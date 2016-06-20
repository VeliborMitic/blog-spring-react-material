<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="/" class="brand-logo">Logo</a>
        <ul class="right hide-on-med-and-down">
            <li><a href="<c:url value="/"/>">Home</a></li>
            <li><a href="<c:url value="/!post/add"/>">Post</a></li>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li><a href="<c:url value="/"/>">Home</a></li>
            <li><a href="<c:url value="/!post/add"/>">Post</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>