package com.web.exam.controller;

import com.web.exam.domain.Course;
import com.web.exam.domain.Grade;
import com.web.exam.domain.Apply;
import com.web.exam.enums.ApplyStatusEnum;
import com.web.exam.service.CourseService;
import com.web.exam.service.GradeService;
import com.web.exam.service.ApplyService;
import com.web.exam.util.KeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/apply")
@Controller
public class ApplyController extends BaseController<Apply> {

    private ApplyService applyService;

    private GradeService gradeService;


    @Autowired
    public ApplyController(ApplyService applyService,GradeService gradeService) {
        this.applyService = applyService;
        this.gradeService = gradeService;
        super.init(applyService);
    }

    @GetMapping("/handle")
    public String handle(String id, String res) {
        Apply apply = findById(id);
        if("ok".equals(res)){
            apply.setStatus(ApplyStatusEnum.APPROVED.getCode());
        }else if("rej".equals(res)){
            apply.setStatus(ApplyStatusEnum.REJECTES.getCode());
        }
        update(apply);
        return "redirect:toList";
    }

    @GetMapping("/toList")
    public String toList(Model model) {
        List<Apply> applys = applyService.findAll();
        model.addAttribute("applys", applys);
        return "apply_list";
    }

    @GetMapping("/toAdd")
    public String toAdd() {
        return "redirect:/admin/apply_add.jsp";
    }

    @RequestMapping("/add")
    public String add(Apply apply) {
        apply.setId(KeyUtils.genItemId());
        apply.setStatus(ApplyStatusEnum.COMMITED.getCode());
        insert(apply);
        return "redirect:toList";
    }

    @RequestMapping("/edit")
    public String edit(Apply apply) {
        update(apply);
        return "redirect:toList";
    }

    @RequestMapping("/delete")
    public String delete(String id) {
        remove(id);
        return "redirect:toList";
    }

}
