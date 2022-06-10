package kosta.mvc.service;


import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Time;
import kosta.mvc.repository.TimeRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class TimeServiceImpl implements TimeService {
	
	private final TimeRepository timeRepo;
	

	@Override
	public List<Time> selectBy(String movieCode) {

		List<Time> timeList = timeRepo.findByMovieMovieCodeEquals(movieCode);
		return timeList;
	}
	
	@Override
	public Time selectBy(long timeCode) {
		
		Time time = timeRepo.findByTimeCodeEquals(timeCode);
	
		return time;
	}
	
	@Override
	public List<Time> selectByTime(Date timeDateconvert, String movieCode) {
		List<Time> timeList = timeRepo.findByTimeDateEqualsAndMovieMovieCodeEquals(timeDateconvert, movieCode);
		return timeList;
	}
	
}
