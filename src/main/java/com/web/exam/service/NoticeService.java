package com.web.exam.service;

import com.web.exam.domain.Admin;
import com.web.exam.domain.Notice;
import com.web.exam.repository.AdminRepository;
import com.web.exam.repository.NoticeRepository;
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
public class NoticeService extends BaseService<Notice> {

    private NoticeRepository repository;

    @Autowired
    public NoticeService(NoticeRepository repository) {
        this.repository = repository;
        super.init(repository);
    }

}
