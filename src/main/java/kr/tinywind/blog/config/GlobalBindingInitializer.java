package kr.tinywind.blog.config;

import kr.tinywind.blog.model.BlogMeta;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalBindingInitializer {
    @Autowired
    private BlogMeta meta;

    @ModelAttribute("meta")
    public BlogMeta meta() {
        return meta;
    }
}
