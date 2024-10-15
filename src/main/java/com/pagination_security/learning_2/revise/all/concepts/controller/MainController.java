package com.pagination_security.learning_2.revise.all.concepts.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pagination_security.learning_2.revise.all.concepts.exceptionHandling.UserAlreadyExistException;
import com.pagination_security.learning_2.revise.all.concepts.model.User;
import com.pagination_security.learning_2.revise.all.concepts.service.UserService;

import jakarta.validation.Valid;

@Controller
public class MainController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	@ResponseBody
	public String helloWorld() {
		return "Hello World";
	}

	@RequestMapping(value = "/users-list", method = RequestMethod.GET)
	public String getAllUsers(ModelMap model) {
		List<User> allUsers = userService.getAllUsers();
		model.put("dbUserList", allUsers);
		return "userList";
	}

	@RequestMapping(value = "/add-user", method = RequestMethod.GET)
	public String showAddUserPage(ModelMap model) {
		User newUser = new User("", "", "");
		model.put("user", newUser);
		return "addUser";
	}

	@RequestMapping(value = "/add-user", method = RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult binding, ModelMap model) {
		if (binding.hasErrors()) {
			model.put("errors", binding.getAllErrors());
			return "addUser";
		}
		try {
			userService.createUser(user);
		} catch (UserAlreadyExistException e) {
			model.put("userAlreadyExistError", e.getMessage());
			return "addUser";
		}
		return "redirect:users-list";
	}

//	@ExceptionHandler(UserAlreadyExistException.class)
//    public String handleUserAlreadyExistException(UserAlreadyExistException e, Model model) {
//        model.addAttribute("userAlreadyExistError", e.getMessage());
//        return "addUser";
//    }

}
