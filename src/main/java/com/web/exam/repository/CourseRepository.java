package com.web.exam.repository;
import com.web.exam.domain.Admin;
import com.web.exam.domain.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CourseRepository extends JpaRepository<Course,String> {

}
