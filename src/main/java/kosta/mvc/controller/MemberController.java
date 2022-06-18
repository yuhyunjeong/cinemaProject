package kosta.mvc.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.Screen;
import kosta.mvc.domain.Time;
import kosta.mvc.service.MemberService;
import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memService;
	private final BCryptPasswordEncoder getBCEncoder;
	
	@RequestMapping("/loginForm")
	public String login(@RequestParam(value = "error" , required = false)String error,
						//@RequestParam(value = "exception", required = false)String exception,
						Model model) {
		model.addAttribute("error",error);
		//model.addAttribute("exception",exception);
		return "member/loginForm";
		
	}
	
	
//	
//	@RequestMapping("login")
//	public String loginCheck(String id, String password, HttpSession session) {
//		
//		System.out.println(id + password);
//		Member member = memService.loginCheck(id, password);
//		System.out.println(member);
//		if(member != null) {
//			session.setAttribute("member", member);
//		}
//		
//		
//		return "redirect:/";
//	}
//	
//	@RequestMapping("logout")
//	public String logout(Member member , HttpSession session) {
//		session.removeAttribute("member");
//		return "redirect:/";
//	}
	
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
	
	@ResponseBody
	@RequestMapping("/payment")
	public ModelAndView payment(
//			 @RequestParam("timeDate") @DateTimeFormat(iso =ISO.DATE_TIME) Date timeDate,
//			 @RequestParam("timeStart") @DateTimeFormat(iso =ISO.DATE_TIME) Date timeStart,
			 @RequestParam("peopleNum") String peopleNum,
			 @RequestParam("timeDate") String timeDate,
			 @RequestParam("timeStart") String timeStart,
			 @RequestParam("movieName") String movieName,
			 @RequestParam("screenName") String screenName
			 ) {
//		Model model,  Time time, @RequestParam("mCode") String mCode ,  @RequestParam("tdate") @DateTimeFormat(iso =ISO.DATE_TIME) Date tdate,  
//		@RequestParam("tStart") @DateTimeFormat(iso =ISO.DATE_TIME) Date tStart, @RequestParam("sCode") Screen sCode
		
//		document.f.timeDate.value= temp[0];
//		document.f.timeStart.value= temp[1];
//		document.f.movieName.value= temp[2];
//		document.f.screenName.value= temp[3];
		
		System.out.println("peopleNum : " + peopleNum);
		System.out.println("timeDate : " + timeDate);
		System.out.println("timeStart : " + timeStart);
		System.out.println("movieName : " + movieName);
		System.out.println("screenName : " + screenName);
		
		ModelAndView mv = new ModelAndView("member/payment");
		mv.addObject("peopleNum", peopleNum);
		mv.addObject("timeDate", timeDate);
		mv.addObject("timeStart", timeStart);
		mv.addObject("movieName", movieName);
		mv.addObject("screenName", screenName);

		return mv;

		
	}
	
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
			return "redirect:/member/memberDelete/"+member.getId();
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
