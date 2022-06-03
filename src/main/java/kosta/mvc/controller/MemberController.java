package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@RequestMapping("/login")
	public void login() {}
	
	@RequestMapping("/join")
	public void join() {}
	
	@RequestMapping("/payment")
	public void payment() {}
	
	@RequestMapping("/paymentComplete")
	public void paymentComplete() {}
}
