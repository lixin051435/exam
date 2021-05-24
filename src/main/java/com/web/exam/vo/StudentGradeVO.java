package com.web.exam.vo;

import com.web.exam.domain.Grade;
import com.web.exam.domain.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentGradeVO {

    private Student student;
    private List<Grade> grades = new ArrayList<>();
    // 第一课堂总成绩
    private Integer grade1;
    // 第二课堂总成绩
    private Integer grade2;
    // 综合测评成绩
    private Double total;

    public Integer getGrade1() {
        return grade1;
    }

    public void setGrade1(Integer grade1) {
        this.grade1 = grade1;
    }

    public Integer getGrade2() {
        return grade2;
    }

    public void setGrade2(Integer grade2) {
        this.grade2 = grade2;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public List<Grade> getGrades() {
        return grades;
    }

    public void setGrades(List<Grade> grades) {
        this.grades = grades;
    }
}
