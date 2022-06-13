package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
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
import lombok.Setter;

@Entity
@Table(name = "ReviewBoard")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ReviewBoard {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "review_code_seq")
	@SequenceGenerator(sequenceName = "review_code_seq", allocationSize = 1, name = "review_code_seq")
	private Long reviewCode;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id")
	private Member member;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "movieCode")
	private Movie movie;
	
	private String content;
	
	private Long sratRating;
	
	@CreationTimestamp
	private LocalDateTime insertDate;

}
