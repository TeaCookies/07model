package com.model2.mvc.common;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	
	//private static String UPLOAD_PATH = "C:\\Users\\bitcamp\\git\\06model\\06.Model2MVCShop(Presentation+BusinessLogic)\\WebContent\\images\\uploadFiles\\";

	public static String saveFile(MultipartFile file, String uploadPath) throws Exception{
	    // ���� �̸� ����
	    String saveName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
	
	    // ������ File ��ü�� ����(������ ����)
	    File saveFile = new File(uploadPath,saveName); // ������ ���� �̸�, ������ ���� �̸�
	    file.transferTo(saveFile); // ���ε� ���Ͽ� saveFile�̶�� ������ ����
	    return saveName;
	} 
}