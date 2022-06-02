package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Movie;
import kosta.mvc.service.MovieService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manager")
@RequiredArgsConstructor
public class ManagerController {

	private final MovieService movieService;
	
	@RequestMapping("/managerMain")
	public void main() {}
	
	@RequestMapping("/product")
	public void product() {
		
		// service에서 호출해서 영화검색
		List<Movie> list = movieService.selectAll();
		
	}
	
	@RequestMapping("/productDetail")
	public void productDetail() {}
	
	@RequestMapping("/productUpdate")
	public void productUpdate() {}
	
	@RequestMapping("productWrite")
	public void productWrite() {}
	
	@RequestMapping("/payment")
	public void payment() {}
	
	@RequestMapping("/paymentComplete")
	public void paymentComplete() {}
	
	@RequestMapping("/orderList")
	public void orderList() {}
	
	@RequestMapping("/salesByMonth")
	public void salesByMonth() {}
	
	@RequestMapping("/salesByMovie")
	public void salesByMovie() {}
	
	@RequestMapping("/members")
	public void members() {}
	
}
