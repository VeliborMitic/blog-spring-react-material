<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:html>
    <form method="post" action="<c:url value="/!meta/init"/>">
        <table>
            <thead>
            <tr>
                <th>key</th>
                <th>value</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>title</td>
                <td><input name="title"/></td>
            </tr>
            </tbody>
        </table>

        <hr/>
        <button type="submit">commit</button>
    </form>
</page:html>
