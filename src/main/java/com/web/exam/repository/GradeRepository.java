package com.web.exam.repository;
import com.web.exam.domain.Grade;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GradeRepository extends JpaRepository<Grade,String> {

    List<Grade> findAllByStudentIdOrderByCourseName(String studentId);

    void deleteAllByCourseId(String courseId);

    void deleteAllByStudentId(String studentId);

}
