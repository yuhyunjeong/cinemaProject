package kosta.mvc.service;


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
	//private final MovieRepository movieRepo;

	@Override
	public List<Time> selectAll(String movieCode) {

		List<Time> timeList = timeRepo.findByMovieMovieCodeEquals(movieCode);
		
		System.out.println(timeList);
		
		return timeList;
	}

}
