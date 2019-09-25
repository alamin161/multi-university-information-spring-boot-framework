package com.finalproject.demo.repository;



import com.finalproject.demo.model.Role;
import com.finalproject.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleRepository  extends JpaRepository<Role, Long> {

    List<Role> findRolesByUserList(User user);
}
