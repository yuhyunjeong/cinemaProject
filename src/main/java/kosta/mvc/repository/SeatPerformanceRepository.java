package kosta.mvc.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.SeatPerformance;
import kosta.mvc.dto.SeatPerformanceDTO;


public interface SeatPerformanceRepository extends JpaRepository<SeatPerformance, Long>, QuerydslPredicateExecutor<SeatPerformance> {
	
	/*@Query(value = "select seat_performance_code, seat_code, time_code, is_booked"
			+ " from seat_performance where time_code=?1 and is_booked=1",
			nativeQuery = true)*/
	List<SeatPerformanceDTO> findByTimeTimeCodeEquals(long timeCode);
	
	/*
	 * @Query("select t.timeCode, sp.seatcode, sp.isBooked , s.seatRow, s.seatCol\r\n"
	 * + "from SeatPerformance sp, Seat s, Time t\r\n" +
	 * "where sp.seatcode = s.seatcode\r\n" + "and t.timeCode = sp.timeCode\r\n" +
	 * "and t.timeCode=?1 \r\n" + "and sp.isBooked=1")
	 */
	/* List<String> bookedSeat(Time time, Seat seat,SeatPerformance seatPerform); */
	

}
