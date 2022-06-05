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
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class SeatPerformance {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seatperformance_pk")
	@SequenceGenerator(name="seatperformance_pk", allocationSize = 1, sequenceName = "seatperformance_pk")
	@NonNull
	private Long seatPerformanceCode;
	
	@ManyToOne
	@JoinColumn(name="seat_code", nullable = false)
	private Seat seatCode;
	
	@ManyToOne
	@JoinColumn(name="time_code", nullable = false)
	private Time timeCode;
	
	private boolean isBooked;
	
}
