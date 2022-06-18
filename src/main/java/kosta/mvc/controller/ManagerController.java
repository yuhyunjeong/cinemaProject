package kosta.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
//	@RequestMapping(value = "/product", produces = "text/html;charset=utf-8")
//	public void product(Model model, @RequestParam(defaultValue = "1") int nowPage) {
//	public void product2(Model model, @RequestParam(value="productSelect", defaultValue = "movie")String select) {
	@RequestMapping("/product")
	public void productAll() {}
		
//		// service에서 호출해서 영화검색
//		if(select.equals("movie")) {
//			List<Movie> movieList = movieService.selectAll();
//			model.addAttribute("movieList", movieList);
//			
//		} else if(select.equals("food")) {
//			List<Food> foodList = foodService.selectAll();
//			model.addAttribute("foodList", foodList);
//			
//		} else if(select.equals("gift")) {
//			List<Gift> giftList = giftService.selectAll();
//			model.addAttribute("giftList", giftList);
//		}
		
		

		
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
//	}
	//////////////////////////////////////////////////////////////////////
	
	/**
	 * 전체검색 
	 */
	@RequestMapping(value = "/productSelect")
	@ResponseBody
	public Map<String, Object> product(@RequestParam(value="productSelect", defaultValue = "movie")String select) {	

		Map<String, Object> map = new HashMap<String, Object>();

		// service에서 호출해서 영화검색
		if(select.equals("movie")) {
			map.put("list", movieService.selectAll());
			
			
		} else if(select.equals("food")) {
			map.put("list", foodService.selectAll());
		
			
		} else if(select.equals("gift")) {
			map.put("list", giftService.selectAll());
			
		} 
		
		return map;

	}
	
	/**
	 * 상품 등록폼 
	 */
	@RequestMapping("/productWrite")
	public void productWrite(Model model, String write) {

		model.addAttribute("write", write);
		
	}
	
	/**
	 * 상품등록 
	 */
	@RequestMapping("/productInsert") 
	public String productInsert(Model model, @RequestPart MultipartFile file, Movie movie, Food food, Gift gift, String select) throws Exception {

		System.out.println(movie.getMovieCode());
		System.out.println(movie.getMovieName());
		System.out.println(movie.getMovieSummary());
		System.out.println(movie.getMovieRunningtime());
		System.out.println(movie.getMovieStartdate());
		System.out.println(movie.getMovieEnddate());
		System.out.println(movie.getMovieAge());
		System.out.println(movie.getMovieGenre());
//		System.out.println(movie.getMovieImage());
		System.out.println(movie.getActorList());
		System.out.println(select);
		System.out.println(food.getFoodName());
		System.out.println(food.getFoodContent());

		
		if(select.equals("movie")) {
			
			movieService.insert(movie, file);

		} else if(select.equals("food")) {
			
			foodService.insert(food, file);
			
		} else if(select.equals("gift")) {
			
			giftService.insert(gift);

		}
		
		return "redirect:/manager/product";
	}

	
	/**
	 * 영화 상세보기 
	 */
	@RequestMapping("/movieDetail/{movieCode}")
	public ModelAndView movieDetail(@PathVariable(required = false) String movieCode) {
		
		Movie movie = movieService.selectBy(movieCode);
		
		ModelAndView mv = new ModelAndView("manager/productDetail");
		mv.addObject("item", movie);
		mv.addObject("kind", "movie");
		
		return mv;
		
	}
	
	/**
	 * 먹거리 상세보기 
	 */
	@RequestMapping("/foodDetail/{foodCode}")
	public ModelAndView foodDetail(@PathVariable(required = false) String foodCode) {
		
		Food food = foodService.selectBy(foodCode);
		
		ModelAndView mv = new ModelAndView("manager/productDetail");
		mv.addObject("item", food);
		mv.addObject("kind", "food");
		
		return mv;
		
	}
	
	/**
	 * 사은품 상세보기 
	 */
	@RequestMapping("/giftDetail/{giftCode}")
	public ModelAndView giftDetail(@PathVariable(required = false) String giftCode) {
		
		Gift gift = giftService.selectBy(giftCode);
		
		ModelAndView mv = new ModelAndView("manager/productDetail");
		mv.addObject("item", gift);
		mv.addObject("kind", "gift");
		
		return mv;
		
	}
	
	
	/**
	 * 영화 수정폼 
	 */
	@RequestMapping("/movieUpdateForm")
	public ModelAndView movieUpdateForm(String movieCode) {
		
		ModelAndView mv = new ModelAndView("manager/productUpdate");

			Movie movie = movieService.selectBy(movieCode);
			
			mv.addObject("item", movie);
			mv.addObject("kind", "movie");
	
		return mv;

	}
	
	/**
	 * 영화 수정하기
	 */
	@RequestMapping("/movieUpdate")
	public ModelAndView movieUpdate(Movie movie) {

		ModelAndView mv = new ModelAndView("manager/productDetail");

			Movie dbMovie = movieService.update(movie);

			mv.addObject("item", dbMovie);
			mv.addObject("kind", "movie");
		return mv;

	}
	
	/**
	 * 먹거리 수정폼 
	 */
	@RequestMapping("/foodUpdateForm")
	public ModelAndView foodUpdateForm(String foodCode) {
		
		ModelAndView mv = new ModelAndView("manager/productUpdate");

			Food food = foodService.selectBy(foodCode);
			
			mv.addObject("item", food);
			mv.addObject("kind", "food");
	
		return mv;

	}
	
	/**
	 * 먹거리 수정하기
	 */
	@RequestMapping("/foodUpdate")
	public ModelAndView foodUpdate(Food food) {
		
		ModelAndView mv = new ModelAndView("manager/productDetail");

			Food dbFood = foodService.update(food);

			mv.addObject("item", dbFood);
			mv.addObject("kind", "food");
		return mv;

	}
	
	/**
	 * 사은품 수정폼 
	 */
	@RequestMapping("/giftUpdateForm")
	public ModelAndView GiftUpdateForm(String giftCode) {
		
		ModelAndView mv = new ModelAndView("manager/productUpdate");

			Gift gift = giftService.selectBy(giftCode);
			
			mv.addObject("item", gift);
			mv.addObject("kind", "gift");
	
		return mv;

	}
	
	/**
	 * 사은품 수정하기
	 */
	@RequestMapping("/giftUpdate")
	public ModelAndView giftUpdate(Gift gift) {
		
		ModelAndView mv = new ModelAndView("manager/productDetail");

			Gift dbGift = giftService.update(gift);

			mv.addObject("item", dbGift);
			mv.addObject("kind", "gift");
			
		return mv;

	}
	
	/**
	 * 영화 삭제하기 
	 */
	@RequestMapping("/movieDelete")
	public String movieDelete(String movieCode) {

		movieService.delete(movieCode);
		
		return "redirect:/manager/product";
	}
	
	/**
	 * 영화 삭제하기 
	 */
	@RequestMapping("/foodDelete")
	public String foodDelete(String foodCode) {

		foodService.delete(foodCode);
		
		return "redirect:/manager/product";
	}
	
	/**
	 * 영화 삭제하기 
	 */
	@RequestMapping("/giftDelete")
	public String giftDelete(String giftCode) {
		
		giftService.delete(giftCode);
		
		return "redirect:/manager/product";
	}

}