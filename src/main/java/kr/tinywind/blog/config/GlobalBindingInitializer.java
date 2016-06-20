package kr.tinywind.blog.config;

import kr.tinywind.blog.model.BlogMeta;
import kr.tinywind.blog.util.TagExtender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalBindingInitializer {
    @Autowired
    private BlogMeta meta;

    @Autowired
    private TagExtender tagExtender;

    @ModelAttribute("meta")
    public BlogMeta meta() {
        return meta;
    }

    @ModelAttribute
    public TagExtender tagExtender() {
        return tagExtender;
    }
}
