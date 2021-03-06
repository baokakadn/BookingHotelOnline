package com.hotel.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.hotel.models.CustomUserDetail;
import com.hotel.models.Role;
import com.hotel.models.User;
import com.hotel.repositories.RoleRepository;
import com.hotel.repositories.UserRepository;

@Service
public class UserSecurityService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username);
		if (user != null && user.getStatus()) {
			List<Role> roleNames = roleRepository.findByListUsers_Username(username);

			List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
			if (!CollectionUtils.isEmpty(roleNames)) {
				for (Role role : roleNames) {
					GrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleName());
					grantList.add(authority);
				}
			}
			return new CustomUserDetail(user.getUsername(), user.getPassword(), grantList, user.getUserId(), user.getPicture(), user.getName());
		} else {
			throw new UsernameNotFoundException("Username is not found");
		}

	}
}
