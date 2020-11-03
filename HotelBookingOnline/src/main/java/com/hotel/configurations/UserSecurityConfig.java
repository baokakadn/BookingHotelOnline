package com.hotel.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.hotel.services.EmployeeSecurityService;
import com.hotel.services.UserSecurityService;
@Configuration
@EnableWebSecurity
@Order(1)
public class UserSecurityConfig extends WebSecurityConfigurerAdapter {


	@Autowired
	EmployeeSecurityService empService;

	@Autowired
	UserSecurityService userSecurityService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(10);
		return bCryptPasswordEncoder;
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userSecurityService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// Cấu hình cho Login Form.
		http.cors().and().csrf().disable();
		http.antMatcher("/**")
		.authorizeRequests()
		.antMatchers("/user/**").access("hasRole('ROLE_USER')")
		.and()
		.formLogin().loginPage("/#Login_tab")
		.loginProcessingUrl("/**/process-login")
		.defaultSuccessUrl("/")
		.failureUrl("/?msg=error#Login_tab")
		.usernameParameter("email").passwordParameter("password")
		.and()
		.logout().logoutUrl("/**/process-logout")
		.logoutSuccessUrl("/")
		.deleteCookies("JSESSIONID")
		.invalidateHttpSession(true)
		.and()
		.exceptionHandling().accessDeniedPage("/accessDenied");
	}
}
