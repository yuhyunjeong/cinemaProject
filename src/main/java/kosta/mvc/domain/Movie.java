package kosta.mvc.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;

import javax.persistence.OneToOne;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date movieStartdate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date movieEnddate;
	
	private String movieGenre;
	
	private int movieAge;
	
	private String movieImage;
	
	private String actorList;
	
	@OneToOne(mappedBy="movie" , fetch = FetchType.LAZY)
	@JsonIgnore
	private Gift gift;

	@OneToMany
	@JsonIgnore
	private List<Time> timeList;
	
}
