<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%--@elvariable id="meta" type="kr.tinywind.blog.model.BlogMeta"--%>
<%--@elvariable id="posts" type="org.springframework.data.domain.Page<kr.tinywind.blog.model.Post>"--%>

<c:forEach var="post" items="${posts.content}">
    <a href="/!post/${post.id}" class="card-panel card small waves-effect waves-block">
        <div class="card-title cyan-text text-darken-4">${post.title}</div>
        <div class="card-content black-text text-darken-4">${post.content}</div>
        <div class="card-action right-align black-text text-lighten-3">
            Posted by <strong>${meta.author}</strong> on <i><fmt:formatDate value="${post.createdAt}"
                                                                            pattern="yyyy-MM-dd"/></i>
        </div>
    </a>
</c:forEach>

<ul class="row pagination center-align">
    <li><a href="<c:url value="/!post/list?page=0"/>"> <i class="material-icons">chevron_left</i> </a></li>
    <c:forEach var="num" begin="${posts.number - 5 > 0 ? posts.number - 5 : 0}"
               end="${posts.number + 5 < posts.totalPages -1 ? posts.number + 5 : posts.totalPages -1}">
        <c:choose>
            <c:when test="${posts.number == num}">
                <li class="disabled"> ${num + 1} </li>
            </c:when>
            <c:otherwise>
                <li class="waves-effect"><a href="<c:url value="/!post/list?page=${num}"/>"> ${num + 1} </a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <li><a href="<c:url value="/!post/list?page=${posts.totalPages - 1}"/>"> <i class="material-icons">chevron_right</i> </a></li>
</ul>