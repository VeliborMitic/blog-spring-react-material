package kr.tinywind.blog.config;

import kr.tinywind.blog.interceptor.InitInterceptor;
import kr.tinywind.blog.interceptor.UserProfileInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by tinywind on 2016-06-20.
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Autowired
    private ConnectionRepository connectionRepository;

    @Bean
    public InitInterceptor initInterceptor() {
        return new InitInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new UserProfileInterceptor(connectionRepository));
        registry.addInterceptor(initInterceptor());
        super.addInterceptors(registry);
    }
}
