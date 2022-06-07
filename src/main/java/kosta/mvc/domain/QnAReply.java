package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class QnAReply {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reply_rno_seq")
	@SequenceGenerator(sequenceName = "reply_rno_seq", allocationSize = 1, name = "reply_rno_seq")
	private Long rno; //글번호
	
	@Column(length = 500)
	private String content; //내용
	
	@ManyToOne
	@JoinColumn(name = "id")
	private Member member;

	@CreationTimestamp
	private LocalDateTime insertDate;
	
	//연관관계 - fk설정
	@ManyToOne
	@JoinColumn(name = "qna_bno")
	private QnABoard qnaBoard;
}
