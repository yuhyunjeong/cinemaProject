package kosta.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.EventBoard;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.NoticeBoard;
import kosta.mvc.domain.QnABoard;
import kosta.mvc.domain.QnAReply;
import kosta.mvc.service.NoticeBoardService;
import kosta.mvc.service.QnABoardService;
import kosta.mvc.service.QnAReplyService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private final NoticeBoardService noticeBoardService;
	private final QnABoardService qnABoardService;
	private final QnAReplyService qnAReplyService;

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
	
	@RequestMapping("/noticeWrite")
	public void noticeWrite() {}
	
	@RequestMapping("/noticeInsert")
	public String noticeInsert(HttpServletRequest request, NoticeBoard noticeBoard) {
		HttpSession session = request.getSession();
		noticeBoard.setMember((Member) session.getAttribute("member"));
		noticeBoardService.insert(noticeBoard);
		
		return "redirect:/board/notice";
	}
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(Long bno) {
		noticeBoardService.delete(bno);
		return "redirect:/board/notice";
	}
	
	@RequestMapping("/noticeUpdateForm")
	public ModelAndView noticeUpdateForm(Long bno) {
		NoticeBoard board = noticeBoardService.selectBy(bno);
		return new ModelAndView("board/noticeUpdate", "board", board);
	}
	
	@RequestMapping("/noticeUpdate")
	public ModelAndView noticeUpdate(NoticeBoard noticeBoard) {
		NoticeBoard board = noticeBoardService.update(noticeBoard);
		return new ModelAndView("board/noticeDetail", "board", board); 
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/qna")
	public void qna(Model model) {
		List<QnABoard> list = qnABoardService.selectAll();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/qnaDetail/{bno}")
	public ModelAndView qnaDetail(@PathVariable Long bno) {
		QnABoard board = qnABoardService.selectBy(bno);
		return new ModelAndView("board/qnaDetail", "board", board);
	}
	@RequestMapping("/qnaWrite")
	public void qnaWrite() {}
	
	@RequestMapping("/qnaInsert")
	public String qnaInsert(HttpServletRequest request, QnABoard qnaBoard) {
		HttpSession session = request.getSession();
		qnaBoard.setMember((Member) session.getAttribute("member"));
		qnABoardService.insert(qnaBoard);
		
		return "redirect:/board/qna";
	}
	
	@RequestMapping("/qnaReplyInsert")
	public String qnaReplyInsert(HttpServletRequest request, QnAReply qnaReply, Long bno) {
		qnaReply.setQnaBoard(new QnABoard(bno));
		HttpSession session = request.getSession();
		qnaReply.setMember((Member) session.getAttribute("member"));
		qnAReplyService.insert(qnaReply);
		return "redirect:/board/qnaDetail/"+bno;
	}
	
	@RequestMapping("/qnaDelete")
	public String qnaDelete(Long bno) {
		qnABoardService.delete(bno);
		return "redirect:/board/qna";
	}
	
	@RequestMapping("/qnaUpdateForm")
	public ModelAndView qnaUpdateForm(Long bno) {
		QnABoard board = qnABoardService.selectBy(bno);
		return new ModelAndView("board/qnaUpdate", "board", board);
	}
	
	@RequestMapping("/qnaUpdate")
	public ModelAndView qnaUpdate(QnABoard qnaBoard) {
		QnABoard board = qnABoardService.update(qnaBoard);
		return new ModelAndView("board/qnaDetail", "board", board); 
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/event")
	public void event() {

	}
	
	@RequestMapping("/eventWrite")
	public void eventWrite() {}
	 
	@RequestMapping("/eventInsert")
	public String eventInsert(@RequestPart MultipartFile file, EventBoard eventBoard, HttpSession session) throws Exception {
		String path = ResourceUtils.getURL("classpath:").getPath()+"static/img/event";
		File f = new File( path +"/" + file.getOriginalFilename());
		eventBoard.setEventImg(file.getOriginalFilename());

		try {
		  file.transferTo(f);
		  
		}catch (Exception e) {
			e.printStackTrace();
		}		
		
		
		
		return "redirect:/board/event";
	}
}
















