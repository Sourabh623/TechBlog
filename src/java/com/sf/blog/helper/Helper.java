/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sf.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

    public static boolean deleteFile(String path) {
        boolean f = false;

        try {
            File file = new File(path);

            f = file.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;

        try {
            byte b[] = new byte[is.available()];

            is.read(b);

            FileOutputStream fos = new FileOutputStream(path);

            fos.write(b);

            fos.flush();

            fos.close();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public static String get10Words(String desc) {
        String[] str = desc.split(" ");

        if (str.length > 10) {
            String res = "";
            for (int i = 0; i < 10; i++) {
                res = res + str[i] + " ";
            }
            return (res + "...");

        } else {
            return (desc + "...");
        }
    }
}
