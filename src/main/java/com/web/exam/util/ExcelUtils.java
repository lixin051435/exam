package com.web.exam.util;

import com.web.exam.domain.Grade;
import com.web.exam.domain.Person;
import com.web.exam.vo.StudentGradeVO;
import org.apache.poi.hssf.usermodel.*;

import javax.servlet.ServletOutputStream;
import java.util.ArrayList;
import java.util.List;

public class ExcelUtils {
    public static void export( List<StudentGradeVO> studentGradeVOList, ServletOutputStream out) throws Exception {
        try {
            // 第一步，创建一个workbook，对应一个Excel文件
            HSSFWorkbook workbook = new HSSFWorkbook();

            // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
            HSSFSheet hssfSheet = workbook.createSheet("sheet1");

            // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short

            HSSFRow row = hssfSheet.createRow(0);
            // 第四步，创建单元格，并设置值表头 设置表头居中
            HSSFCellStyle hssfCellStyle = workbook.createCellStyle();

            List<String> titles = new ArrayList<>();
            titles.add("学生编号");
            titles.add("学生账号");
            titles.add("学生姓名");
            StudentGradeVO vo = studentGradeVOList.get(0);
            for (Grade g :
                    vo.getGrades()) {
                titles.add(g.getCourseName());
            }
            titles.add("第一课堂总分");
            titles.add("第二课堂总分");
            titles.add("综合测评总分");

            HSSFCell hssfCell = null;
            for (int i = 0; i < titles.size(); i++) {
                hssfCell = row.createCell(i);//列索引从0开始
                hssfCell.setCellValue(titles.get(i));//列名1
                hssfCell.setCellStyle(hssfCellStyle);//列居中显示
            }

            // 第五步，写入实体数据
            for (int i = 0; i < studentGradeVOList.size(); i++) {
                row = hssfSheet.createRow(i + 1);
                StudentGradeVO studentGradeVO = studentGradeVOList.get(i);

                // 第六步，创建单元格，并设置值
                row.createCell(0).setCellValue(studentGradeVO.getStudent().getId());
                row.createCell(1).setCellValue(studentGradeVO.getStudent().getAccount());
                row.createCell(2).setCellValue(studentGradeVO.getStudent().getName());
                List<Grade> grades = studentGradeVO.getGrades();
                int j = 0;
                for (; j < grades.size(); j++) {
                    row.createCell(3+j).setCellValue(grades.get(j).getGrade());
                }

                row.createCell(3+j).setCellValue(studentGradeVO.getGrade1());
                j++;

                row.createCell(3+j).setCellValue(studentGradeVO.getGrade2());
                j++;

                row.createCell(3+j).setCellValue(studentGradeVO.getTotal());
                j++;

            }

            // 第七步，将文件输出到客户端浏览器
            try {
                workbook.write(out);
                out.flush();
                out.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("导出信息失败！");

        }
    }
}
