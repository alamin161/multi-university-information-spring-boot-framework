package com.finalproject.demo.service;




import com.finalproject.demo.model.Role;
import com.finalproject.demo.model.User;

import java.util.List;

public interface RoleService {

    public void addRole(Role role);
    public void updateRole(Role role);
    public Role getRole(Long id);
    public List<Role> getRoleByUser(User user);
}
