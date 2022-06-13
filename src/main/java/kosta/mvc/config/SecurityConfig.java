package kosta.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import kosta.mvc.security.MemberAuthenticationProvider;
import lombok.AllArgsConstructor;


@AllArgsConstructor
@Configuration
@EnableWebSecurity //WebSecurityConfigurerAdapter 
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	//@Autowired
	//private MemberAuthenticationFailureHandler failerHandler;
	
	//@Autowired
	private MemberAuthenticationProvider authenticationProvider;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()  //<security:intercept-url ���
		.anyRequest().permitAll()
		//.antMatchers("/user/login")
		//.hasAnyRole("USER","ADMIN")
		//.antMatchers("/member/**")
		//.authenticated()
		//.antMatchers("/manager/**")
		//.hasRole("ADMIN")
		.and()
		.csrf().disable()  //<security:csrf disabled="true"/> ���
		.formLogin()
		.loginPage("/member/loginForm")
		.loginProcessingUrl("/loginCheck")
		.usernameParameter("id")
		.passwordParameter("password")
		.defaultSuccessUrl("/")
		.failureForwardUrl("/member/loginForm?error")
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
	
	
   
}













