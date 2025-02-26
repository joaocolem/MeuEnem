package com.joaocolem.meuenem.backend;

import com.joaocolem.meuenem.backend.domain.Role;
import com.joaocolem.meuenem.backend.domain.User;
import com.joaocolem.meuenem.backend.repositories.RoleRepository;
import com.joaocolem.meuenem.backend.repositories.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Set;

@Component
public class DataInitializer implements CommandLineRunner {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public DataInitializer(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = new BCryptPasswordEncoder(); // Password encryption
    }

    @Override
    public void run(String... args) throws Exception {
        // Check if the ROLE_ADMIN role already exists before creating it
        Role adminRole = roleRepository.findByName("ROLE_ADMIN");
        if (adminRole == null) {
            adminRole = new Role();
            adminRole.setName("ROLE_ADMIN");
            roleRepository.save(adminRole);
        }

        // Check if the ROLE_USER role already exists before creating it
        Role userRole = roleRepository.findByName("ROLE_USER");
        if (userRole == null) {
            userRole = new Role();
            userRole.setName("ROLE_USER");
            roleRepository.save(userRole);
        }

        // Check if the admin user already exists before creating it
        if (userRepository.findByEmail("admin@example.com").isEmpty()) {
            User admin = new User();
            admin.setName("Admin");
            admin.setEmail("admin@example.com");
            admin.setPassword(passwordEncoder.encode("admin123")); // Encrypt the password
            admin.setRoles(Set.of(adminRole, userRole)); // Assign roles to the admin
            userRepository.save(admin);
        }

        // Check if the regular user already exists before creating it
        if (userRepository.findByEmail("user@example.com").isEmpty()) {
            User user = new User();
            user.setName("User");
            user.setEmail("user@example.com");
            user.setPassword(passwordEncoder.encode("user123")); // Encrypt the password
            user.setRoles(Set.of(userRole)); // Assign the ROLE_USER to the user
            userRepository.save(user);
        }
    }
}