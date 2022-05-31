package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	@RequestMapping("/movie")
	public void movie() {}
	
	@RequestMapping("/movieDetail")
	public void movieDetail() {}
	
	@RequestMapping("/ticketing")
	public String ticketing() {
		return "cinema/ticketing";
	}
}
