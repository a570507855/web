package com.main.book.service.impl;

import com.ToJson;
import com.main.book.dao.BookMapper;
import com.main.book.model.Book;
import com.main.book.service.BookService;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Service
public class BookServiecImpl implements BookService {
    @Autowired
    private BookMapper mapper;


    @Override
    public ToJson selectList(Integer page, Integer limit,Book book) {
        ToJson json = new ToJson("查询失败");
        try {
            List<Book> list = mapper.selectList(page,limit,book);
            json.setObj(list);
            json.setFlag(1);
            json.setMsg("查询成功");
            json.setCode("1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson insert(Book book) {
        ToJson json = new ToJson("新增失败");
        try {
            int i = mapper.inserts(book);
            if(i>0){
                json.setFlag(1);
                json.setCode("1");
                json.setMsg("新增成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson update(Book book) {
        ToJson json = new ToJson("更新失败");
        try {
            int i = mapper.updates(book);
            if(i > 0){
                json.setFlag(1);
                json.setCode("1");
                json.setMsg("更新成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson delete(String ids) {
        ToJson json = new ToJson("删除失败");
        try {
            String[] idArr = ids.split(",");
            int i = mapper.deletes(idArr);
            if(i>0){
                json.setFlag(1);
                json.setCode("1");
                json.setMsg("删除成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson export(HttpServletResponse response, Integer page, Integer limit, Book book) {
        ToJson json = new ToJson("导出失败");
        List<Book> list = mapper.selectList(page, limit ,book);
        json.setObj(list);
        //创建excel文档对象
        HSSFWorkbook wk = new HSSFWorkbook();
        //创建excel表单
        HSSFSheet sheet = wk.createSheet();
        //创建excel行
        HSSFRow row = sheet.createRow(0);
        //创建excel单元格内容
        HSSFCell cell = row.createCell(1);
        //设置单元格的值

        for(Book _book:list){
            System.out.println(_book.getName());
        }


        try {
            OutputStream os = response.getOutputStream();
            response.reset();
            response.setHeader("Content-disposition", "attachment; filename=details.xls");
            response.setContentType("application/msexcel");
            wk.write(os);
            os.close();
            return  null;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return json;

    }

}
