package com.wipro.oide.servlet;
import java.io.*;

public class WriteFileInput {
	
void writeFile(String content,String folder){
 String FILENAME = "E:\\Compiler\\OIDE\\"+folder+"\\input.txt";
		BufferedWriter bw = null;
		FileWriter fw = null;

		try {
			fw = new FileWriter(FILENAME);
			bw = new BufferedWriter(fw);
			bw.write(content);

		

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				if (bw != null)
					bw.close();

				if (fw != null)
					fw.close();

			} catch (IOException ex) {

				ex.printStackTrace();

			}

		}

	}
}
