package com.web.exam.controller;

import com.web.exam.domain.Course;
import com.web.exam.domain.Grade;
import com.web.exam.domain.Student;
import com.web.exam.service.CourseService;
import com.web.exam.service.GradeService;
import com.web.exam.service.StudentService;
import com.web.exam.util.KeyUtils;
import com.web.exam.vo.GradeVO;
import com.web.exam.vo.StudentGradeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@RequestMapping("/grade")
@Controller
public class GradeController extends BaseController<Grade> {

    private GradeService gradeService;

    private StudentService studentService;

    private CourseService courseService;

    @Autowired
    public GradeController(GradeService gradeService,StudentService studentService,CourseService courseService) {
        this.gradeService = gradeService;
        this.studentService = studentService;
        this.courseService = courseService;
        super.init(gradeService);
    }

    @GetMapping("/getByStudentId")
    public String toEdit(String studentId,Model model){
        StudentGradeVO studentGradeVO = gradeService.getStudentGradeVO(studentId);
        model.addAttribute("studentGradeVO",studentGradeVO);
        return "grade_edit";
    }

    @GetMapping("/toList")
    public String toList(Model model){
        List<Course> courses = courseService.findAllASC();
        model.addAttribute("courses",courses);

        List<StudentGradeVO> studentGradeVOS = gradeService.getAllStudentGradeVO();
        model.addAttribute("studentGradeVOS",studentGradeVOS);
        return "grade_list";
    }

    @RequestMapping("/out")
    public void outExcel(){
        List<StudentGradeVO> studentGradeVOS = gradeService.getAllStudentGradeVO();
    }

    @GetMapping("/toAdd")
    public String toAdd(){
        return "redirect:/admin/grade_add.jsp";
    }

    @RequestMapping("/add")
    public String add(Grade grade) {
        grade.setId(KeyUtils.genItemId());
        insert(grade);
        return "redirect:toList";
    }

    @RequestMapping("/edit")
    public String edit(GradeVO gradeVO) {
        String[] gradeIds = gradeVO.getGradeId();
        Grade grade = null;
        for (int i = 0; i < gradeIds.length; i++) {
            grade = gradeService.findById(gradeIds[i]);
            grade.setGrade(gradeVO.getGrade()[i]);
            gradeService.update(grade);
        }
        return "redirect:toList";
    }

    @RequestMapping("/delete")
    public String delete(String id) {
        remove(id);
        return "redirect:toList";
    }

    @RequestMapping("/order")
    public String toQuery(String orderType, Model model, HttpServletRequest request){

        HttpSession session = request.getSession();
        List<Course> courses = courseService.findAllASC();
        model.addAttribute("courses",courses);

        List<StudentGradeVO> studentGradeVOS = gradeService.getAllStudentGradeVO();


        if("sum1".equals(orderType)){
            Collections.sort(studentGradeVOS, new Comparator<StudentGradeVO>() {
                @Override
                public int compare(StudentGradeVO o1, StudentGradeVO o2) {
                    return o2.getGrade1().compareTo(o1.getGrade1());
                }
            });
        }else if("total".equals(orderType)){
            Collections.sort(studentGradeVOS, new Comparator<StudentGradeVO>() {
                @Override
                public int compare(StudentGradeVO o1, StudentGradeVO o2) {
                    return o2.getTotal().compareTo(o1.getTotal());
                }
            });
        }else{
            Collections.sort(studentGradeVOS, new Comparator<StudentGradeVO>() {
                @Override
                public int compare(StudentGradeVO o1, StudentGradeVO o2) {
                    Integer grade1 = 0;
                    Integer grade2 = 0;
                    for (Grade g :
                            o1.getGrades()) {
                        if(g.getCourseId().equals(orderType)){
                            if(g.getGrade() != null && !g.getGrade().isEmpty()){
                                grade1 = Integer.parseInt(g.getGrade());
                            }
                        }
                    }
                    for (Grade g :
                            o2.getGrades()) {
                        if(g.getCourseId().equals(orderType)){
                            if(g.getGrade() != null && !g.getGrade().isEmpty()){
                                grade2 = Integer.parseInt(g.getGrade());
                            }
                        }
                    }
                    return grade2.compareTo(grade1);
                }
            });
        }

        session.setAttribute("grades",studentGradeVOS);

        model.addAttribute("studentGradeVOS",studentGradeVOS);

        return "grade_list";
    }

}
