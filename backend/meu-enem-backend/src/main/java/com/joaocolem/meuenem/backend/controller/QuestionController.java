package com.joaocolem.meuenem.backend.controller;

import com.joaocolem.meuenem.backend.dto.QuestionResponseDTO;
import com.joaocolem.meuenem.backend.services.QuestionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/questions")
@RequiredArgsConstructor
@Tag(name = "Questions", description = "Endpoints for question-related operations")
public class QuestionController {

    private final QuestionService questionService;

    @GetMapping("/{id}")
    @Operation(summary = "Get Question by ID", description = "Retrieve detailed information about a specific question, including alternatives, skill, competence, and knowledge area.")
    public ResponseEntity<QuestionResponseDTO> getQuestionById(@PathVariable Long id) {
        QuestionResponseDTO questionResponse = questionService.getQuestionById(id);
        return ResponseEntity.ok(questionResponse);
    }
}