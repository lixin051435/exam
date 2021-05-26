package com.web.exam.controller;

import com.web.exam.service.GradeService;
import com.web.exam.util.ExcelUtils;
import com.web.exam.util.KeyUtils;
import com.web.exam.vo.StudentGradeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/excel")
public class ExcelController {

    @Autowired
    private GradeService gradeService;

    @RequestMapping("/export")
    public String export(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session =  request.getSession();
        response.setContentType("application/binary;charset=UTF-8");
        try {
            ServletOutputStream out = response.getOutputStream();
            try {
                response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode(KeyUtils.genItemId() + ".xls", "UTF-8"));
            } catch (UnsupportedEncodingException e1) {
                e1.printStackTrace();
            }
            List<StudentGradeVO> studentGradeVOList = (List<StudentGradeVO>) session.getAttribute("grades");
            if(studentGradeVOList == null){
                studentGradeVOList = gradeService.getAllStudentGradeVO();
            }
            ExcelUtils.export(studentGradeVOList, out);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "导出信息失败";
        }
    }
}
