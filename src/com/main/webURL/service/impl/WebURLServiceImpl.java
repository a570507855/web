package com.main.webURL.service.impl;

import com.ToJson;
import com.main.webURL.dao.WebURLMapper;
import com.main.webURL.model.WebURL;
import com.main.webURL.service.WebURLService;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Service
public class WebURLServiceImpl implements WebURLService {

    @Autowired
    private WebURLMapper mapper;


    @Override
    public ToJson selectList(Integer page, Integer limit, WebURL webURL) {
        ToJson json = new ToJson("查询失败");
        try {
            List<WebURL> list = mapper.selectList(page, limit, webURL);
            long count = mapper.count(webURL);
            json.setFlag(1);
            json.setCode("0");
            json.setMsg("查询成功");
            json.setObj(list);
            json.setTotleNum((int)count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson insert(WebURL webURL) {
        ToJson json = new ToJson("新增失败");
        try {
            String subdomain = webURL.getSubdomain(),
                    domain = webURL.getDomain(),
                    suffix = webURL.getSuffix();
            String host = subdomain == "" ? "" : subdomain +
                            domain == "" ? "" : "." + domain +
                            suffix == "" ? "" : "." + suffix;
            webURL.setHost(host);
            int i = mapper.insert(webURL);
            if(i>0){
                json.setFlag(1);
                json.setCode("0");
                json.setMsg("新增成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson update(WebURL webURL) {
        ToJson json = new ToJson("更新失败");
        try {
            int i = mapper.updates(webURL);
            if(i>0){
                json.setFlag(1);
                json.setCode("0");
                json.setMsg("更新失败");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson delete(String id) {
        ToJson json = new ToJson("删除失败");
        try {
            String[] idArr = id.split(",");
            int i = mapper.deletes(idArr);
            if(i>0){
                json.setFlag(1);
                json.setCode("0");
                json.setMsg("删除成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;

    }

    @Override
    public ToJson export(HttpServletResponse response, Integer page, Integer limit, WebURL webURL) {
        ToJson json = new ToJson("导出失败");
        List<WebURL> list = mapper.selectList(page, limit ,webURL);
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

        for(WebURL _webURL:list){
            System.out.println(_webURL.getUrl());
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
