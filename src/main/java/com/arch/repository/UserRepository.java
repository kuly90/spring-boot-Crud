package com.arch.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.arch.model.User;

public interface UserRepository extends CrudRepository<User, String> {

	User findByUserId(String userId);
	
	@Query(value = "select * from user\n"
			+ " where USER_ID like %?1% OR NAME like %?1% " , nativeQuery = true)
    List<User> listSearch(String search);
}
