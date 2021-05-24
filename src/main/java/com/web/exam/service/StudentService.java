package com.web.exam.service;

import com.web.exam.domain.Student;
import com.web.exam.repository.StudentRepository;
import com.web.exam.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName : VipService
 * @Description :
 * @Author : lixin
 * @Date: 2020-08-25 22:49
 */
@Service
public class StudentService extends BaseService<Student> {

    private StudentRepository repository;

    @Autowired
    public StudentService(StudentRepository repository) {
        this.repository = repository;
        super.init(repository);
    }

    public Student login(LoginVO form) {
        return repository.findByAccountAndPassword(form.getAccount(), form.getPassword());
    }
}
