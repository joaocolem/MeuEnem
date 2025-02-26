package com.joaocolem.meuenem.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.joaocolem.meuenem.backend.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}