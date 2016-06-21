package kr.tinywind.blog.model;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by tinywind on 2016-06-20.
 */
public interface PostRepository extends JpaRepository<Post, Long> {
    @Query("select p from Post p where title like %:search% or content like %:search%")
    Page<Post> findByTitleOrContent(Pageable pageable, @Param("search") String search);
}
