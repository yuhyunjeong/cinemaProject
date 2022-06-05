package kosta.mvc.service;

import kosta.mvc.domain.Member;

public interface MemberService {
	
	/**
	 * 로그인 체크
	 * */
	Member loginCheck(String id, String password);
	
	/**
	 * 회원가입
	 * */
	void join(Member member);
	
	/**
	 * 아이디 중복 확인
	 * */
	String idCheck(String id);
	
	/**
	 * 아이디 찾기
	 * */
	
	/**
	 * 비밀번호 찾기
	 * */
	
	
	
	
	
	
	
}
