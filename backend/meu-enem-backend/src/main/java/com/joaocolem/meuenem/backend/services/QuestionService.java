package com.joaocolem.meuenem.backend.services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joaocolem.meuenem.backend.domain.Question;
import com.joaocolem.meuenem.backend.dto.QuestionResponseDTO;
import com.joaocolem.meuenem.backend.exceptions.QuestionNotFoundException;
import com.joaocolem.meuenem.backend.repositories.QuestionRepository;

@Service
public class QuestionService {
    private final QuestionRepository questionRepository;

    public QuestionService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    @Transactional(readOnly = true)
    public QuestionResponseDTO getQuestionById(Long id) {
        Question question = questionRepository.findByIdWithAllData(id)
                .orElseThrow(() -> new QuestionNotFoundException());

        return new QuestionResponseDTO(
                question.getId(),
                question.getCoItem(),
                question.getTitle(),
                question.getIndex(),
                question.getYear(),
                question.getContext(),
                question.getCorrectAlternative(),
                question.getAlternativesIntro(),
                question.getNuParamA(),
                question.getNuParamB(),
                question.getNuParamC(),
                question.getCoProva(),
                question.getTpLingua(),
                question.getFile(),
                question.getSkill() != null ? new QuestionResponseDTO.SkillDTO(
                        question.getSkill().getId(),
                        question.getSkill().getHabilidade(),
                        question.getSkill().getDescricao(),
                        question.getSkill().getCompetence() != null ? new QuestionResponseDTO.CompetenceDTO(
                                question.getSkill().getCompetence().getId(),
                                question.getSkill().getCompetence().getCompetenceOfArea(),
                                question.getSkill().getCompetence().getDescricao(),
                                question.getSkill().getCompetence().getKnowledgeArea() != null
                                        ? new QuestionResponseDTO.KnowledgeAreaDTO(
                                                question.getSkill().getCompetence().getKnowledgeArea().getId(),
                                                question.getSkill().getCompetence().getKnowledgeArea().getNome(),
                                                question.getSkill().getCompetence().getKnowledgeArea().getAbreviacao())
                                        : null)
                                : null)
                        : null,
                question.getKnowledgeArea() != null ? new QuestionResponseDTO.KnowledgeAreaDTO(
                        question.getKnowledgeArea().getId(),
                        question.getKnowledgeArea().getNome(),
                        question.getKnowledgeArea().getAbreviacao()) : null,
                question.getAlternatives().stream()
                        .map(alt -> new QuestionResponseDTO.AlternativeDTO(
                                alt.getId(),
                                alt.getLetra(),
                                alt.getTexto(),
                                alt.getFile(),
                                alt.getIsCorrect()))
                        .toList());
    }
}
