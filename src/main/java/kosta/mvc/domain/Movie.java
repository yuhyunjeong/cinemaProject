package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Movie {

	@Id
	@NonNull
	private String movieCode;
	
	private String movieName;
	private String movieSummary;
	private int movieRunningtime;
	private LocalDateTime movieStartdate;
	private LocalDateTime movieEnddate;
	
	private int movieRated;
	
	private String movieGenre;
	
	
	
	
}
