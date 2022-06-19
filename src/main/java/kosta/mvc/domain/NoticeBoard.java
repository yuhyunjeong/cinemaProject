package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "noticeboard")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class NoticeBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "notice_bno_seq")
	@SequenceGenerator(sequenceName = "notice_bno_seq", allocationSize = 1, name = "notice_bno_seq")
	private Long bno; //글번호
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "id")
	private Member member; //작성자	

	private String title;
	
	@Column(length = 500)
	private String content; //내용
	
	private int readnum; //조회수
	
	@CreationTimestamp
	private LocalDateTime insertDate;
}
