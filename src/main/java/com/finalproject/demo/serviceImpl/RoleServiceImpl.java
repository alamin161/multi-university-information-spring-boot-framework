package com.finalproject.demo.serviceImpl;



import com.finalproject.demo.model.Role;
import com.finalproject.demo.model.User;
import com.finalproject.demo.repository.RoleRepository;
import com.finalproject.demo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public void addRole(Role role) {
        roleRepository.save(role);
    }

    @Override
    public void updateRole(Role role) {
        roleRepository.save(role);
    }

    @Override
    public Role getRole(Long id) {
        return roleRepository.getOne(id);
    }

    @Override
    public List<Role> getRoleByUser(User user) {
        return roleRepository.findRolesByUserList(user);
    }
}
