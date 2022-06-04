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
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "qnaboard")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class QnABoard {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "qna_bno_seq")
	@SequenceGenerator(sequenceName = "qna_bno_seq", allocationSize = 1, name = "qna_bno_seq")
	private Long bno; //글번호
	
	@ManyToOne
	@JoinColumn(name = "id")
	private Member member; //작성자	

	private String title;
	
	@Column(length = 500)
	private String content; //내용
	
	@CreationTimestamp
	private LocalDateTime insertDate;
}
