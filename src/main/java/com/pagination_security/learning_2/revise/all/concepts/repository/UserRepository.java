package com.pagination_security.learning_2.revise.all.concepts.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pagination_security.learning_2.revise.all.concepts.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	User getByEmail(String email);
}
