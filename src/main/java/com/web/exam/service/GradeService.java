package com.web.exam.service;

import com.web.exam.domain.Course;
import com.web.exam.domain.Grade;
import com.web.exam.domain.Student;
import com.web.exam.repository.CourseRepository;
import com.web.exam.repository.GradeRepository;
import com.web.exam.repository.StudentRepository;
import com.web.exam.vo.StudentGradeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName : VipService
 * @Description :
 * @Author : lixin
 * @Date: 2020-08-25 22:49
 */
@Service
@Transactional
public class GradeService extends BaseService<Grade> {

    private CourseRepository courseRepository;

    private GradeRepository repository;

    private StudentRepository studentRepository;

    private ApplyService applyService;

    @Autowired
    public GradeService(GradeRepository repository, StudentRepository studentRepository, CourseRepository courseRepository, ApplyService applyService) {
        this.repository = repository;
        this.courseRepository = courseRepository;
        this.applyService = applyService;
        this.studentRepository = studentRepository;
        super.init(repository);
    }

    public void deleteAllByStudentId(String studentId) {
        repository.deleteAllByStudentId(studentId);
    }

    public void deleteAllByCourseId(String courseId) {
        repository.deleteAllByCourseId(courseId);
    }

    public StudentGradeVO getStudentGradeVO(String studentId) {
        StudentGradeVO studentGradeVO = new StudentGradeVO();

        // 获取学生
        Student student = studentRepository.getOne(studentId);

        // 根据课程名称排序获取所有课程
        // List<Course> courses = courseRepository.findAll(Sort.by(Sort.Direction.ASC,"name"));

        // 获取这个学生所有的分数（课程列表和上述课程列表顺序一致）
        List<Grade> grades = repository.findAllByStudentIdOrderByCourseName(studentId);

        studentGradeVO.setStudent(student);
        studentGradeVO.setGrades(grades);

        int sum1 = 0;
        int sum2 = applyService.getGrade2ByStudentId(studentId);
        for (Grade g :
                grades) {
            if (g.getGrade() == null || g.getGrade().isEmpty()) {
                sum1 += 0;
            } else {
                sum1 += Integer.parseInt(g.getGrade());
            }
        }
        studentGradeVO.setGrade1(sum1);
        studentGradeVO.setGrade2(sum2);
        // 综合测评成绩 并保留两位小数
        double total = 0.7 * sum1 + 0.3 * sum2;
        BigDecimal bg = new BigDecimal(total);
        double sum = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        studentGradeVO.setTotal(sum);

        return studentGradeVO;
    }

    public List<StudentGradeVO> getAllStudentGradeVO() {

        List<StudentGradeVO> studentGradeVOS = new ArrayList<>();

        List<Student> students = studentRepository.findAll();

        StudentGradeVO studentGradeVO = null;

        for (Student s :
                students) {
            studentGradeVO = getStudentGradeVO(s.getId());
            studentGradeVOS.add(studentGradeVO);
        }

        return studentGradeVOS;
    }

}
