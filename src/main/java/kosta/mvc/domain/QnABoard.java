package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "qnaboard")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class QnABoard {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "qna_bno_seq")
	@SequenceGenerator(sequenceName = "qna_bno_seq", allocationSize = 1, name = "qna_bno_seq")
	@NonNull
	private Long bno; //글번호
	
	@ManyToOne
	@JoinColumn(name = "id")
	private Member member; //작성자	

	private String title;
	
	@Column(length = 5000)
	private String content; //내용
	
	@CreationTimestamp
	private LocalDateTime insertDate;
	
	@OneToMany(mappedBy = "qnaBoard", cascade = CascadeType.ALL)
	private List<QnAReply> replyList;
}
