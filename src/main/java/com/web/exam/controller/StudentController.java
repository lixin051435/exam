package com.web.exam.controller;

import com.web.exam.domain.Course;
import com.web.exam.domain.Grade;
import com.web.exam.domain.Student;
import com.web.exam.service.CourseService;
import com.web.exam.service.GradeService;
import com.web.exam.service.StudentService;
import com.web.exam.util.KeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/student")
@Controller
public class StudentController extends BaseController<Student> {

    private StudentService studentService;

    private GradeService gradeService;

    private CourseService courseService;

    @Autowired
    public StudentController(StudentService studentService,GradeService gradeService,CourseService courseService) {
        this.studentService = studentService;
        this.gradeService = gradeService;
        this.courseService = courseService;
        super.init(studentService);
    }

    @GetMapping("/getById")
    public String toEdit(String id,Model model){
        Student student = findById(id);
        model.addAttribute("student",student);
        return "student_edit";
    }

    @GetMapping("/toList")
    public String toList(Model model){
        List<Student> students = studentService.findAll();
        model.addAttribute("students",students);
        return "student_list";
    }

    @GetMapping("/toAdd")
    public String toAdd(){
        return "redirect:/admin/student_add.jsp";
    }

    @RequestMapping("/add")
    public String add(Student student) {
        student.setId(KeyUtils.genItemId());
        // 添加学生
        insert(student);

        // 加入到成绩表中
        List<Course> courses = courseService.findAll();

        Grade grade = new Grade();
        for (Course c :
                courses) {
            grade.setStudentId(student.getId());
            grade.setStudentName(student.getName());
            grade.setCourseId(c.getId());
            grade.setCourseName(c.getName());
            grade.setId(KeyUtils.genItemId());
            gradeService.insert(grade);
        }

        return "redirect:toList";
    }

    @RequestMapping("/edit")
    public String edit(Student student) {
        update(student);
        return "redirect:toList";
    }

    @RequestMapping("/delete")
    public String delete(String id) {

        // 删除成绩
        gradeService.deleteAllByStudentId(id);

        // 删除这个学生
        remove(id);
        return "redirect:toList";
    }

}
