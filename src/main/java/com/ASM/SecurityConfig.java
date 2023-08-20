package com.ASM;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Bean
	public BCryptPasswordEncoder getBCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Autowired
	UserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
		
//		BCryptPasswordEncoder pe = getBCryptPasswordEncoder();
//		auth.inMemoryAuthentication()
//			.withUser("user1").password(pe.encode("pas1")).roles("USER").and()
//			.withUser("user2").password(pe.encode("pas2")).roles("SUPER").and()
//			.withUser("user3").password(pe.encode("pas3")).roles("ADMIN", "SUPER");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		
		
//		http.authorizeRequests()
//			.antMatchers("/order/**").authenticated()
//			.antMatchers("/ctrl/url2").hasRole("USER")
//			.antMatchers("/ctrl/url3").hasRole("ADMIN")
//			.antMatchers("/ctrl/url4").hasAnyRole("ADMIN", "SUPER")
//			.anyRequest().permitAll();
//		
		http.authorizeRequests()
		.antMatchers("/account/change-password",
				"/account/edit-profile",
				"/order/**",
				"/security/logout",
				"/index.html/**").authenticated()
		.antMatchers("/admin/**").hasAnyRole("STAF", "DIRE")
		.anyRequest().permitAll();
		
		http.exceptionHandling()
			.accessDeniedPage("/security/access/denied");
		
		//http.httpBasic();
		
		http.formLogin()
			.loginPage("/security/login/form")
			.loginProcessingUrl("/security/login")
			.defaultSuccessUrl("/security/login/success")
			.failureUrl("/security/login/failure");
		
		http.logout()
			.logoutUrl("/security/logout")
			.logoutSuccessUrl("/security/logout/success")
			.addLogoutHandler(new SecurityContextLogoutHandler())
			.clearAuthentication(true);
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/rsx/**", "/api/**");
	}
	
	
}
