package com.docInventory.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletContext;

public class FileReaderFromRelativeLocation {

    public static String read(String fileLocation, ServletContext context) throws IOException{
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(context.getResourceAsStream(fileLocation)));

        StringBuilder sb = new StringBuilder();
        for (String curLine = null;(curLine = bufferedReader.readLine()) != null;){
        	sb.append(curLine);
        }
        bufferedReader.close();
        
        return sb.toString();
    }
}