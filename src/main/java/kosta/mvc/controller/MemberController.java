package kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping("/idCheck")
	public String idCheck(@RequestParam("id") String id) {
		String str = "";
		String i = memService.idCheck(id);
		System.out.println(id + i);
		
		if(i!=null) {
			str="NO";
		}else {
			str="YES";
		}
		
		return str;
	}
	
	@RequestMapping("/payment")
	public void payment() {}
	
	@RequestMapping("/paymentComplete")
	public void paymentComplete() {}
	
	@RequestMapping("/myPage")
	public void myPage() {}
	
//	@RequestMapping("/updateForm")
//	public ModelAndView updateForm(HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		
//		
//		
//		Member member = (Member) session.getAttribute("member");
//		System.out.println("update "+member.getId());
//		member = memService.selectBy(member.getId());
//		return new ModelAndView("member/update","member",member);
//	}
	
	@RequestMapping("/updateForm")
	public void updateForm() {}
	
//	@RequestMapping("/update")
//	public ModelAndView update(Member member, HttpSession session) {
//		
//		Member mem = memService.update(member);
//		
//		session.invalidate();
//		
//		return new ModelAndView("member/myPage","member",mem);
//	}
	
	@RequestMapping("/update")
	public String update(Member member, HttpSession session) {
		
		memService.update(member);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/delete")
	public String delete(String id, String password) {
		memService.delete(id, password);
		
		return "redirect:/";
	}
	
}
