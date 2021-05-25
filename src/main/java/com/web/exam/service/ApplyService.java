package com.web.exam.service;

import com.web.exam.domain.Admin;
import com.web.exam.domain.Apply;
import com.web.exam.enums.ApplyStatusEnum;
import com.web.exam.repository.AdminRepository;
import com.web.exam.repository.ApplyRepository;
import com.web.exam.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName : VipService
 * @Description :
 * @Author : lixin
 * @Date: 2020-08-25 22:49
 */
@Service
public class ApplyService extends BaseService<Apply> {

    private ApplyRepository repository;

    @Autowired
    public ApplyService(ApplyRepository repository) {
        this.repository = repository;
        super.init(repository);
    }

    // 根据学生id求第二课堂分数
    public Integer getGrade2ByStudentId(String studentId) {
        List<Apply> applies = repository.findAllByStudentIdAndStatus(studentId, ApplyStatusEnum.APPROVED.getCode());
        int sum = 0;
        for (Apply a :
                applies) {
            sum += a.getGrade();
        }
        return sum;
    }

    public List<Apply> findAllByStudentId(String studentId){
        return repository.findAllByStudentId(studentId);
    }

}
