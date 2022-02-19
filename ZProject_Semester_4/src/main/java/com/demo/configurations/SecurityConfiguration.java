package com.demo.configurations;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.demo.services.AccountService;
import com.demo.services.user.CustomOAuth2UserService;
import com.demo.services.user.OAuth2LoginSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	private CustomOAuth2UserService auth2ServiceUser;
	@Autowired
	private OAuth2LoginSuccessHandler auth2LoginSuccessHandler;
	@Autowired
	private AccountService accountService;
	

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.cors().and().csrf().disable();

		http.authorizeRequests().antMatchers("login/oauth2/**").permitAll()
		.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/faculty/**").access("hasRole('ROLE_USER_FACULTY')")
//		.antMatchers("/user/contact/**")
//				.access("hasRole('ROLE_USER_FACULTY') or hasRole('ROLE_USER_CANDIDATE')")
		.antMatchers("/user/paypal/**")
				.access("hasRole('ROLE_USER_FACULTY') or hasRole('ROLE_USER_CANDIDATE')").and().formLogin()
				.loginPage("/user/home").loginProcessingUrl("/user/account/process-login")
				.defaultSuccessUrl("/user/account/welcome").failureUrl("/user/account/login?error")
				.usernameParameter("username").passwordParameter("password").and().oauth2Login()
				.loginPage("/user/account/login").userInfoEndpoint().userService(auth2ServiceUser)
				.and().successHandler(auth2LoginSuccessHandler)
				.and()
				.logout()
				.logoutUrl("/user/account/logout").logoutSuccessUrl("/").and()

				.exceptionHandling().accessDeniedPage("/user/account/accessDenied");
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(accountService);
	}

	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	
}