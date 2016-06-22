package kr.tinywind.blog.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * Created by tinywind on 2016-06-22.
 */
@EqualsAndHashCode(callSuper = true, exclude = {"post"})
@ToString(callSuper = true, exclude = {"post"})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Reply extends AbstractPersistable<Long> {
    @JsonIgnore
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Post post;

    @Size(min = 1, max = 32)
    @Column(nullable = false)
    private String name;

    @Size(min = 1, max = 32)
    @Column(nullable = false)
    private String password;

    @Size(min = 1, max = 1024)
    @Column(nullable = false)
    private String comment;

    @Basic(optional = false)
    @Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date createdAt = new Date();

    public void update(Reply reply) {
        this.name = reply.name;
        this.password = reply.password;
        this.comment = reply.comment;
    }
}