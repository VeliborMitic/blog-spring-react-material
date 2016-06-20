package kr.tinywind.blog.model;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by tinywind on 2016-06-20.
 */
public interface PostRepository extends JpaRepository<Post, Long> {
}
