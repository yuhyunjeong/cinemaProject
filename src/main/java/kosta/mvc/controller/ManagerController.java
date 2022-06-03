package kosta.mvc.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.mvc.domain.Movie;
import kosta.mvc.service.MovieService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manager")
@RequiredArgsConstructor
public class ManagerController {

	private final MovieService movieService;

	private final static int PAGE_COUNT = 5;
	private final static int  BLOCK_COUNT = 4;
	
	@RequestMapping("/managerMain")
	public void main() {}
	
	@RequestMapping("/product")
	public void product(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		// service에서 호출해서 영화검색
//		List<Movie> movieList = movieService.selectAll();
		
		// 페이징 처리하기
		Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "movieCode");
		Page<Movie> moviePageList = movieService.selectAll(page);
		
		model.addAttribute("moviePageList", moviePageList);
		
		int blockCount = 3;
		int temp = (nowPage-1)%BLOCK_COUNT; // 나머지는 항상 0 1 2 => blockCount가 3이므로 3보다 작은값 
		int startPage = nowPage-temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
	}
	
	@RequestMapping("/productDetail")
	public void productDetail() {}
	
	@RequestMapping("/productUpdate")
	public void productUpdate() {}
	
	@RequestMapping("productWrite")
	public void productWrite() {}
	
}
