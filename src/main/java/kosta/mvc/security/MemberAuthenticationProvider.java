package kosta.mvc.security;

import java.util.Arrays;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Member;
import kosta.mvc.repository.MemberRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberAuthenticationProvider implements AuthenticationProvider{

	private final MemberRepository memRepo;
	private final PasswordEncoder pwdEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		System.out.println("MemberAuthenticationProvider 호출");
		
		String id = authentication.getName();
		Member member = memRepo.selectMemberById(id);
		
		String pwd = authentication.getCredentials().toString();
		
		if(member==null) {
			throw new UsernameNotFoundException("일치하는 사용자가 없습니다.");
		}else {
			boolean result = pwdEncoder.getBCryptPasswordEncoder().matches(pwd, member.getPassword());
			if(result==false) {
				throw new UsernameNotFoundException("비밀번호가 일치하지 않습니다.");
			}
			
			String role = member.getRole();
			
			SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role);
			 
			authentication = new UsernamePasswordAuthenticationToken(member, null, Arrays.asList(authority));
		}
		
		
		
		return authentication;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
	
}
