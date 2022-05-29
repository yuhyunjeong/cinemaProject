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
	
	@NonNull
	private String movieName;
	
	@NonNull
	private String movieSummary;
	
	@NonNull
	private int movieRunningtime;
	
	@NonNull
	private LocalDateTime movieStartdate;
	
	@NonNull
	private LocalDateTime movieEnddate;
	
	@NonNull
	private int movieRated;
	
	@NonNull
	private String movieGenre;
	
	
	
	
}
