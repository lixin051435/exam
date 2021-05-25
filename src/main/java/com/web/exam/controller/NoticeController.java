package com.web.exam.controller;

import com.web.exam.domain.Notice;
import com.web.exam.service.NoticeService;
import com.web.exam.util.KeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@RequestMapping("/notice")
@Controller
public class NoticeController extends BaseController<Notice> {

    private NoticeService noticeService;

    @Autowired
    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
        super.init(noticeService);
    }

    @GetMapping("/getById")
    public String toEdit(String id,Model model){
        Notice notice = findById(id);
        model.addAttribute("notice",notice);
        return "notice_edit";
    }

    @GetMapping("/toList")
    public String toList(Model model){
        List<Notice> notices = noticeService.findAll();

        Collections.sort(notices, new Comparator<Notice>() {
            @Override
            public int compare(Notice o1, Notice o2) {
                return o2.getCreatetime().compareTo(o1.getCreatetime());
            }
        });
        model.addAttribute("notices",notices);
        return "notice_list";
    }

    @GetMapping("/toAdd")
    public String toAdd(){
        return "redirect:/admin/notice_add.jsp";
    }

    @RequestMapping("/add")
    public String add(Notice notice) {
        notice.setId(KeyUtils.genItemId());
        notice.setCreatetime(new Date());
        insert(notice);
        return "redirect:toList";
    }

    @RequestMapping("/edit")
    public String edit(Notice notice) {
        notice.setCreatetime(new Date());
        update(notice);
        return "redirect:toList";
    }

    @RequestMapping("/delete")
    public String delete(String id) {
        remove(id);
        return "redirect:toList";
    }

}
