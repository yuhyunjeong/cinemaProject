package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Seat;
import kosta.mvc.domain.SeatPerformance;
import kosta.mvc.domain.Time;

public interface SeatPerformanceService {
	
	/**
	 * 타임코드로 검색
	 * */
	List<SeatPerformance> selectBy(Time time);
	
	/**
	 * 전체검색
	 * */
	List<SeatPerformance> selectAll();
	
	/**
	 * 일정있는 좌석 리스트 뽑기
	 * */
	/* List<String> bookedSeat(Time time, Seat seat,SeatPerformance seatPerform); */
	
}
