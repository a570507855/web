package com.main.tomcatSessions.service.impl;

import com.MySessionContext;
import com.ToJson;
import com.main.tomcatSessions.dao.TomcatSessionsMapper;
import com.main.tomcatSessions.model.TomcatSessions;
import com.main.tomcatSessions.service.TomcatSessionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.util.*;

@Service
public class TomcatSessionsServiceImpl implements TomcatSessionsService {

    @Autowired
    private TomcatSessionsMapper tomcatSessionsMapper;

    private MySessionContext myc = MySessionContext.getInstance();

    @Override
    public ToJson selectList(Integer page, Integer limit, TomcatSessions tomcatSessions) {
        ToJson json = new ToJson("查询失败");
        try {
            List<TomcatSessions> list = tomcatSessionsMapper.selectList(page, limit, tomcatSessions);
            Integer maxInactive = 0;
            String maxInactiveString = "";
            String accountNumber = "";
            String password = "";
            for(TomcatSessions sessions:list){
                maxInactive = sessions.getMaxInactive();
                maxInactiveString = secondFormat(maxInactive);

                //tomcat sessionData 的反序列化
                byte[] bytes = sessions.getSessionData();
                InputStream input = new ByteArrayInputStream(bytes);
                ObjectInputStream ois = new ObjectInputStream(input);

                //读取出一个对象后，流自动向后移，可以理解为取出不放回
                Long creationTime = (Long)ois.readObject();
                Long lastAccessedTime = (Long)ois.readObject();
                Integer maxInactiveInterval = ((Integer)ois.readObject());
                boolean isNew = ((Boolean) ois.readObject());
                boolean isValid = ((Boolean) ois.readObject());
                Long thisAccessedTime = ((Long)ois.readObject());
                String id = (String) ois.readObject();
                int n = (Integer) ois.readObject();
                Map<String, String> map = new HashMap<String,String>();
                for (int i = 0; i < n; i++) {
                    String name = (String)ois.readObject();
                    String value = (String)ois.readObject();
                    map.put(name,value);
                }
                sessions.setMaxInactiveString(maxInactiveString);
                sessions.setLastAccessDate(new Date(sessions.getLastAccess()));
                sessions.setCreationTime(new Date(creationTime));
                sessions.setUsername(map.get("username"));
                sessions.setIsMember(map.get("isMember"));
                sessions.setSex(map.get("sex"));
            }
            json.setFlag(1);
            json.setCode("0");
            json.setMsg("查询成功");
            json.setObj(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson selectSessions() {
        ToJson json = new ToJson("获取失败");
        HashMap<String, HttpSession> map = myc.getSessionMap();
        List<TomcatSessions> list = new ArrayList<>();
        for(HashMap.Entry<String, HttpSession> entry :map.entrySet()){

            TomcatSessions tomcatSessions = new TomcatSessions();
            tomcatSessions.setCreationTime(new Date(entry.getValue().getCreationTime()));
            tomcatSessions.setSessionId(entry.getValue().getId());
            tomcatSessions.setLastAccessDate(new Date(entry.getValue().getLastAccessedTime()));
            tomcatSessions.setMaxInactiveString(secondFormat(entry.getValue().getMaxInactiveInterval()));
            if(entry.getValue().getAttribute("username") != null){
                tomcatSessions.setUsername(entry.getValue().getAttribute("username").toString());
                tomcatSessions.setIsMember(entry.getValue().getAttribute("isMember").toString());
                tomcatSessions.setSex(entry.getValue().getAttribute("sex").toString());
            }
            list.add(tomcatSessions);
        }
        if(!list.isEmpty()){
            json.setFlag(1);
            json.setObj(list);
            json.setMsg("获取成功");
            json.setCode("0");
        }
        return json;
    }

    //将秒格式化为xx天xx时xx分xx秒
    public String secondFormat(int second){
        String formatString = "";
        if(second<60){
            formatString = String.valueOf(second) + "秒";
        }
        else if(second<3600){
            formatString = String.valueOf(second / 60) + "分" + String.valueOf(second % 60) + "秒";
        }
        else if(second < 86400) {
            formatString = String.valueOf(second / 3600) + "时" + String.valueOf((second % 60) / 60) + "分" + String.valueOf((second % 60) % 60) + "秒";
        }
        else{
            formatString = String.valueOf(second / 86400) + "天" + String.valueOf((second % 86400) / 3600) + "时" + String.valueOf(((second % 86400) % 60) / 60) + "分" + String.valueOf(((second % 86400) % 60) % 60) + "秒";
        }
        return formatString;
    }
}
