package kr.tinywind.blog.interceptor;

import kr.tinywind.blog.model.BlogMeta;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by tinywind on 2016-06-20.
 */
public class InitInterceptor extends BaseInterceptor {
    @Autowired
    private BlogMeta meta;

    @Autowired
    private ServletContext servletContext;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        final String contextPath = servletContext.getContextPath();
        final String uri = request.getRequestURI().substring(contextPath.length());
        final String metaInitUri = "/!meta/init";

        if (!uri.contains(metaInitUri) && !uri.contains("/error")) {
            if (!meta.isInitialized()) {
                redirect(response, contextPath + metaInitUri);
                return false;
            }
        }

        return true;
    }
}
