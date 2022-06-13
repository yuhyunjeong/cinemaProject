package kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		System.out.println(id);
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
	
	@RequestMapping("/myPage/{id}")
	public ModelAndView myPage(@PathVariable String id) {

		Member mem = memService.selectBy(id);
		return new ModelAndView("member/myPage","member", mem);
	}
	
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
	
	@RequestMapping("/updateForm/{id}")
	public ModelAndView updateForm(@PathVariable String id) {
		
		Member mem = memService.selectBy(id);
		return new ModelAndView("member/updateForm","member", mem);
	}
	
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
		//System.out.println(1111);
		memService.update(member);
		
		session.invalidate();
		
		return "redirect:/member/loginForm";
	}
	
	@RequestMapping("/memberDelete/{id}")
	public ModelAndView memberDelete(@PathVariable String id) {
		Member mem = memService.selectBy(id);
		return new ModelAndView("member/memberDelete","member", mem);
	}
	
	@RequestMapping("/delete")
	public String delete(Member member, HttpSession session, RedirectAttributes rttr) {
		
		//세션에 있는 member를 가져와 mem변수에 넣어준다.
		Member mem = (Member) session.getAttribute("member");
		
//		//세션에 있는 비밀번호
//		String sessionPass = mem.getPassword();
//		
//		//member로 들어오는 비밀번호
//		String voPass = member.getPassword();
//		
//		if(!(sessionPass.equals(voPass))) {
//			rttr.addFlashAttribute("msg", false);
//			return "redirect:/member/memberDelete";
//		}
		
		memService.delete(member);
		session.invalidate();
		return "redirect:/";
	}
	
}
