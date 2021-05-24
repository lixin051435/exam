package com.web.exam.repository;
import com.web.exam.domain.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admin,String> {

    Admin findByAccountAndPassword(String account,String password);
}
