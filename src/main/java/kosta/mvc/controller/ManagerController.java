package kosta.mvc.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Food;
import kosta.mvc.domain.Gift;
import kosta.mvc.domain.Movie;
import kosta.mvc.service.FoodService;
import kosta.mvc.service.GiftService;
import kosta.mvc.service.MovieService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manager")
@RequiredArgsConstructor
public class ManagerController {

	private final MovieService movieService;
	private final FoodService foodService;
	private final GiftService giftService;

	private final static int PAGE_COUNT = 5;
	private final static int  BLOCK_COUNT = 4;
	
	@RequestMapping("/managerMain")
	public void main() {}
	
	/**
	 * 전체검색 
	 */
	@RequestMapping("/product")
//	public void product(Model model, @RequestParam(defaultValue = "1") int nowPage) {
	public void product(Model model, @RequestParam(value="productSelect", defaultValue = "movie")String select) {	
		
		// service에서 호출해서 영화검색
		if(select.equals("movie")) {
			List<Movie> movieList = movieService.selectAll();
			model.addAttribute("movieList", movieList);
			
		} else if(select.equals("food")) {
			List<Food> foodList = foodService.selectAll();
			model.addAttribute("foodList", foodList);
			
		} else if(select.equals("gift")) {
			List<Gift> giftList = giftService.selectAll();
			model.addAttribute("giftList", giftList);
		}
		
		

		
		// 페이징 처리하기
//		Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "movieCode");
//		Page<Movie> moviePageList = movieService.selectAll(page);
//		
//		model.addAttribute("moviePageList", moviePageList);
//		
//		int blockCount = 3;
//		int temp = (nowPage-1)%BLOCK_COUNT; // 나머지는 항상 0 1 2 => blockCount가 3이므로 3보다 작은값 
//		int startPage = nowPage-temp;
//		
//		model.addAttribute("blockCount", BLOCK_COUNT);
//		model.addAttribute("startPage", startPage);
//		model.addAttribute("nowPage", nowPage);
	}
	
	/**
	 * 상품 등록폼 
	 */
	@RequestMapping("/productWrite")
	public void productWrite() {}
	
	/**
	 * 상품등록 
	 */
	@RequestMapping("/insert") 
	public String insert(Model model, Movie movie, Food food, Gift gift, @RequestParam(value="productSelect", defaultValue = "movie")String select) {
		
		if(select.equals("movie")) {
			movieService.insert(movie);
			model.addAttribute("movieCode", movie.getMovieCode());
			
		} else if(select.equals("food")) {
			foodService.insert(food);
			
		} else if(select.equals("gift")) {
			giftService.insert(gift);
		}
		
		return "redirect:/manager/product";
		
	}
	
	/**
	 * 상세보기 
	 */
	@RequestMapping("/productDetail/{movieCode}")
	public ModelAndView productDetail(@PathVariable String movieCode) {
		
		Movie movie = movieService.selectBy(movieCode);
		
		return new ModelAndView("manager/productDetail", "movie", movie);
		
	}
	
	/**
	 * 수정폼 
	 */
	@RequestMapping("/productUpdateForm")
	public ModelAndView productUpdateForm(String movieCode, String foodCode, String giftCode, @RequestParam(value="productSelect", defaultValue = "movie")String select) {
	
//		if(select.equals("movie")) {
//			
//			Movie movie = movieService.selectBy(movieCode);
//			
//			return new ModelAndView("manager/productUpdate", "movie", movie);
//			
//		} else if(select.equals("food")) {
//			
//			Food food = foodService.selectBy(foodCode);
//			
//			return new ModelAndView("manager/productUpdate", "food", food);
//		} else if(select.equals("gift")) {
//			
//			Gift gift = giftService.selectBy(giftCode);
//			
//			return new ModelAndView("manager/productUpdate", "gift", gift);
//		}
		
	
		Movie movie = movieService.selectBy(movieCode);
		
		return new ModelAndView("manager/productUpdate", "movie", movie);

	}
	
	/**
	 * 수정하기
	 */
	@RequestMapping("/productUpdate")
	public ModelAndView productUpdate(Movie movie) {
		
		Movie dbMovie = movieService.update(movie);
		
		return new ModelAndView("manager/productDetail", "movie", dbMovie);
	}
	
	/**
	 * 삭제하기 
	 */
	@RequestMapping("/productDelete")
	public String delete(String movieCode) {
		
		movieService.delete(movieCode);
		
		return "redirect:/manager/product";
	}
	
	

	
}
