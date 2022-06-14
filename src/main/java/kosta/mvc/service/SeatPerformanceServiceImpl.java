package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.QSeatPerformance;
import kosta.mvc.domain.SeatPerformance;
import kosta.mvc.domain.Time;
import kosta.mvc.repository.SeatPerformanceRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class SeatPerformanceServiceImpl implements SeatPerformanceService {
	/*
	 * private final SeatPerformanceRepository seatPerformRepo;
	 * 
	 * @Override public List<SeatPerformance> selectBy(Time time) { //BooleanBuilder
	 * builder = new BooleanBuilder(); //QSeatPerformance qSeat =
	 * QSeatPerformance.seatPerformance;
	 * 
	 * //builder.and(qSeat.time.timeCode.equals(time.getTimeCode());
	 * 
	 * 
	 * return null; }
	 * 
	 * @Override public List<SeatPerformance> selectAll() { return null; }
	 */

}
