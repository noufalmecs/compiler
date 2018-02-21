package com.wipro.oide.servlet;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class ReadFileExample1 {



	public int checkInput(String folder)
	{
		 String FILENAME = "E:\\Compiler\\OIDE\\"+folder+"\\input.txt";
int ch=0;
		BufferedReader br = null;
		FileReader fr = null;

		try {

			//br = new BufferedReader(new FileReader(FILENAME));
			fr = new FileReader(FILENAME);
			br = new BufferedReader(fr);

			String sCurrentLine;

			while((sCurrentLine = br.readLine()) != null) {
			ch++;
			}

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				if (br != null)
					br.close();

				if (fr != null)
					fr.close();

			} catch (IOException ex) {

				ex.printStackTrace();

			}

		}
		return ch;

	}

}