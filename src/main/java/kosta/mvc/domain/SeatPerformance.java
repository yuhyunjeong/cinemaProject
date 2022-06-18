package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
//@ToString //출력할 때만 확인하려고 쓰는거고 아무런 관련없음!
public class SeatPerformance {

	@Id
	@NonNull
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seatperformance_pk")
	@SequenceGenerator(name="seatperformance_pk", allocationSize = 1, sequenceName = "seatperformance_pk")
	private Long seatPerformanceCode;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="seat_code", nullable = false)
	private Seat seat;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="time_code", nullable = false)
	@JsonIgnore
	private Time time;
	
	private boolean isBooked;
	
	
	
}
