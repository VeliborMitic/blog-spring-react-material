package kr.tinywind.blog.controller;

import kr.tinywind.blog.model.Post;
import kr.tinywind.blog.model.PostRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by tinywind on 2016-06-20.
 */
@Controller
@RequestMapping("/!post")
public class PostController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(PostController.class);

    @Autowired
    private PostRepository postRepository;

    @RequestMapping("list")
    @ResponseBody
    public List<Post> reqList() {
        List<Post> all = postRepository.findAll();
        logger.trace("POST LIST ------------------------------------------------");
        all.forEach(e -> logger.trace("POST[" + e.getId() + "] " + e.getTitle()));
        return all;
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String reqAdd(Model model, @ModelAttribute Post post) {
        return "post/add";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String reqAdd(Post post) {
        Post flushedPost = postRepository.saveAndFlush(post);
        logger.info("SAVED POST[" + flushedPost.getId() + "] " + flushedPost.getTitle());
        return "redirect:/!post/list";
    }
}
