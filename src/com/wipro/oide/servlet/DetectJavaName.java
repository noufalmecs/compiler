package com.wipro.oide.servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.lang.*;
public class DetectJavaName {
     int flag=0;
  
    String string;
     int i=0;

    
     
    public String searchFile(String folder) throws IOException{
    	
    	
    	  BufferedReader br = new BufferedReader(new FileReader("E:\\Compiler\\OIDE\\"+folder+"\\temps.java"));
    	
    	String result="";
        try {
            String word = "public";
             
            //BufferedReader br = new BufferedReader(new FileReader("E:\\Compiler\\OIDE\\"+folder+"\\temps.java"));
             
            while((string = br.readLine()) != null){
flag=0;
                String starr[] = string.trim().split("[\\s{]+");
                        for(int j=0;j<starr.length;j++){
            if(starr[j].equals("public")){
                              i=j;
                              if(starr[i+1].equals("interface"))
                              {
                            	  result=starr[i+2].replaceAll("[^a-zA-Z0-9]"," ");
                            	  System.out.println(result);
                            	  break;
                              }
                              if(starr[i+1].equals("class")){
                            	  result=starr[i+2].replaceAll("[^a-zA-Z0-9]"," ");
                            	  System.out.println(result);
                            	  
                            	   break;
                            	   }
                              break;
                    } 
                }
            }
        }
catch (IOException e) {
            e.printStackTrace();
        }
       br.close();
        Process p=Runtime.getRuntime().exec("cmd /c del e:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+"File.separator"+"temps.txt");
    if(result.equals(""))
    return "file";
    	else
    return result;  
    }
     
 
}