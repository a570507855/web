package com;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

public class Main {


    public static void main(String[] args) throws FileNotFoundException {
        //创建文件对象
        File file = new File("../video/frag_bunny.mp4");
        //获取文件名称
        String fileName = file.getName();
        InputStream is = new FileInputStream(file);
    }
}
