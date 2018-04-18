package com.project.payroll.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.project.payroll.pojo.Employee;
import com.lowagie.text.Table;

public class PDFBuilder extends AbstractPdfView {

	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter pdfWriter,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> userData = (Map<String, String>) model.get("userData");

		Table table = new Table(2);
		table.addCell("Roll No");
		table.addCell("Name");

		for (Map.Entry<String, String> entry : userData.entrySet()) {
			table.addCell(entry.getKey());
			table.addCell(entry.getValue());
		}
		document.add(table);
	}

}
