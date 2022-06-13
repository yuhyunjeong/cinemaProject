package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, String>, QuerydslPredicateExecutor<Member> {
	
	/**
	 * 로그인 체크
	 * */
	@Query("select m from Member m where m.id=?1 and m.password=?2")
	Member loginCheck(String id, String password);
	
	/**
	 * 아이디 중복 확인
	 * */
	@Query("select m.id from Member m where m.id=?1")
	String idCheck(String id);
	
	@Query("select m from Member m where m.id=?1")
	Member selectMemberById(String id);
}
