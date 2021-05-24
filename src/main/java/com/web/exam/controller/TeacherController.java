package com.web.exam.controller;

import com.web.exam.domain.Teacher;
import com.web.exam.service.TeacherService;
import com.web.exam.util.KeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/teacher")
@Controller
public class TeacherController extends BaseController<Teacher> {

    private TeacherService teacherService;

    @Autowired
    public TeacherController(TeacherService teacherService) {
        this.teacherService = teacherService;
        super.init(teacherService);
    }

    @GetMapping("/getById")
    public String toEdit(String id,Model model){
        Teacher teacher = findById(id);
        model.addAttribute("teacher",teacher);
        return "teacher_edit";
    }

    @GetMapping("/toList")
    public String toList(Model model){
        List<Teacher> teachers = teacherService.findAll();
        model.addAttribute("teachers",teachers);
        return "teacher_list";
    }

    @GetMapping("/toAdd")
    public String toAdd(){
        return "redirect:/admin/teacher_add.jsp";
    }

    @RequestMapping("/add")
    public String add(Teacher teacher) {
        teacher.setId(KeyUtils.genItemId());
        insert(teacher);
        return "redirect:toList";
    }

    @RequestMapping("/edit")
    public String edit(Teacher teacher) {
        update(teacher);
        return "redirect:toList";
    }

    @RequestMapping("/delete")
    public String delete(String id) {
        remove(id);
        return "redirect:toList";
    }

}
