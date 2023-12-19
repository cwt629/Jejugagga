package jeju.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jeju.dao.MemberTableDao;
import jeju.dto.MemberTableDto;
import jeju.storage.NcpObjectStorageService;

@Controller
public class PhotoController {
	
	@Autowired
	private NcpObjectStorageService storageService;
	
	private String bucketName="jejugagga-cwt";
	private String bucketFolder="profile_photo";
	
	@Autowired
	private MemberTableDao memberTableDao;
	
	@PostMapping("/mypage/photochange")
	@ResponseBody Map<String, String> changePhoto(
			@RequestParam MultipartFile upload,
			HttpServletRequest request,
			HttpSession session) {
		
		
		//현재 로그인한 아이디 얻기
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		
		// 버켓에 업로드후 랜덤 파일명 리턴받기
		String fileName=storageService.uploadFile(bucketName, bucketFolder, upload);
		System.out.println(fileName);
		// 원본사진경로
		String path="https://kr.object.ncloudstorage.com/jejugagga-cwt/profile_photo/" + fileName;
		System.out.println(path);
		
		// db 수정
		memberTableDao.updateMemberPhoto(fileName, id);
		
		// session 에서도 사진 변경
		session.setAttribute("myphoto", fileName);
		session.setAttribute("profile_photo", path);
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("photo", fileName);
		map.put("path", path);
		return map;
	}	
}
