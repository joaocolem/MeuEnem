package com.joaocolem.meuenem.backend.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "alternativas")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Alternative {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "questao_id", nullable = false)
    private Question question;

    @Column(nullable = false, length = 1)
    private Character letra;

    @Column(columnDefinition = "TEXT")
    private String texto;

    private String file;

    @Column(nullable = false)
    private Boolean isCorrect;
}