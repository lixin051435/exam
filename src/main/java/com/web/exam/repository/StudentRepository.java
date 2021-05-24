package com.web.exam.repository;
import com.web.exam.domain.Student;
import com.web.exam.domain.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student,String> {

    Student findByAccountAndPassword(String account,String password);
}
