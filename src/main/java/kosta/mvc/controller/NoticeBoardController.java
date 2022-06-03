package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.NoticeBoard;
import kosta.mvc.service.NoticeBoardService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class NoticeBoardController {
	private final NoticeBoardService noticeBoardService;

	@RequestMapping("/notice")
	public void notice(Model model) {
		System.out.println(1111);
		List<NoticeBoard> list = noticeBoardService.selectAll();
		System.out.println(2222);
		model.addAttribute("list", list);

	}
}
