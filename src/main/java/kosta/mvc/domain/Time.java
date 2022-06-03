package kosta.mvc.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Time {
	
	@Id
	private Long timeCode;
	
	@ManyToOne
	@JoinColumn(name="screen_code")
	private Screen screenCode;
	
	@ManyToOne
	@JoinColumn(name="movie_code")
	private Movie movieCode;
	
	private LocalDateTime timeStart;
	
	private LocalDateTime timeEnd;
	
	private LocalDate timeDate;
}
