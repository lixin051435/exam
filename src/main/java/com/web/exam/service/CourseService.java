package com.web.exam.service;

import com.web.exam.domain.Admin;
import com.web.exam.domain.Course;
import com.web.exam.repository.AdminRepository;
import com.web.exam.repository.CourseRepository;
import com.web.exam.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName : VipService
 * @Description :
 * @Author : lixin
 * @Date: 2020-08-25 22:49
 */
@Service
public class CourseService extends BaseService<Course> {

    private CourseRepository repository;

    @Autowired
    public CourseService(CourseRepository repository) {
        this.repository = repository;
        super.init(repository);
    }

    public List<Course> findAllASC(){
        return repository.findAll(Sort.by(Sort.Direction.ASC,"name"));
    }

}
