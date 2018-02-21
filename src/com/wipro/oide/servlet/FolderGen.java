package com.wipro.oide.servlet;

import java.io.File;
import java.io.IOException;

public class FolderGen {
	public String folder() throws IOException
	{
String a="";
	
for(int i=0;i<7;i++)
a+=(int)(Math.random()*10)+"";
System.out.println(a);
Process p=Runtime.getRuntime().exec("cmd /c md e:"+File.separator+"Compiler"+File.separator+"OIDE"+File.separator+"Folder"+a);
return "Folder"+a;

}
	}

