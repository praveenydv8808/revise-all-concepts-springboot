package com.pagination_security.learning_2.revise.all.concepts.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
public class User {
	@Id
	@GeneratedValue
	private int id;
	@NotNull
	@Size(min = 3,max = 20)
	private String name;
	@NotNull
	private String email;
	@NotNull
	private String mobile;

	public User() {

	}

	public User(String name, String email, String mobile) {
		this.name = name;
		this.email = email;
		this.mobile = mobile;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}
