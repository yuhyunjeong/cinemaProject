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
	
	/**
	 * id로 조회
	 * */
	Member selectBy(String id);
	
	/**
	 * 회원정보 수정
	 * */
	Member update(Member member);
	
	/**
	 * 회원 탈퇴
	 * */
	void delete(String id, String password);
	
	
	
	
}
