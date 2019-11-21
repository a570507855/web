package com;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ceshi")
public class ceshi {
    @RequestMapping("/one")
    public String one(){
        return "one";
    }
}
