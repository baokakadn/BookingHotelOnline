/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotel.ults;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author ldanh
 */
public class EncrytedPasswordUtils {

	public static String encrytePassword(String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
		return encoder.encode(password);
	}

	public static void main(String[] args) {

		String password = "123456";
		String encrytedPassword = encrytePassword(password);
		System.out.println("Encryted Password: " + encrytedPassword);


		/*
		 * int adult = 3; int children = 5; int a = (int)Math.ceil(adult / 2); int b =
		 * (int)Math.ceil((double)children / 2); if (a > b || b == 0) {
		 * System.out.println(a); } else { System.out.println(b); }
		 * 
		 * String[] city = {"texas", "ny", "sydney", "ny", "paris", "texas", "ny"};
		 * List<String> asList = Arrays.asList(city); Map<String, Integer> map= new
		 * HashMap<String, Integer>(); for(String s: city){
		 * map.put(s,Collections.frequency(asList,s)); } System.out.println(map);
		 */
	}
}
