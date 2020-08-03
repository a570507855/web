package com.vue;

import com.ToJson;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/vue")
@Service
public class VueData {


    @CrossOrigin
    @ResponseBody
    @RequestMapping("/data")
    public ToJson<Map<String, String>> getData(){
        ToJson<Map<String, String>> json = new ToJson<Map<String, String>>("查询成功");
        ArrayList<Map<String, String>> bannersList = new ArrayList<Map<String, String>>();
        Map<String,String> map = new HashMap<>();
        map.put("link","https://act.mogujie.com/huanxin0001?acm=3.mce.2_10_1jhwa.43542.0.ccy5br4OlfK0Q.pos_0-m_454801-sd_119");
        map.put("image","https://s10.mogucdn.com/mlcdn/c45406/180926_45fkj8ifdj4l824l42dgf9hd0h495_750x390.jpg");
        bannersList.add(map);
        map.put("link","https://act.mogujie.com/ruqiu00001?acm=3.mce.2_10_1ji16.43542.0.ccy5br4OlfK0R.pos_1-m_454889-sd_119");
        map.put("image","https://s10.mogucdn.com/mlcdn/c45406/180926_31eb9h75jc217k7iej24i2dd0jba3_750x390.jpg");
        bannersList.add(map);
        map.put("link","https://act.mogujie.com/huanji001?acm=3.mce.2_10_1jfj8.43542.0.ccy5br4OlfK0S.pos_2-m_453270-sd_119");
        map.put("image","https://s10.mogucdn.com/mlcdn/c45406/180919_3f62ijgkj656k2lj03dh0di4iflea_750x390.jpg");
        bannersList.add(map);
        map.put("link","https://act.mogujie.com/liuxing00001?acm=3.mce.2_10_1jepe.43542.0.ccy5br4OlfK0T.pos_3-m_452733-sd_119");
        map.put("image","https://s10.mogucdn.com/mlcdn/c45406/180917_18l981g6clk33fbl3833ja357aaa0_750x390.jpg");
        bannersList.add(map);
        json.setObj(bannersList);

        return json;
    }
}
