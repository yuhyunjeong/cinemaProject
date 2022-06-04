package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, String> {
	
	/**
	 * 로그인 체크
	 * */
	@Query("select m from Member m where id=?1 and password=?2")
	Member loginCheck(String id, String password);
	
	/**
	 * 아이디 중복 확인
	 * */
	@Query("select id from Member m where id=?1")
	String idCheck(String id);
}
