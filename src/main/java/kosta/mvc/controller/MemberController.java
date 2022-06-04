package kosta.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Member;
import kosta.mvc.service.MemberService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memService;
	
	@RequestMapping("/loginForm")
	public void login() {}
	
	@GetMapping("login")
	public void loginCheck() {}
	
	@PostMapping("login")
	public String loginCheck(String id, String password, HttpSession session) {
		Member member = memService.loginCheck(id, password);
		if(member != null) {
			session.setAttribute("member", member);
		}
		return "/";
	}
	
	@RequestMapping("/joinForm")
	public void joinForm() {}
	
	@PostMapping("/join")
	public String join(Member member) {
		memService.join(member);
		
		return "redirect:/";
		
	}
	
	@RequestMapping("/payment")
	public void payment() {}
	
	@RequestMapping("/paymentComplete")
	public void paymentComplete() {}
}
