package kosta.mvc.service;


import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Member;
import kosta.mvc.repository.MemberRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository memberRepo;
	
	@Override
	public Member loginCheck(String id, String password) {
		
		
		  return memberRepo.loginCheck(id, password);
	    
	}

	
	@Override
	public void join(Member member) {
		idCheck(member);
		memberRepo.save(member);
	
	}
	
	private void idCheck(Member member) {
		Optional<Member> findMembers = 
				memberRepo.findById(member.getId());
		
		if(!findMembers.isEmpty()) {
			throw new IllegalStateException("이미 존재하는 회원입니다.");
		}

	}

	

}
