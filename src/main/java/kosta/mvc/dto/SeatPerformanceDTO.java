package kosta.mvc.dto;

import kosta.mvc.domain.Seat;
import kosta.mvc.domain.Time;

public interface SeatPerformanceDTO {

	Long getSeatPerformanceCode();
	Seat getSeat();
	Time getTime();
	Boolean getIsBooked();
}
