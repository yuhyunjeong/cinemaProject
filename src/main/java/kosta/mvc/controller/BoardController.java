package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import kosta.mvc.domain.NoticeBoard;
import kosta.mvc.domain.QnABoard;
import kosta.mvc.service.NoticeBoardService;
import kosta.mvc.service.QnABoardService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private final NoticeBoardService noticeBoardService;
	private final QnABoardService qnABoardService;

	@RequestMapping("/notice")
	public void notice(Model model) {
		List<NoticeBoard> list = noticeBoardService.selectAll();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/noticeDetail/{bno}")
	public ModelAndView noticeDetail(@PathVariable Long bno) {
		NoticeBoard board = noticeBoardService.selectBy(bno);
		return new ModelAndView("board/noticeDetail", "board", board);
	}
	
	@RequestMapping("/qna")
	public void qna(Model model) {
		List<QnABoard> list = qnABoardService.selectAll();
		model.addAttribute("list", list);
	}
}
