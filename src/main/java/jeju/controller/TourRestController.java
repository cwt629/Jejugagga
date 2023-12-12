package jeju.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jeju.dao.TourDao;
import jeju.dto.TourDto;

@RestController
public class TourRestController {
	
	@Autowired
	private TourDao tourDao;
	
	@GetMapping("/tour/view")
	public HashMap<String, Object> getAllTour(@RequestParam String word, @RequestParam (defaultValue = "1") int currentPage,
			@RequestParam(name = "contenttype", required = false) Integer[] contenttype,@RequestParam (defaultValue = "0") int sigungucode) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		//페이징처리
		//페이징에 처리에 필요한 변수들
		int perPage=12; //한페이지당 보여지는 게시글의 갯수
		int totalCount=0; //총 개시글의 개수
		int totalPage = 0;//총페이지수
		int startNum;//각페이지당 보여지는 글의 시작번호
		int perBlock=5; //한블럭당 보여지는 페이지의 개수
		int startPage; //각블럭당 보여지는 페이지의 시작번호
		int endPage;
		//총 글갯수
		totalCount=tourDao.getTotalCount(word);
		//총페이지수,나머지가 있으면 무조건올림
		//총게시글이 37-한페이지 3-12.3333....13페이지
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
		//각블럭의 시작페이지와 끝페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//endPage는 totalPage를 넘지않도록 한다
		if(endPage>totalPage)
			endPage=totalPage;
		//각페이지당 불러올 글의 번호
		//10개씩일 경우 기준
		//1페이지:0~9 2페이지:10~19
		startNum=(currentPage-1)*perPage;
		//각 페이지의 시작 번호
		int no=totalCount-(currentPage-1)*perPage;
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		
		resultMap.put("data", tourDao.getAllTour(word, startNum, contenttype, sigungucode));
		
		//page info put
		pageMap.put("totalCount",totalCount);
		pageMap.put("totalPage",totalPage);
		pageMap.put("startPage",startPage);
		pageMap.put("endPage",endPage);
		pageMap.put("startNum",startNum);
		pageMap.put("currentPage",currentPage);
		pageMap.put("no",no);
		
		resultMap.put("pageInfo", pageMap);
			
		return resultMap;
	}
	
	
}

