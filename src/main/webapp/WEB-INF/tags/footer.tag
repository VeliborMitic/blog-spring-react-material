<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="meta" type="kr.tinywind.blog.model.BlogMeta"--%>

<div class="container">
    <div class="row">
        <div class="col l6 s12">
            <h5 class="white-text">Introduce</h5>
            <p class="grey-text text-lighten-4">${meta.introduce}</p>
        </div>
    </div>
</div>
<div class="footer-copyright">
    <div class="container">
        Made by <a class="brown-text text-lighten-3" href="mailto:${meta.mail}">${meta.author}</a>
        <div style="float: right;">
            Since <i class="brown-text text-lighten-3"><fmt:formatDate value="${meta.createdAt}"
                                                                       pattern="yyyy-MM-dd"/></i>
        </div>
    </div>
</div>