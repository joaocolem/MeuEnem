package com.joaocolem.meuenem.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.joaocolem.meuenem.backend.domain.Question;

import java.util.Optional;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {

    @Query("SELECT q FROM Question q " +
            "LEFT JOIN FETCH q.alternatives a " +
            "LEFT JOIN FETCH q.skill s " +
            "LEFT JOIN FETCH s.competence c " +
            "LEFT JOIN FETCH c.knowledgeArea ka " +
            "LEFT JOIN FETCH q.knowledgeArea kq " +
            "WHERE q.id = :id")
    Optional<Question> findByIdWithAllData(@Param("id") Long id);
}
