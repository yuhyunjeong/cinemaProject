package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Orders;
import kosta.mvc.service.OrderService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manager")
@RequiredArgsConstructor
public class ManagerMemberSalesController {

	private final OrderService orderService;
	
	@RequestMapping("/orderList")
	public void orderList(Model model) {
		
		List<Orders> list = orderService.selectAll();
		model.addAttribute("orderList", list);
	}
	@RequestMapping("/orderDetail")
	public void orderList(Long orderCode) {
		
	}
	
	@RequestMapping("/salesByMonth")
	public void salesByMonth() {}
	
	@RequestMapping("/salesByMovie")
	public void salesByMovie() {}
	
	@RequestMapping("/members")
	public void members() {}
	
}
