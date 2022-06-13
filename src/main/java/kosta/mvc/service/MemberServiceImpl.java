package kosta.mvc.service;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Member;
//import kosta.mvc.domain.QMember;
import kosta.mvc.repository.MemberRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository memberRepo;
	private final BCryptPasswordEncoder getBCEncoder;
	
	@Override
	public Member loginCheck(String id, String password) {
		
		Member mem = memberRepo.loginCheck(id, password);
		System.out.println(mem);
		  return mem;
	    
	}

	
	@Override
	public void join(Member member) {
		/**
		 * 비밀번호 암호화
		 * */
		  String rawPassword = member.getPassword(); //들어온 비밀번호
	      String encPassword = getBCEncoder.encode(rawPassword); 
	      member.setPassword(encPassword);
	      
	      member.setPoint(3000);
	      
	      Member mem = memberRepo.save(member);
	      if(mem==null) {
	         new RuntimeException("회원가입에 실패했습니다.");
	      }
		
	
	}
	
//	private void idCheck(Member member) {
//		Optional<Member> findMembers = 
//				memberRepo.findById(member.getId());
//		
//		if(!findMembers.isEmpty()) {
//			throw new IllegalStateException("이미 존재하는 회원입니다.");
//		}
//
//	}


	@Override
	public String idCheck(String id) {
		//QMember member = QMember.member;
		//BooleanBuilder builder = new BooleanBuilder();
		//조건을 만들고고
		//builder.and(member.id.equalsIgnoreCase(id));
		
		///그조건을 원하는 메소드에 적용하자
		//Optional<Member> result= memberRepo.findOne(builder);
		//String id2 = result.get().getId();
		
		String result = memberRepo.idCheck(id);
		return result;
	}


	@Override
	public Member selectBy(String id) {
		
		Member member = memberRepo.findById(id).orElse(null);
		
		return member;
	}
	
	
	@Override
	public Member update(Member member) {
		Member mem = memberRepo.findById(member.getId()).orElse(null);
		

		mem.setPassword(getBCEncoder.encode(member.getPassword()));
		mem.setName(member.getName());
		mem.setPhone(member.getPhone());
		
		
		return mem;
	}


	@Override
	public void delete(Member member) {
		
		
		memberRepo.deleteById(member.getId());
	}


	@Override
	public List<Member> selectAll() {
		return memberRepo.findAll();
	}


	

	

}
