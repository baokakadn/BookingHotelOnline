package com.hotel.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
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
@Order(Ordered.HIGHEST_PRECEDENCE)
public class AdminSecurityConfig extends WebSecurityConfigurerAdapter {

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
		auth.userDetailsService(empService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// Cấu hình security/form login cho url /admin/**
		// Cấu hình cho Login Form.
		http.cors().and().csrf().disable();
		http.authorizeRequests().antMatchers("/admin", "/admin/login", "/admin/logout, /**").permitAll();
		http.antMatcher("/admin/**")
		.authorizeRequests()
		.antMatchers("/admin/user", "/admin/booking", "/admin/guest", "/admin/dashboard", "/admin/booking-report", "/admin/revenue-report").access("hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF')")
		.antMatchers("/admin/staff/**", "/admin/room-type/**", "/admin/rooms/**", "/admin/service/**", "/admin/staff/**", "/admin/promotion/**", "/admin/creditcard/**").access("hasRole('ROLE_ADMIN')")
		.and()
		.formLogin().loginPage("/admin")
		.loginProcessingUrl("/admin/process-login")
		.defaultSuccessUrl("/admin/dashboard")
		.failureUrl("/admin/login?message=error")
		.usernameParameter("username").passwordParameter("password")
		.and()
		.logout().logoutUrl("/admin/process-logout")
		.logoutSuccessUrl("/admin/login?message=logout")
		.deleteCookies("JSESSIONID")
		.invalidateHttpSession(true)
		.and()
		.exceptionHandling().accessDeniedPage("/403");
		http.sessionManagement()
		.maximumSessions(1)
		.expiredUrl("/admin/login?message=expired")
		.and()
		.invalidSessionUrl("/admin/login");
	}
}