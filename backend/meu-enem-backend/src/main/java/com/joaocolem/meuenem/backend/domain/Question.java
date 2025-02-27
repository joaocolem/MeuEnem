package com.joaocolem.meuenem.backend.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Set;

@Entity
@Table(name = "questoes")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "co_item", nullable = false, unique = true)
    private Long coItem;

    @Column(name = "title")
    private String title;

    @Column(name = "index")
    private Integer index;

    @Column(name = "year")
    private Integer year;

    @Column(name = "context", columnDefinition = "TEXT")
    private String context;

    @Column(name = "correct_alternative", length = 1)
    private Character correctAlternative;

    @Column(name = "alternatives_intro", columnDefinition = "TEXT")
    private String alternativesIntro;

    @Column(name = "nu_param_a")
    private Float nuParamA;

    @Column(name = "nu_param_b")
    private Float nuParamB;

    @Column(name = "nu_param_c")
    private Float nuParamC;

    @Column(name = "co_prova")
    private Integer coProva;

    @Column(name = "tp_lingua", nullable = true)
    private Short tpLingua;

    @ManyToOne
    @JoinColumn(name = "habilidade_id")
    private Skill skill;

    @ManyToOne
    @JoinColumn(name = "area_conhecimento_id")
    private KnowledgeArea knowledgeArea;

    @Column(name = "file")
    private String file;

    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Alternative> alternatives;
}