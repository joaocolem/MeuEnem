package com.joaocolem.meuenem.backend.exceptions;

public class QuestionNotFoundException extends RuntimeException {
    public QuestionNotFoundException(String message) {
        super(message);
    }

    public QuestionNotFoundException() {
        super("Question not found");
    }

}
