package kosta.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@RequestMapping("login")
	public String loginCheck(String id, String password, HttpSession session) {
		
		System.out.println(id + password);
		Member member = memService.loginCheck(id, password);
		System.out.println(member);
		if(member != null) {
			session.setAttribute("member", member);
		}
		
		
		return "redirect:/";
	}
	
	@RequestMapping("logout")
	public String logout(Member member , HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/";
	}
	
	@RequestMapping("/joinForm")
	public void joinForm() {}
	
	@PostMapping("/join")
	public String join(Member member) {
		memService.join(member);
		
		return "redirect:/member/loginForm";
		
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(@RequestBody String id) {
		int count = 0;
		count = memService.idCheck(id);
		return count;
	}
	
	@RequestMapping("/payment")
	public void payment() {}
	
	@RequestMapping("/paymentComplete")
	public void paymentComplete() {}
}
