package com.wipro.oide.servlet;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

public class Ide {
	String compilerOperation(String arg,int sel,String inputs,String command) throws IOException
	{
		FolderGen fg=new FolderGen();
		String folder=fg.folder();
		String path2="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+"input.txt";
	
	String finalargs="";
	String inputargs[]=command.split("\\r?\\n");
	for(int i=0;i<inputargs.length;i++)
		finalargs+=inputargs[i].trim()+" ";
	System.out.println("dsvsd"+command);
	File f1=new File(path2);
		f1.getParentFile().mkdirs();
		f1.createNewFile();
		WriteFileInput wfi=new WriteFileInput();
		wfi.writeFile(inputs,folder);
		ReadFileExample1 rf=new ReadFileExample1();
		int check_input=rf.checkInput(folder);
		System.out.println(check_input);
	String path="";
		switch(sel)
		{
		case 1:
		path="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+"cs.c";
		WriteFileC wf1=new WriteFileC();
		wf1.writeFile(arg,folder);
		break;
		case 2:
		path="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+"cpps.cpp";
		WriteFileCpp wf2=new WriteFileCpp();
		wf2.writeFile(arg,folder);
		break;
		case 3:case 4:case 5:
			
			path="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+"temps.java";
			WriteFileTempJava wf31=new WriteFileTempJava();
			wf31.writeFile(arg,folder);
		
		break;
		
		case 6:case 7:
		path="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+"pythons.py";
		WriteFilePython wf4=new WriteFilePython();
		wf4.writeFile(arg,folder);
		break;
		
		case 8:
			path="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+"rubys.rb";
			WriteFileRuby wf5=new WriteFileRuby();
			wf5.writeFile(arg,folder);
			break;
		case 9:
			path="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+"scalas.scala";
			WriteFilePerl wf6=new WriteFilePerl();
			wf6.writeFile(arg,folder);
			break;
		}
		File f=new File(path);
		f.getParentFile().mkdirs();
		f.createNewFile();
		   String line2="";
            try 
            { 
            	Process p=null;
            	String fl=null;
            	String fl2[]=null;
            	switch(sel)
            	{
            	case 1:
            		
                	fl="cs.c";
                	fl2=fl.split("\\.");
                  if(check_input==0)
                	p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE &&  cd "+folder+" && gcc -o "+fl2[0]+" "+fl+" && "+fl2[0]);
                  else 
                	  p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE &&  cd "+folder+" && gcc -o "+fl2[0]+" "+fl+" && "+fl2[0]+"<input.txt");
            		
                    break;
            	case 2:
            		
                	fl="cpps.cpp";
                	fl2=fl.split("\\.");
                	   if(check_input==0)
                       	   p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" && g++ -o "+fl2[0]+" "+fl+" && "+fl2[0]);
                	   else
                		   p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" && g++ -o "+fl2[0]+" "+fl+" && "+fl2[0]+"<input.txt");
            		break;
            	
            	   case 3:
            		   
                                      	fl=new DetectJavaName().searchFile(folder);
                                   
                                      
                                      	
                                      	path="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+fl+".java";
                                		WriteFileJava wf32=new WriteFileJava();
                                		wf32.writeFile(arg,folder,fl);
                 String path3="";  	
                   	//fl2=fl.split("\\.");
                   	   if(check_input==0)
                   	p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" && javac "+fl+".java && java "+fl+" "+finalargs);
                   	   else
                   		   p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" && javac "+fl+".java && java "+fl+" "+finalargs+"<input.txt");
                                      	 break;
            	   case 4:
            		   
                     	fl=new DetectJavaName().searchFile(folder);
                  
                     
                     	
                     	path="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+fl+".java";
               		WriteFileJava wf41=new WriteFileJava();
               		wf41.writeFile(arg,folder,fl);
  	String path4="C:"+File.separator+"Program Files"+File.separator+"Java"+File.separator+"jdk1.8.0_45"+File.separator+"bin";
  	//fl2=fl.split("\\.");
  	   if(check_input==0)
  	p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" &&set path="+path4+"&&javac "+fl+".java && java "+fl+" "+finalargs);
  	   else
  		   p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" &&set path="+path4+"&&javac "+fl+".java && java "+fl+" "+finalargs+"<input.txt");
                     	 break;

            	   case 5:
            		   
                    	fl=new DetectJavaName().searchFile(folder);
                 
                    
                    	
                    	path="E:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+File.separator+fl+".java";
              		WriteFileJava wf51=new WriteFileJava();
              		wf51.writeFile(arg,folder,fl);
              		//C:\Program Files\Java\jdk1.8.0_45\bin
 	String path5="C:"+File.separator+"Program Files"+File.separator+"Java"+File.separator+"jdk-9.0.1"+File.separator+"bin";
 	//fl2=fl.split("\\.");
 
 	   if(check_input==0)
 	p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" &&set path="+path5+"&&javac "+fl+".java && java "+fl+" "+finalargs);
 	   else
 		   p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" &&set path="+path5+"&&javac "+fl+".java && java "+fl+" "+finalargs+"<input.txt");
                    	 break;

            	   case 6:  
            
            	fl="pythons.py";
            	String path6="C:"+File.separator+"Python27";
            	   if(check_input==0)
            	p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" &&set path="+path6+"&&python2 "+fl);
            	   else
            		   p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE &&  cd "+folder+" &&set path="+path6+"&&python2 "+fl+"<input.txt"); 
        		break;
            	   case 7:  
                       
                   	fl="pythons.py";
                   	String path7="C:"+File.separator+"Python36";
                   	   if(check_input==0)
                   	p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+" &&set path="+path7+"&&python3 "+fl);
                   	   else
                   		   p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE &&  cd "+folder+" &&set path="+path7+"&&python3 "+fl+"<input.txt"); 
               		break;
                   
            	   case 8:  
                       
                   	fl="rubys.rb";
                   	String path8="C:"+File.separator+"Ruby22"+File.separator+"bin";
                   	   if(check_input==0)
                   	p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+"&&set path="+path8+"&&ruby "+fl);
                   	   else
                   		   p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE &&  cd "+folder+"&&set path="+path8+"&&ruby "+fl+"<input.txt"); 
               		break;

            	   case 9:  
                       
                      	fl="perls.pl";
                      	String path9="C:"+File.separator+"Perl64"+File.separator+"site"+File.separator+"bin;C:"+File.separator+"Perl64"+File.separator+"bin";
                      	   if(check_input==0)
                      	p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE && cd "+folder+"&&set path="+path9+"&&perl "+fl);
                      	   else
                      		   p=Runtime.getRuntime().exec("cmd /c cd/ && e: && cd Compiler && cd OIDE &&  cd "+folder+"&&set path="+path9+"&&perl "+fl+"<input.txt"); 
                  		break;

            	}
            	
            	
            	p.waitFor(); 
            	  Process p1=Runtime.getRuntime().exec("cmd /c del e:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+"File.separator"+"input.txt");
                BufferedReader readerop=new BufferedReader(
                    new InputStreamReader(p.getInputStream())
                ); 
                BufferedReader readererror=new BufferedReader(
                        new InputStreamReader(p.getErrorStream())
                    );
                
                String line; 
             
              
                while((line = readererror.readLine()) != null) 
                { 
                	
                    System.out.println(line);
                    line2+=line+"\n";
                   
                }
           
                while((line = readerop.readLine()) != null) 
                { 
               
                    System.out.println(line);
                 
                    line2+=line+"\n";
                }
                 
         }
            catch(IOException e1) {e1.printStackTrace();} 
            catch(InterruptedException e2) {e2.printStackTrace();} 
//System.out.println(folder);
            Process p=Runtime.getRuntime().exec("cmd /c rmdir e:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+folder+"/S/Q");
            return line2;
        } 
 

}



//C:\Users\students>md e:\Compiler\MyprojectServlet\noufal.txt


/*File creating  
 * String path="E:"+File.separator+"Compiler"+File.separator+"MyprojectServlet"+File.separator+"mine.txt";
File f=new File(path);

	
f.getParentFile().mkdirs();
f.createNewFile();

rmdir e:\Compiler\OIDE\del/S/Q
*/