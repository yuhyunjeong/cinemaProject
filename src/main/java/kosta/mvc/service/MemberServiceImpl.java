package kosta.mvc.service;


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
	public void idCheck(String id) {
		// TODO Auto-generated method stub

	}

}
