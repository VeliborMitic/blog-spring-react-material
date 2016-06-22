package kr.tinywind.blog.model;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by tinywind on 2016-06-22.
 */
public interface ReplyRepository extends JpaRepository<Reply, Long> {
}
