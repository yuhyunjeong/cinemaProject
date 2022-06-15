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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.Orders;
import kosta.mvc.dto.SalesTotalDTO;
import kosta.mvc.service.MemberService;
import kosta.mvc.service.OrderService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manager")
@RequiredArgsConstructor
public class ManagerMemberSalesController {

	private final OrderService orderService;
	
	private final MemberService memberService;
	
	public static final int BLOCK_COUNT = 3;
	public static final int PAGE_COUNT = 10;
	
	@RequestMapping("/orderList")
	public void orderList(Model model, @RequestParam(defaultValue="1") int nowPage) {
		Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "orderCode"); //pk
		Page<Orders> pageList = orderService.selectAll(page);
		
		model.addAttribute("pageList", pageList);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
		 
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
	}
	
	@RequestMapping("/orderDetail/{orderCode}")
	public ModelAndView orderDetail(@PathVariable Long orderCode) {
		Orders order = orderService.selectByOrderCode(orderCode);
		//System.out.println(order.getMovieOrderline().g);
		return new ModelAndView("manager/orderDetail","order", order);
	}
	
	@RequestMapping("/totalSales")
	public void totalSales() {
		salesByMonth();
	}
	
	@RequestMapping("/salesByMonth")
	@ResponseBody
	public List<SalesTotalDTO> salesByMonth() {
		System.out.println("ManagerMemberSalesController의 salesByMonth() call...");
		List<SalesTotalDTO> monthlySalesList = orderService.selectMonthlySalesList();
		return monthlySalesList;
	}
	
	@RequestMapping("/salesByYear")
	@ResponseBody
	public List<SalesTotalDTO> salesByYear() {
		System.out.println("ManagerMemberSalesController의 salesByYear() call...");
		List<SalesTotalDTO> yearlySalesList = orderService.selectYearlySalesList();
		return yearlySalesList;
	}
	
	@RequestMapping("/salesByMovie")
	public void salesByMovie() {
		
	}
	
	@RequestMapping("/memberList")
	public void members(Model model, @RequestParam(defaultValue="1") int nowPage) {
		Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "id"); //pk
		Page<Member> pageList = memberService.selectAll(page);
		
		model.addAttribute("pageList", pageList);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
		 
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
	}
	
	@RequestMapping("/memberDetail/{memberId}")
	public ModelAndView memberDetail(@PathVariable String memberId) {
		Member member = memberService.selectBy(memberId);
		return new ModelAndView("manager/memberDetail","member", member);
	}
}
