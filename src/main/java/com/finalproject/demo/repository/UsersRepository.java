package com.finalproject.demo.repository;



import com.finalproject.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UsersRepository extends JpaRepository<User, Long> {
    User findByUserName(String userName);
}
