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
    @Query("Select c from Post c where ((c.title like %:search%) or (c.content like %:search%))")
    Page<Post> findByTitleOrContent(Pageable pageable, @Param("search") String search);
}
