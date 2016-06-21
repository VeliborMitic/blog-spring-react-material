<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%--@elvariable id="meta" type="kr.tinywind.blog.model.BlogMeta"--%>
<%--@elvariable id="_USER" type="org.springframework.social.connect.UserProfile"--%>

<page:layout>
    <style>
        .staggered li {
            opacity: 0;
            list-style-type: none;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="l8 offset-l2 m10 offset-m1">
                <jsp:include page="/!post/list-index.section" flush="true"/>
            </div>
        </div>
    </div>

    <page:scripts>
        <script type="text/javascript">
            $(window).load(function () {
                Materialize.showStaggeredList(".staggered");
            });
            <c:if test="${_USER != null}">
            Materialize.scrollFire([{
                selector: '.staggered', offset: 0, callback: function () {
                    Materialize.toast("Hello ${_USER.name}!", 1500);
                }
            }]);
            </c:if>
        </script>
    </page:scripts>
</page:layout>