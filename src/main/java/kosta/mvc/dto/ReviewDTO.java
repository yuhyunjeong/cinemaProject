package kosta.mvc.dto;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.Movie;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReviewDTO {
	private Long reviewCode;
	
	private String content;
	private Long starRating;
	private String insertDate;

	private MemberDTO member;

	public ReviewDTO(Long reviewCode, String content, Long starRating, String insertDate) {
		super();
		this.reviewCode = reviewCode;
		this.content = content;
		this.starRating = starRating;
		this.insertDate = insertDate;
	}
	
	
	
	

}



