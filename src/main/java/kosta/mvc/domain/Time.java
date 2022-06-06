package kosta.mvc.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "time_pk")
	@SequenceGenerator(name = "time_pk", allocationSize = 1, sequenceName = "time_pk")
	private Long timeCode;
	
	@ManyToOne
	@JoinColumn(name="screen_code")
	private Screen screenCode;
	
	@ManyToOne
	@JoinColumn(name="movie_code")
	private Movie movie;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeStart;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeEnd;
	
	private Date timeDate;
	
}
