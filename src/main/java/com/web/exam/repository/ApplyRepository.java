package com.web.exam.repository;
import com.web.exam.domain.Apply;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ApplyRepository extends JpaRepository<Apply,String> {

    List<Apply> findAllByStudentIdAndStatus(String studentId,Integer status);

    List<Apply> findAllByStudentId(String studentId);

}
