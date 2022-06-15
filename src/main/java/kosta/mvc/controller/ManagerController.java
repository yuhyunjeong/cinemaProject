package kosta.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping(value = "/product", produces = "text/html;charset=utf-8")
//	public void product(Model model, @RequestParam(defaultValue = "1") int nowPage) {
	public void product2(Model model, @RequestParam(value="productSelect", defaultValue = "movie")String select) {	
		
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
	//////////////////////////////////////////////////////////////////////
	
	/**
	 * 전체검색 
	 */
	@RequestMapping(value = "/productSelect")
	@ResponseBody
	public Map<String, Object> product(Model model, @RequestParam(value="productSelect", defaultValue = "movie")String select) {	

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
	
	
	
	
	//////////////////////////////////////////////////////////
	
	
	
	/**
	 * 상품 등록폼 
	 */
	@RequestMapping("/productWrite")
	public void productWrite() {}
	
	/**
	 * 상품등록 
	 */
	@RequestMapping("/productInsert") 
	public String productInsert(Movie movie, Food food, Gift gift, @RequestParam(value="productSelect", defaultValue = "movie")String select) {
		
//		if(select.equals("movie")) {
			
			movieService.insert(movie);

//		} else if(select.equals("food")) {
//			
//			foodService.insert(food);
//
//			
//		} else if(select.equals("gift")) {
//			
//			giftService.insert(gift);
//
//		}
		
		return "redirect:/manager/product";
	}
	
//	@RequestMapping(value = {"/productDetail/{movieCode}", "/productDetail/{foodCode}", "/productDetail/{giftCode}"})
//	public ModelAndView productDetail(@PathVariable(required = false) String movieCode, @PathVariable(required = false) String foodCode, @PathVariable(required = false) String giftCode) {
//			
//		Movie movie = movieService.selectBy(movieCode);
//		
//		return new ModelAndView("manager/productDetail", "movie", movie);
//		
//	}
//	
//	@RequestMapping("/productDetail/{movieCode}")
//	public ModelAndView productDetail(@PathVariable(required = false) String movieCode) {
//		
//		Movie movie = movieService.selectBy(movieCode);
//		
//		return new ModelAndView("manager/productDetail", "movie", movie);
//		
//	}
	
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
		
//		return new ModelAndView("manager/productDetail", "food", food);
		ModelAndView mv = new ModelAndView("manager/productDetail");
		mv.addObject("item", food);
		mv.addObject("kind", "food");
		
		return mv;
		
		
		//return new ModelAndView("manager/productDetail", "item", food);
		
		
		
		
	}
	
	/**
	 * 사은품 상세보기 
	 */
	@RequestMapping("/giftDetail/{giftCode}")
	public ModelAndView giftDetail(@PathVariable(required = false) String giftCode) {
		
		Gift gift = giftService.selectBy(giftCode);
		
//		return new ModelAndView("manager/productDetail", "gift", gift);
//		return new ModelAndView("manager/productDetail", "item", gift);
		
		ModelAndView mv = new ModelAndView("manager/productDetail");
		mv.addObject("item", gift);
		mv.addObject("kind", "gift");
		
		return mv;
		
	}
	
	/**
	 * 수정폼 
	 */
	@RequestMapping("/productUpdateForm")
	public ModelAndView productUpdateForm(String movieCode, String foodCode, String giftCode, @RequestParam(value="productSelect", defaultValue = "movie")String select) {
	
		ModelAndView mv = new ModelAndView("manager/productUpdate");
		
		if(select.equals("movie")) {
			
			Movie movie = movieService.selectBy(movieCode);
			
//			ModelAndView mv = new ModelAndView("manager/productUpdate");
			mv.addObject("item", movie);
			mv.addObject("kind", "movie");
			
//			return mv;
			
		} else if(select.equals("food")) {
			
			Food food = foodService.selectBy(foodCode);
			
//			ModelAndView mv = new ModelAndView("manager/productUpdate");
			mv.addObject("item", food);
			mv.addObject("kind", "food");
			
//			return mv;
			
		} else if(select.equals("gift")) {
			
			Gift gift = giftService.selectBy(giftCode);
			
//			ModelAndView mv = new ModelAndView("manager/productUpdate");
			mv.addObject("item", gift);
			mv.addObject("kind", "gift");
			
//			return mv;
		}
		
		return mv;

	}
	
	/**
	 * 수정하기
	 */
	@RequestMapping("/productUpdate")
	public ModelAndView productUpdate(Movie movie, Food food, Gift gift, @RequestParam(value="productSelect", defaultValue = "movie")String select) {
		
		ModelAndView mv = new ModelAndView("manager/productDetail");
		
		if(select.equals("movie")) {
			Movie dbMovie = movieService.update(movie);

			mv.addObject("item", dbMovie);
			mv.addObject("kind", "movie");
			
//			return mv;
		} else if(select.equals("food")) {   	
		
			Food dbFood = foodService.update(food);
			
//			ModelAndView mv = new ModelAndView("manager/productDetail");
			mv.addObject("item", dbFood);
			mv.addObject("kind", "food");
			
//			return mv;
			
		} else if(select.equals("gift")) {
			
			Gift dbGift = giftService.update(gift);
			
//			ModelAndView mv = new ModelAndView("manager/productDetail");
			mv.addObject("item", dbGift);
			mv.addObject("kind", "gift");
			
//			return mv;
		}
		return mv;

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