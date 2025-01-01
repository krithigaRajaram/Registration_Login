package com.registration.model;

public class User {
	private static String name;
	private static String email;
	private static String password;
	private static String contact;
	private static String address;
	private static String city;
	private static String state;
	private static String country;
	
	public static String getName() {
		return name;
	}
	public void setName(String name) {
		User.name = name;
	}
	public static String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		User.email = email;
	}
	public static String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		User.password = password;
	}
	public static String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		User.contact = contact;
	}
	public static String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		User.address = address;
	}
	public static String getCity() {
		return city;
	}
	public void setCity(String city) {
		User.city = city;
	}
	public static String getState() {
		return state;
	}
	public void setState(String state) {
		User.state = state;
	}
	public static String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		User.country = country;
	}

	

}
