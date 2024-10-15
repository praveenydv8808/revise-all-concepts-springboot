package com.pagination_security.learning_2.revise.all.concepts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pagination_security.learning_2.revise.all.concepts.exceptionHandling.UserAlreadyExistException;
import com.pagination_security.learning_2.revise.all.concepts.model.User;
import com.pagination_security.learning_2.revise.all.concepts.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository userRepo;

	public List<User> getAllUsers() {
		return userRepo.findAll();
	}

	public void createUser(User user) {
		if (userRepo.getByEmail(user.getEmail()) != null) {
			throw new UserAlreadyExistException("User already exist with email:-" + user.getEmail());
		} else {
			userRepo.save(user);
		}

	}

}
