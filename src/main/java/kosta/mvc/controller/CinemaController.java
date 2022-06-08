package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Movie;
import kosta.mvc.domain.Time;
import kosta.mvc.service.MovieService;
import kosta.mvc.service.TimeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/cinema")
@RequiredArgsConstructor
public class CinemaController {
	
	private final MovieService ms;
	private final TimeService timeService;
	
	
	@RequestMapping("/movie")
	public void movie() {}
	
	@RequestMapping("/movieDetail")
	public void movieDetail() {}
	
	/**
	 * 영화예매- 1.영화 리스트 보여주기
	 * */
	@RequestMapping("/ticketing")
	public ModelAndView ticketing() {
		//영화리스트 뿌리기
		List<Movie> movieList = ms.selectAll();
		return new ModelAndView("cinema/ticketing", "movieList", movieList);	
	}
	
	/**
	 * 영화예매- 2.영화에 맞춰 시간보여주기
	 * */
	@RequestMapping("/time")
	@ResponseBody
	public List<Time> time(String movieCode) {
		//클릭한 그 영화에 맞는 시간 뿌려주기
		System.out.println(movieCode);
		List<Time> timeList = timeService.selectAll(movieCode);
		
		
		return timeList;	
	}
	
	
	/**
	 * 영화예매- 3..좌석선택
	 * */
	@RequestMapping("/seat")
	public void seat() {
	}
	
	/**
	 * Test
	 * */
	@RequestMapping("/test")
	public void test() {
	
		
	}
	
	
}
