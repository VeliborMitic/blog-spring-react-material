package kr.tinywind.blog.controller;

import kr.tinywind.blog.model.Post;
import kr.tinywind.blog.model.PostRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
        return postRepository.findAll();
    }

    @RequestMapping("add")
    public String reqAdd(Post post) {
        Post flushedPost = postRepository.saveAndFlush(post);
        logger.info("SAVED POST[" + flushedPost.getId() + "] " + flushedPost.getTitle());
        return "redirect:/!post/list";
    }
}
