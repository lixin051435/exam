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

@RequestMapping("/course")
@Controller
public class CourseController extends BaseController<Course> {

    private CourseService courseService;

    private StudentService studentService;

    private GradeService gradeService;

    @Autowired
    public CourseController(CourseService courseService, StudentService studentService, GradeService gradeService) {
        this.courseService = courseService;
        this.studentService = studentService;
        this.gradeService = gradeService;
        super.init(courseService);
    }

    @GetMapping("/getById")
    public String toEdit(String id, Model model) {
        Course course = findById(id);
        model.addAttribute("course", course);
        return "course_edit";
    }

    @GetMapping("/toList")
    public String toList(Model model) {
        List<Course> courses = courseService.findAll();
        model.addAttribute("courses", courses);
        return "course_list";
    }

    @GetMapping("/toAdd")
    public String toAdd() {
        return "redirect:/admin/course_add.jsp";
    }

    @RequestMapping("/add")
    public String add(Course course) {
        course.setId(KeyUtils.genItemId());
        insert(course);

        List<Student> students = studentService.findAll();

        Grade grade = new Grade();
        for (Student s :
                students) {
            grade.setCourseId(course.getId());
            grade.setCourseName(course.getName());
            grade.setStudentId(s.getId());
            grade.setStudentName(s.getName());
            grade.setId(KeyUtils.genItemId());
            gradeService.insert(grade);
        }
        return "redirect:toList";
    }

    @RequestMapping("/edit")
    public String edit(Course course) {
        update(course);
        return "redirect:toList";
    }

    @RequestMapping("/delete")
    public String delete(String id) {

        Course course = courseService.findById(id);

        // 删除成绩
        gradeService.deleteAllByCourseId(id);

        remove(id);


        return "redirect:toList";
    }

}
