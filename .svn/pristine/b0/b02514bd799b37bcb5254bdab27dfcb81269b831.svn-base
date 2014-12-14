package com.deniz.flightinformation.services.scf.tasks;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;

import com.deniz.framework.controller.LoggingTaskControllerTemplate;


public class ScfPreviewTaskController extends LoggingTaskControllerTemplate {

	public void download(HttpServletRequest request,
			HttpServletResponse response) {
		exportFile(response, "scf.pdf");
	}

	public void export(HttpServletRequest request, HttpServletResponse response) {
		exportFile(response, "dscf.xls");
	}

	private void exportFile(HttpServletResponse response, String filename) {
		try {
			writeAttachmentToResponse(response, filename);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void writeAttachmentToResponse(HttpServletResponse response,
			String filename) throws Exception {
		response.setContentType("text/plain" + "; charset=UTF-8");

		response.setHeader("Content-disposition", "attachment; filename=\""
				+ filename + "\"");
		response.setCharacterEncoding("UTF-8");

		FileInputStream inputStream = new FileInputStream("D:\\" + filename);

		FileCopyUtils.copy(inputStream, response.getOutputStream());

		inputStream.close();
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
