package kosta.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.mvc.domain.Member;
import kosta.mvc.service.MemberService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MyPageController {
	
	private final MemberService memService;
	private final BCryptPasswordEncoder getBCEncoder;
	
	@RequestMapping("/myPage/{id}")
	public ModelAndView myPage(@PathVariable String id) {

		Member mem = memService.selectBy(id);
		return new ModelAndView("myPage/myPageOrders","member", mem);
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
		return new ModelAndView("myPage/updateForm","member", mem);
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
		return new ModelAndView("myPage/memberDelete","member", mem);
	}
	
	@RequestMapping("/delete")
	public String delete(@AuthenticationPrincipal Member sessionMember, HttpSession session, Member member, RedirectAttributes rttr) {
		
		//System.out.println(pwd);
		String sessionPass = sessionMember.getPassword();
		System.out.println(sessionPass);
		
		//세션에 있는 member를 가져와 mem변수에 넣어준다.
		//Member mem = (Member) session.getAttribute("member");
		//Member mem = new Member();
		//mem = (Member) session.getAttribute("member");
		//세션에 있는 비밀번호
		//String sessionPass = mem.getPassword();
		
		//member로 들어오는 비밀번호
		String voPass = member.getPassword();
		System.out.println(voPass);
		
		boolean dePassword = getBCEncoder.matches(voPass, sessionPass);
		
		if(dePassword==false) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/myPage/memberDelete/"+member.getId();
		}
		
//		if(!(pwd.equals(voPass))) {
//			rttr.addFlashAttribute("msg", false);
//			return "redirect:/member/memberDelete";
//		}
		
		
		
		memService.delete(member);
		session.invalidate();
		System.out.println("세션"+sessionPass);
		System.out.println("member"+voPass);
		return "redirect:/";
	}
}
