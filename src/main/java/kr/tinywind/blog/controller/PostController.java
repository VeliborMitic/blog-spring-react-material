package kr.tinywind.blog.controller;

import kr.tinywind.blog.model.Post;
import kr.tinywind.blog.model.PostRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by tinywind on 2016-06-20.
 */
@Controller
@RequestMapping("!post")
public class PostController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(PostController.class);

    @Autowired
    private PostRepository postRepository;

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

    @RequestMapping("list")
    public String reqList(Model model, @RequestParam(value = "search", required = false) String search) {
        model.addAttribute("search", search);
        return "post/list";
    }

    @RequestMapping("list-index.section")
    public String reqListIndexSection(Model model, @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC, size = 3) Pageable pageable) {
        model.addAttribute("posts", postRepository.findAll(pageable));
        return "post/list-index.section";
    }

    @RequestMapping("list.section")
    public String reqListSection(Model model, @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC, size = 5) Pageable pageable, @RequestParam(value = "search", required = false, defaultValue = "") String search) {
        model.addAttribute("search", search);
        model.addAttribute("posts", postRepository.findByTitleOrContent(pageable, search));
        return "post/list.section";
    }

    @RequestMapping("{id}")
    public String reqPost(Model model, @PathVariable("id") Long id) {
        model.addAttribute("post", postRepository.findOne(id));
        return "post/post";
    }

    @RequestMapping("{id}/delete")
    public String reqDelete(@PathVariable("id") Long id) {
        postRepository.delete(id);
        return "redirect:/post";
    }

    @RequestMapping(value = "{id}/modify", method = RequestMethod.GET)
    public String reqModify(Model model, @PathVariable("id") Long id) {
        model.addAttribute("post", postRepository.findOne(id));
        return "post/form";
    }

    @RequestMapping(value = "{id}/modify", method = RequestMethod.POST)
    public String reqModify(Post post, @PathVariable("id") Long id) {
        Post fetch = postRepository.getOne(id);
        fetch.update(post);
        return "redirect:/post/" + postRepository.save(fetch).getId();
    }
}
