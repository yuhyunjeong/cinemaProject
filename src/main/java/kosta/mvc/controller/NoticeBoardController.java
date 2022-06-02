package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class NoticeBoardController {

	@RequestMapping("/notice")
	public String notice() {
		return "board/notice";
	}
}
