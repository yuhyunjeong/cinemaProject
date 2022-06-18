package kosta.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Event;
import kosta.mvc.domain.EventBoard;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Movie;
import kosta.mvc.domain.NoticeBoard;
import kosta.mvc.domain.QnABoard;
import kosta.mvc.domain.QnAReply;
import kosta.mvc.domain.ReviewBoard;
import kosta.mvc.dto.ReviewDTO;
import kosta.mvc.dto.eventDTO;
import kosta.mvc.service.NoticeBoardService;
import kosta.mvc.service.QnABoardService;
import kosta.mvc.service.QnAReplyService;
import kosta.mvc.service.ReviewBoardService;
import kosta.mvc.service.EventBoardService;
import kosta.mvc.service.EventService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private final NoticeBoardService noticeBoardService;
	private final QnABoardService qnABoardService;
	private final QnAReplyService qnAReplyService;
	private final EventBoardService eventBoardService;
	private final EventService eventService;
	private final ReviewBoardService reviewBoardService;

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
	public String noticeInsert(@AuthenticationPrincipal Member sessionMember, NoticeBoard noticeBoard) {
		noticeBoard.setMember(sessionMember);
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
	public String qnaInsert(@AuthenticationPrincipal Member sessionMember, QnABoard qnaBoard) {
		qnaBoard.setMember(sessionMember);
		qnABoardService.insert(qnaBoard);
		
		return "redirect:/board/qna";
	}
	
	@RequestMapping("/qnaReplyInsert")
	public String qnaReplyInsert(@AuthenticationPrincipal Member sessionMember, QnAReply qnaReply, Long bno) {
		qnaReply.setQnaBoard(new QnABoard(bno));
		qnaReply.setMember(sessionMember);
		
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
	public void event(Model model) {
		List<EventBoard> list = eventBoardService.selectAll();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/eventDetail/{bno}")
	public ModelAndView eventDetail(@PathVariable Long bno) {
		EventBoard board = eventBoardService.selectBy(bno);
		return new ModelAndView("board/eventDetail", "board", board);
	}
	
	@RequestMapping("/eventWrite")
	public void eventWrite() {}
	 
	@RequestMapping("/eventInsert")
	public String eventInsert(@RequestPart MultipartFile file, EventBoard eventBoard, HttpSession session) throws Exception {
		eventBoardService.eventInsert(eventBoard, file);

		return "redirect:/board/event";
	}
	
	@RequestMapping("/eventAttend")
	public String eventAttend(Event event, @AuthenticationPrincipal Member sessionMember, EventBoard eventBoard) {

		event.setMember(sessionMember);
		event.setEventBoard(eventBoard);
		eventService.eventAttend(event);
		System.out.println(event.getEventBoard().getBno());
		return "redirect:/board/eventDetail/"+event.getEventBoard().getBno();
	}
	
	@ResponseBody
	@RequestMapping("/eventLottery")
	public List<eventDTO> eventLottery(Long bno, Long num) {
		System.out.println("b"+bno);
		System.out.println("num"+num);
		List<eventDTO> list = eventService.lottery(bno, num);
		System.out.println(list);
		return list;
	}
	
	/////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping("/reviewList")
	@ResponseBody
	public List<ReviewDTO> reviewList(String movieCode) {

		List<ReviewDTO> list = reviewBoardService.selectByMovieCode(movieCode);

		return list;
	}
	
	@RequestMapping("/reviewInsert")
	public String reviewInsert(@AuthenticationPrincipal Member sessionMember, ReviewBoard reviewBoard, Movie movie) { 
		
		
		reviewBoard.setMovie(movie);
		reviewBoard.setMember(sessionMember);

		reviewBoardService.reviewInsert(reviewBoard);
		
		
		return "redirect:/cinema/movieDetail/"+reviewBoard.getMovie().getMovieCode();
	}
}
















