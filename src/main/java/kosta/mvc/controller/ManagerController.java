package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Movie;
import kosta.mvc.domain.Orders;
import kosta.mvc.service.MovieService;
import kosta.mvc.service.OrderService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manager")
@RequiredArgsConstructor
public class ManagerController {

	private final MovieService movieService;

	@RequestMapping("/managerMain")
	public void main() {}
	
	@RequestMapping("/product")
	public void product(Model model) {
		
		// service에서 호출해서 영화검색
		List<Movie> movieList = movieService.selectAll();
		
		model.addAttribute("movieList", movieList);
	}
	
	@RequestMapping("/productDetail")
	public void productDetail() {}
	
	@RequestMapping("/productUpdate")
	public void productUpdate() {}
	
	@RequestMapping("productWrite")
	public void productWrite() {}
	
}
