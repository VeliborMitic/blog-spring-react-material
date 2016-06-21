<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%--@elvariable id="meta" type="kr.tinywind.blog.model.BlogMeta"--%>
<%--@elvariable id="post" type="kr.tinywind.blog.model.Post"--%>
<%--@elvariable id="_USER" type="org.springframework.social.connect.UserProfile"--%>

<page:layout>
    <article>
        <div class="container">
            <div class="row">
                <div class="l8 offset-l2 m10 offset-m1">
                    <h1>${post.title}</h1>
                    <hr/>
                    <div>${post.content}</div>
                    <div class="right black-text text-lighten-3">Posted by <a
                            href="mailto:${meta.mail}">${meta.author}</a> on ${post.createdAt}</div>
                </div>
            </div>

            <c:if test="${_USER != null}">
                <div class="row">
                    <div class="right">
                        <a href="/!post/${post.id}/modify">
                            <button type="button" class="btn btn-warning">Edit</button>
                        </a>
                        <a href="/!post/${post.id}/delete" onclick="if(!confirm('삭제하시겠습니까?')){return false;}">
                            <button type="button" class="btn btn-danger">Delete</button>
                        </a>
                    </div>
                </div>
            </c:if>
        </div>
    </article>
</page:layout>
