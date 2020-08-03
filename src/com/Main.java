package com;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
public class Main {
    public  static HashMap<Integer,Integer> union = new HashMap<>();

    public static void main(String[] args) throws IOException {

        FileInputStream in = new FileInputStream("H:\\剑三\\JX3\\Game\\JX3\\PakV4\\1000\\001.dat");
//			File file = new File(dec);
//			if(!file.exists())
//				file.createNewFile();

        FileOutputStream out = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\123.txt");
        byte buffer[] = new byte[1024];
        int count,i;
        in.close();
        out.close();
    }

}
