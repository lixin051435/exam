package com.web.exam.repository;
import com.web.exam.domain.Admin;
import com.web.exam.domain.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeacherRepository extends JpaRepository<Teacher,String> {

    Teacher findByAccountAndPassword(String account,String password);
}
