package com.web.exam.service;

import com.web.exam.domain.Admin;
import com.web.exam.domain.Teacher;
import com.web.exam.repository.AdminRepository;
import com.web.exam.repository.TeacherRepository;
import com.web.exam.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
 * @ClassName : VipService
 * @Description :
 * @Author : lixin
 * @Date: 2020-08-25 22:49
 */
@Service
public class TeacherService extends BaseService<Teacher> {

    private TeacherRepository repository;

    @Autowired
    public TeacherService(TeacherRepository repository) {
        this.repository = repository;
        super.init(repository);
    }

    public Teacher login(LoginVO form) {
        return repository.findByAccountAndPassword(form.getAccount(), form.getPassword());
    }
}
