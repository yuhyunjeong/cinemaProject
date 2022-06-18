package kosta.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.access.vote.RoleHierarchyVoter;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import kosta.mvc.security.MemberAuthenticationFailureHandler;
import kosta.mvc.security.MemberAuthenticationProvider;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;


@AllArgsConstructor
@Configuration
@EnableWebSecurity //WebSecurityConfigurerAdapter 
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private MemberAuthenticationFailureHandler failerHandler;
	
	@Autowired
	private MemberAuthenticationProvider authenticationProvider;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()  //<security:intercept-url ���
		//.antMatchers("/manager/**").hasRole("ADMIN") // DB에 권한 넣을땐 ROLE_USER or ROLE_ADMIN
		//.antMatchers("/member/myPage/**").authenticated()
		
		.anyRequest().permitAll()
		.and()
		
		.csrf().disable()  //<security:csrf disabled="true"/> ���
		.formLogin()
		.loginPage("/member/loginForm")
		.loginProcessingUrl("/loginCheck")
		.usernameParameter("id")
		.passwordParameter("password")
		
		.defaultSuccessUrl("/")
		.failureHandler(failerHandler)
		//.failureForwardUrl("/member/loginForm?error")
		
		.and()
		.logout()
		.logoutUrl("/logout")
		.logoutSuccessUrl("/")
		.invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		.and();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider);
		
		//inMemory를 등록
        //auth.inMemoryAuthentication()
        //.withUser("jang").password("{noop}1234").authorities("ROLE_USER")
		//.and()
		//.withUser("kim").password("{noop}1234").authorities("ROLE_MANAGER")
		//.and()
		//.withUser("admin").password("{noop}1234").authorities("ROLE_USER" , "ROLE_ADMIN");
		
	}
	
	@Bean
	public RoleHierarchy roleHierarchy() {
		RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
		roleHierarchy.setHierarchy("ROLE_ADMIN > ROLE_USER");
		return roleHierarchy;
	}
	
	@Bean
	public RoleHierarchyVoter roleHierarchyVoter() {
		return new RoleHierarchyVoter(roleHierarchy());
	}
	
   
}













