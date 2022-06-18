package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Food;
import kosta.mvc.domain.Movie;
import kosta.mvc.domain.Screen;
import kosta.mvc.domain.Time;
import kosta.mvc.dto.SeatPerformanceDTO;
import kosta.mvc.service.FoodService;
import kosta.mvc.service.MovieService;
import kosta.mvc.service.SeatPerformanceService;
import kosta.mvc.service.TimeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/cinema")
@RequiredArgsConstructor
public class CinemaController {

	private final MovieService movieService;
	private final TimeService timeService;
	private final FoodService foodService;
	private final SeatPerformanceService seatPerService;
	
	public static final int BLOCK_COUNT = 3;
	public static final int PAGE_COUNT = 10;

	@RequestMapping("/movie")
	public void movie(Model model, @RequestParam(defaultValue="1") int nowPage) {
		Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "movieCode"); //pk
		Page<Movie> pageList = movieService.selectAllByPage(page);
		
		model.addAttribute("pageList", pageList);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
		 
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
	}
	
	@RequestMapping("/movieDetail/{movieCode}")
	public ModelAndView movieDetail(@PathVariable String movieCode) {
		
		Movie movie = movieService.selectBy(movieCode);
		
		return new ModelAndView("cinema/movieDetail","movie",movie);
	}
	

	/**
	 * 영화예매- 1.영화 리스트 보여주기
	 */
	@RequestMapping("/ticketing")
	public ModelAndView ticketing() {
		// 영화리스트 뿌리기
		List<Movie> movieList = movieService.selectAll();
		return new ModelAndView("cinema/ticketing", "movieList", movieList);
	}

	/**
	 * 영화예매- 2.영화에 맞춰 날짜보여주기
	 */
	@RequestMapping("/date")
	@ResponseBody
	public List<Time> date(String movieCode) {
		// 클릭한 그 영화에 맞는 날짜 뿌려주기
		List<Time> timeList = timeService.selectBy(movieCode);

		return timeList;
	}
	
	/**
	 * 영화예매- 2.영화, 날짜에 맞춰 시간보여주기
	 */
	@RequestMapping("/time")
	@ResponseBody
	public List<Time> time(String timeDate, String  movieCode) {
		Date timeDateconvert = new Date(timeDate);
		List<Time> timeList = timeService.selectByTime(timeDateconvert, movieCode);
	
		return timeList;
	}

	/**
	 * 영화예매- 3.영화정보 띄워주기 (영화 포스터, 영화 이름)
	 */
	@RequestMapping("/ticketingInfo")
	@ResponseBody
	public Movie ticketingInfo(String movieCode) {

		Movie movie = movieService.selectBy(movieCode);

		return movie;
	}

	/**
	 * 영화예매 -3.영화정보 띄워주기(상영관, 시간) : 연관된 Screen 객체를 통째로 못가져와서 이렇게 낱개값만 가져오자..
	 */
	@RequestMapping("/ticketingInfo2")
	@ResponseBody
	public Map<String, Object> ticketingInfo2(long timeCode) {

		Time time = timeService.selectBy(timeCode);
		Screen sc = time.getScreen();
		Map<String, Object> map = new HashedMap();
		map.put("time", time);
		map.put("screenName", sc.getScreenName());
		map.put("screenCode", sc.getScreenCode());

		return map;
	}
	
	/** 
	 * 영화예매- 4. 좌석선택 전 예매 정보 뿌려주기 & 좌석보여주기(seat_performance의 isBooked 체크)
	 */
	@RequestMapping("/seat")
	public void seat(Model model,  Time time, @RequestParam("mCode") String mCode ,  @RequestParam("tdate") @DateTimeFormat(iso =ISO.DATE_TIME) Date tdate,  
			@RequestParam("tStart") @DateTimeFormat(iso =ISO.DATE_TIME) Date tStart, @RequestParam("sCode") Screen sCode) { //
	
		time.setTimeDate(tdate);
		time.setTimeStart(tStart);
		time.setScreen(sCode);
		Movie movie = movieService.selectBy(mCode);
		model.addAttribute("movie", movie);
	
		//상영관에 따라 행열 값주기
		if(sCode.getScreenCode()==1) {
			int row = sCode.getScreenRow();
			int col = sCode.getScreenCol();
			model.addAttribute("row", row);
			model.addAttribute("col", col);
			
		}else if(sCode.getScreenCode()==0){
			int row = sCode.getScreenRow();
			int col = sCode.getScreenCol();
			model.addAttribute("row", row);
			model.addAttribute("col", col);
		}
		
		//
		
	
 	}
	
	/**
	 * 영화예매- 4.좌석선택 전 예약되어 있는 자리 보여주기
	 */
	  @RequestMapping("/chooseSeat")
	  @ResponseBody
	  public List<SeatPerformanceDTO> chooseSeat(Model model, @RequestParam("tCode") Long tCode){ //timeCode를 가지고 가서 
		  Time time = new Time();
		  time.setTimeCode(tCode);
		  List<SeatPerformanceDTO> seatPerList = seatPerService.selectBy(time); 
		  
		  System.out.println("CinemaController의 chooseSeat() 호출....");
		  System.out.println(seatPerList.get(0).getSeat()); //kosta.mvc.domain.Seat@2c82cc8e
		  return seatPerList;
		  //System.out.println(seatPerList); 
		  //seatPerformance테이블의 isBooked가 1인(예약됨)seatCode를 가져오고 싶음. 
	  }
	 
	
	/**
	 * 영화예매- 4.좌석선택 전 인원설정
	 */
	@RequestMapping("/people")
	public void people(int peopleNum) {
		
	}
	
	/**
	 * 영화예매 -5.먹거리 뿌려주기
	 * */
	@RequestMapping("/foods")
	public ModelAndView foods() {
		List<Food> foodList = foodService.selectAll();
		return new ModelAndView("cinema/seat", "foodList", foodList);
	}
	
	/**
	 * 영화 나열 - 최신순 , 예매율순, 별점순
	 * */
	@ResponseBody
	@RequestMapping("/selectMovie")
	public List<Movie> selectMovie(@RequestParam("optionsRadios") String optionsRadios , String flexCheckDefault) {
		List<Movie> movie = movieService.selectMovie(optionsRadios 
				//, flexCheckDefault
				);
		
		List<String> movieDate = new ArrayList<String>();
		
		return movie;
	}
	
    /**
     * 상영 중 영화 
     * */
    @ResponseBody
    @RequestMapping("/nowMovie")
    public List<Movie> nowMovie() {
        
        List<Movie> movie = movieService.nowMovie();
        
        return movie;
    }
	
	
}
