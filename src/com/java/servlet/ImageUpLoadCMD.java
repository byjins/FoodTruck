package com.java.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImageUpLoadCMD implements MainCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html"); // 인코딩은 필터로 적용

		PrintWriter out = response.getWriter(); // 브라우저에 출력하기 위해

		// 인코딩필터 = body에 들어가는 인코딩이라 파일업로드시 인코딩과 개념 다름
		// 파일인코딩시 encType은 MultipartRequest의 관점 => 파일 제목등 파일과 관련이 있음
		String encType = "UTF-8"; // cos.jar파일의 객체 생성 시점에 넣어줌
		int maxFileSize = 5 * 1024 * 1024; // 5MB

		// MulitpartRequest(request, 저장경로[, 최대허용크기, 인코딩캐릭터셋, 동일한 파일명 보호여부]);
		// 파일명보호: DefaultFileRenamePolicy => name.zip, name1.zip, ...

		// 업로드에 해당하는 부분
		MultipartRequest mr = new MultipartRequest(request, "/img", maxFileSize, encType,
				new DefaultFileRenamePolicy());

		// 파일 관련 정보 추출
		File file01 = mr.getFile("/file01"); // upload1.html의 폼태그 값
		System.out.println(file01); // 첨부된 파일의 전체 경로 출력

		// 파라미터값 읽어오기
		System.out.println(mr.getParameter("title"));

		System.out.println("파일 경로 => " + file01.toString());
		System.out.println("타이틀명 => " + mr.getParameter("title"));
	}
}// class
