package kr.tinywind.blog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by tinywind on 2016-06-20.
 */
@Controller
@RequestMapping
public class FirstController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(FirstController.class);

    @RequestMapping
    public String helloWorld(Model model, @RequestParam String name) {
        model.addAttribute("name", name);
        return "hello-world";
    }
}
