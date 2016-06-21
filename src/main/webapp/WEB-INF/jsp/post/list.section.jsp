<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%--@elvariable id="meta" type="kr.tinywind.blog.model.BlogMeta"--%>
<%--@elvariable id="posts" type="org.springframework.data.domain.Page<kr.tinywind.blog.model.Post>"--%>

<div class="">
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
</div>

<ul class="pager">
    <c:if test="${!posts.first}">
        <li class="previous">
            <c:set var="number" value="${posts.number - 1}"/>
            <a href="?page=${number}">&larr; Newer Posts</a>
        </li>
    </c:if>
    <c:if test="${!posts.last}">
        <li class="next">
            <c:set var="number" value="${posts.number + 1}"/>
            <a href="?page=${number}">Older Posts &rarr;</a>
        </li>
    </c:if>
</ul>
