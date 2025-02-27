package com.joaocolem.meuenem.backend.dto;

import java.util.List;

public record QuestionResponseDTO(
        Long id,
        Long coItem,
        String title,
        Integer index,
        Integer year,
        String context,
        Character correctAlternative,
        String alternativesIntro,
        Float nuParamA,
        Float nuParamB,
        Float nuParamC,
        Integer coProva,
        Short tpLingua,
        String file,
        SkillDTO skill,
        KnowledgeAreaDTO knowledgeArea,
        List<AlternativeDTO> alternatives) {
    public record AlternativeDTO(Long id, Character letra, String texto, String file, Boolean isCorrect) {
    }

    public record SkillDTO(Long id, Integer habilidade, String descricao, CompetenceDTO competence) {
    }

    public record CompetenceDTO(Long id, Integer competenceOfArea, String descricao, KnowledgeAreaDTO knowledgeArea) {
    }

    public record KnowledgeAreaDTO(Long id, String nome, String abreviacao) {
    }
}
