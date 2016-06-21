<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%--@elvariable id="meta" type="kr.tinywind.blog.model.BlogMeta"--%>

<page:layout>
    <div class="container">
        <h1>META CONFIG</h1>

        <form:form commandName="meta" action="/!meta/init" method="post" enctype="multipart/form-data">
            <table class="highlight centered responsive-table">
                <thead>
                <tr>
                    <th>key</th>
                    <th>value</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="variables">title,author,authorFacebookEmail,introduce,greeting,mail</c:set>
                <c:forEach var="var" items="${variables}">
                    <tr>
                        <td>${var}</td>
                        <td><form:input path="${var}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <hr/>
            <div class="center">
                <button class="btn-large waves-effect waves-light teal lighten-1" type="submit">commit</button>
            </div>
        </form:form>
    </div>
</page:layout>
