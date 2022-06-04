package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Movie {

	@Id
	@NonNull
	private String movieCode;
	
	private String movieName;
	
	private String movieSummary;
	
	private int movieRunningtime;
	
	private Date movieStartdate;
	
	private Date movieEnddate;
	
	private int movieRated;
	
	private String movieGenre;
	
	private Date movieInsertdate;
	
	private String movieImage;
	
	
}
