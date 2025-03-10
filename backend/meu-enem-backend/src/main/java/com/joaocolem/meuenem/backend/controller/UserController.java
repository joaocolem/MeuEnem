package com.joaocolem.meuenem.backend.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
@Tag(name = "User", description = "Endpoints for user-related operations")
public class UserController {

    @GetMapping
    @Operation(summary = "Get User", description = "Retrieve user information.")
    public ResponseEntity<String> getUser() {
        return ResponseEntity.ok("sucesso!");
    }
}