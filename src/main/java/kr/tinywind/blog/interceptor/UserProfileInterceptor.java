package kr.tinywind.blog.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by http://millky.com/@origoni/post/1170
 */
public class UserProfileInterceptor extends HandlerInterceptorAdapter {
    private static Logger logger = LoggerFactory.getLogger(UserProfileInterceptor.class);

    private ConnectionRepository connectionRepository;

    public UserProfileInterceptor(ConnectionRepository connectionRepository) {
        this.connectionRepository = connectionRepository;
    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Connection<Facebook> connection;

        try {
            connection = connectionRepository.findPrimaryConnection(Facebook.class);
        } catch (Exception e) {
            connection = null;
        }

        if (connection != null) {
            UserProfile profile = connection.fetchUserProfile();
            request.setAttribute("_USER", profile);
            logger.trace("login: " + profile.getEmail());
        }
        return true;
    }
}
