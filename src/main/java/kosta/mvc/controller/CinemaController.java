package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Movie;
import kosta.mvc.service.MovieService;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/cinema")
@RequiredArgsConstructor
public class CinemaController {
	
	private final MovieService ms;
	
	@RequestMapping("/movie")
	public void movie() {}
	
	@RequestMapping("/movieDetail")
	public void movieDetail() {}
	
	/**
	 * 영화예매- 1.영화선택 
	 * */
	@RequestMapping("/ticketing")
	public ModelAndView ticketing() {
		
		//영화리스트뿌리기
		List<Movie> movieList = ms.selectAll();
		
		return new ModelAndView("cinema/ticketing", "movieList", movieList);
		
		//영화시간뿌리기
		
	}
	
	/**
	 * 영화예매 - 2. 영화시간 선택
	 * */
	 public void product(Model model, @RequestParam(value="productSelect", defaultValue = "movie")String select) {
		 
		 
	 }
		
	
	/**
	 * 영화예매- 2.좌석선택
	 * */
	@RequestMapping("/seat")
	public void seat() {
	}
	
}
