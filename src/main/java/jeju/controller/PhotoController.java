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

@Controller
public class PhotoController {
	
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
		
		//사진을 업로드할 폴더
		String path = request.getSession().getServletContext().getRealPath("/resources/photo/profile_photo");
		System.out.println(path);
		
		//파일명을 랜덤하게 구해서 dto 에 저장
		String photo = UUID.randomUUID().toString();
		
		//업로드
		try {
			upload.transferTo(new File(path + "/" + photo));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// db 수정
		memberTableDao.updateMemberPhoto(photo, id);
		
		// session 에서도 사진 변경
		session.setAttribute("myphoto", photo);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("photo", photo);
		return map;
	}
}
