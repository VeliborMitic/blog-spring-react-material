package kr.tinywind.blog.config;

import org.apache.catalina.filters.CorsFilter;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.servlet.Filter;

/**
 * Created by http://millky.com/@origoni/post/1170
 */

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Bean
    public FilterRegistrationBean corsFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(corsFilter());
        registration.addUrlPatterns("/url/*");
        registration.addInitParameter("cors.allowed.origins", "*");
        registration.addInitParameter("cors.allowed.headers", "Content-Type,X-Requested-With,accept,authorization,Origin,Access-Control-Request-Method,Access-Control-Request-Headers");
        registration.addInitParameter("cors.allowed.methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD");
        registration.setName("corsFilter");
        registration.setOrder(1);
        return registration;
    }

    @Bean(name = "corsFilter")
    public Filter corsFilter() {
        return new CorsFilter();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
//                .formLogin()
//                .loginPage("/!user/login")
//                .and()
                .logout()
                .logoutUrl("/!user/logout")
                .deleteCookies("JSESSIONID")
                .logoutSuccessUrl("/")
                .and()
                .authorizeRequests()
                .antMatchers("/**/write*", "/**/edit*", "/**/delete*").authenticated()
                .antMatchers("/**").permitAll();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/h2-console/**");
    }
}
