package com.project.payroll.test;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.InputStream;
import com.itextpdf.tool.xml.XMLWorkerHelper;

public class Test {

	/*public static void main(String[] args) throws FileNotFoundException, DocumentException {

		try
		{
            OutputStream file = new FileOutputStream(new File("C:/itextExamples/HTMLtoPDF.pdf"));
            Document document = new Document();
            PdfWriter writer = PdfWriter.getInstance(document, file);
            StringBuilder htmlString = new StringBuilder();
            htmlString.append(new String("<html><body> This is HTML to PDF conversion Example<table border='2' align='center'> "));
            htmlString.append(new String("<tr><td>JavaCodeGeeks</td><td><a href='examples.javacodegeeks.com'>JavaCodeGeeks</a> </td></tr>"));              
            htmlString.append(new String("<tr> <td> Google Here </td> <td><a href='www.google.com'>Google</a> </td> </tr></table></body></html>"));
            document.open();
            InputStream is = new ByteArrayInputStream(htmlString.toString().getBytes());
            XMLWorkerHelper.getInstance().parseXHtml(writer, document, is);
            document.close();
            file.close();    
            System.out.println("Pdf created");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}*/
	
	public static void main(String[] args)
	{
		System.out.println("................");
		
	    //SmtpClient client = new SmtpClient("smtp.gmail.com");

	}
}
