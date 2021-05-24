package com.web.exam.controller;

import com.web.exam.service.BaseService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.Serializable;

/**
 * @ClassName : BaseController
 * @Description :
 * @Author : lixin
 * @Date: 2020-08-25 22:41
 */
public class BaseController<E> {


    private BaseService<E> service;

    public E findById(Serializable id){
        return service.findById(id);
    }

    public Page<E> findByPage(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10")int size){
        return service.findByPage(page,size);
    }

    public void init(BaseService service){
        this.service = service;
    }

    public void insert(E e){
        service.insert(e);
    }

    public void remove(Serializable id){
        service.remove(id);
    }

    public void update(E e){
        service.update(e);
    }
}
