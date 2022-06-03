package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MovieOrderline {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "movieorderline_pk")
	@SequenceGenerator(name="movieorderline_pk", allocationSize = 1, sequenceName = "movieorderline_pk")
	private Long movieOrderlineCode;
	
	@ManyToOne
	@JoinColumn(name="seat_code", nullable = false)
	private Seat seatCode;
	
	@ManyToOne
	@JoinColumn(name="order_code", nullable = false)
	private Orders orderCode;
	
	@ManyToOne
	@JoinColumn(name="time_code", nullable = false)
	private Time timeCode;
	
	private boolean isBooked;
	
	private boolean isWithGift;
}
