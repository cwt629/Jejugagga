package jeju.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeju.dto.CourseDto;
import jeju.dto.CourseRouteDto;
import jeju.dto.MemberTableDto;
import jeju.dto.TourDto;
import jeju.service.CourseLikesService;
import jeju.service.CourseRouteService;
import jeju.service.CourseService;
import jeju.service.MemberTableService;
import jeju.service.TourService;

@Controller
public class CourseController {

	@Autowired
	private TourService tourService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private CourseRouteService courseRouteService;
	
	@Autowired
	private CourseLikesService courseLikesService;
	
	@Autowired
	private MemberTableService memberTableService;
	
	private final int COURSES_PER_PAGE = 4; // 페이지당 보여줄 코스 개수
	private final int PAGES_PER_BLOCK = 5; // 블록당 보여질 최대 페이지 개수
	
	// 프로필 사진 파일명 바로 앞에 붙는 링크
	private final String PROFILE_PHOTO_PREFIX = "https://kr.object.ncloudstorage.com/jejugagga-cwt/profile_photo/";
	
	@GetMapping("/course/list")
	public String list(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "") String query,
			@RequestParam(defaultValue = "0") int count,
			@RequestParam(defaultValue = "") String numstd,
			@RequestParam(defaultValue = "") String sortstd) {
		
		// Paging
		int totalPages, startPage, endPage, startIndex;
		int totalCount = courseService.getSearchedCount(query, count, numstd); // 전체 코스 개수
		
		// 총 페이지 수: 전체 코스 수를 페이지 당 코스 수로 나누고, 올림 
		totalPages = (int)Math.ceil((double)totalCount / (double)COURSES_PER_PAGE);
		
		// 해당 블럭의 시작 페이지와 끝 페이지
		startPage = (currentPage - 1) / PAGES_PER_BLOCK * PAGES_PER_BLOCK + 1;
		endPage = startPage + PAGES_PER_BLOCK - 1;
		// 마지막 블록에서는 endPage가 totalPages를 넘어가는 경우가 있어, 이 경우 마지막 페이지로 고정
		if (endPage > totalPages)
			endPage = totalPages;
		
		// 해당 블럭에서 보여줄 시작 인덱스
		startIndex = (currentPage - 1) * COURSES_PER_PAGE;
		
		// 해당 페이지에 보여줄 코스 목록
		List<CourseDto> courses = courseService.selectSearchedCoursesInPage(query, count, numstd, sortstd, COURSES_PER_PAGE, startIndex);
		
		// 현재 로그인한 유저 코드
		int currentUserCode = -1;
		if (session.getAttribute("usercode") != null)
			currentUserCode = (int)session.getAttribute("usercode");
		
		// 각 코스에 대해 정보 저장
		for (CourseDto dto: courses) {
			int coursecode = dto.getCoursecode();
			
			// 1. 현재 로그인한 유저가 이 코스를 좋아요했는지 여부 저장
			boolean liked = courseLikesService.isLikedByUser(currentUserCode, coursecode);
			dto.setLikedByCurrentUser(liked);
			
			// 2. 현재 코스에 든 이미지들 저장
			List<String> thumbnails = new ArrayList<String>();
			List<CourseRouteDto> route = courseRouteService.selectOneRoute(coursecode); // 코스 데이터
			for (CourseRouteDto routeDto: route) {
				int tourcode = routeDto.getTourcode(); // 루트의 각 여행지의 코드
				String photo = tourService.getData(tourcode).getFirstimage(); // 사진
				
				thumbnails.add(photo);
			}
			dto.setRoutePhotos(thumbnails); // dto에 저장
			
			// 3. 현재 코스에 대한 좋아요 개수 저장
			int likesCount = courseLikesService.getLikesCount(coursecode);
			dto.setTotalLikes(likesCount);
			
			// 4. 이 코스를 작성한 사람의 프로필 사진과 닉네임 저장
			int usercode = dto.getUsercode();
			MemberTableDto memberDto = memberTableService.getData(usercode);
			String writersPhoto = memberDto.getPhoto();
			// 빈 문자열이 아니라면, 앞에 prefix를 붙여준다
			if (writersPhoto != null)
				writersPhoto = PROFILE_PHOTO_PREFIX + writersPhoto;
			String nickname = memberDto.getNickname();
			dto.setWritersPhoto(writersPhoto);
			dto.setWritersNickname(nickname);
			
			// 5. 이 코스의 여행지 개수 저장
			dto.setTotalSpots(thumbnails.size());
			
			// 기타: briefcontent에서 띄어쓰기를 <br>로 바꿔주기
			String briefContent = dto.getBriefcontent();
			String replacedBrief = briefContent.replaceAll("\n", "<br>");
			dto.setBriefcontent(replacedBrief);
			
		}
		
		// model에 페이지 관련 정보와 코스 정보들 넘겨주기
		model.addAttribute("courses", courses);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("query", query);
		model.addAttribute("count", count);
		model.addAttribute("numstd", numstd);
		model.addAttribute("sortstd", sortstd);
		
		// url 뒤에 붙을 쿼리문을 currentPage를 제외하고 만들어주자
		StringJoiner params = new StringJoiner("&"); // 문자열 여러개를 &로 이어주는 클래스
		if (query.length() > 0) params.add("query=" + query);
		if (count > 0) params.add("count=" + count);
		if (numstd.length() > 0) params.add("numstd=" + numstd);
		if (sortstd.length() > 0) params.add("sortstd=" + sortstd);
		
		// 쿼리문 생성
		String urlParams = params.toString();
		if (urlParams.length() > 0) urlParams = "&" + urlParams;
		
		model.addAttribute("urlParams", urlParams);
		
		return "course/courselist";
	}
	
	@GetMapping("/course/add")
	public String add() {
		return "course/courseadd";
	}
	
	@GetMapping("/course/searchtour")
	@ResponseBody public List<TourDto> searchTourByQuery(@RequestParam String name, @RequestParam List<String> categories){
		return tourService.getSearchedListByQueries(name, categories);
	}
	
	@PostMapping("/course/addcourse")
	public String addCourse(@ModelAttribute CourseDto dto, 
			@RequestParam(defaultValue = "") String route1,
			@RequestParam(defaultValue = "") String route2,
			@RequestParam(defaultValue = "") String route3,
			@RequestParam(defaultValue = "") String route4,
			@RequestParam(defaultValue = "") String route5
			) {
		// course 정보 먼저 저장
		courseService.insertCourse(dto);
		
		// course_route 테이블 저장을 위한 배열
		List<String> route = new ArrayList<String>();
		route.add(route1);
		route.add(route2);
		route.add(route3);
		route.add(route4);
		route.add(route5);
		
		// 루트 저장
		for (int i = 0; i < route.size(); i++) {
			// 빈 문자가 온다면 그때부터 break
			if (route.get(i).equals(""))
				break;
			
			// course_route에 대한 dto
			CourseRouteDto routeDto = new CourseRouteDto();
			routeDto.setCoursecode(dto.getCoursecode()); // 앞서 저장된 코스의 코드 대입
			routeDto.setTourcode(Integer.parseInt(route.get(i))); // 코드를 int 타입으로 넣어주기
			routeDto.setRouteorder(i); // 그 코스에서의 인덱스로 삽입
			
			// course_route에도 insert해주기
			courseRouteService.insertCourseRoute(routeDto);
		}
		
		return "redirect:./list";
	}
	
	@GetMapping("/course/detail")
	public String detail(Model model, @RequestParam int coursecode, HttpSession session) {
		// 조회수 1 증가
		courseService.incrementReadcount(coursecode);
		
		CourseDto dto = courseService.selectOneCourse(coursecode); // 코스 기본 정보들
		
		// 현재 로그인한 유저 코드
		int currentUserCode = -1; // 로그인 상태가 아니라면 -1이 됨
		if (session.getAttribute("usercode") != null)
			currentUserCode = (int)session.getAttribute("usercode");
		
		// 1. 현재 로그인한 유저가 이 코스를 좋아요했는지 여부 저장
		boolean liked = courseLikesService.isLikedByUser(currentUserCode, coursecode);
		dto.setLikedByCurrentUser(liked);
		
		// 2. 현재 코스에 든 여행지의 정보들 저장
		List<TourDto> tourInfos = new ArrayList<TourDto>();
		List<CourseRouteDto> route = courseRouteService.selectOneRoute(coursecode); // 코스 데이터
		for (CourseRouteDto routeDto: route) {
			int tourcode = routeDto.getTourcode(); // 루트의 각 여행지의 코드
			TourDto tourDto = tourService.getData(tourcode); // 해당 여행지의 정보
			
			tourInfos.add(tourDto);
		}
		dto.setTourInfos(tourInfos); // dto에 저장
		
		// 3. 현재 코스에 대한 좋아요 개수 저장
		int likesCount = courseLikesService.getLikesCount(coursecode);
		dto.setTotalLikes(likesCount);
		
		// 4. 이 코스를 작성한 사람의 프로필 사진과 닉네임 저장
		int usercode = dto.getUsercode();
		MemberTableDto memberDto = memberTableService.getData(usercode);
		String writersPhoto = memberDto.getPhoto();
		// 빈 문자열이 아니라면, 앞에 prefix를 붙여준다
		if (writersPhoto != null)
			writersPhoto = PROFILE_PHOTO_PREFIX + writersPhoto;
		String nickname = memberDto.getNickname();
		dto.setWritersPhoto(writersPhoto);
		dto.setWritersNickname(nickname);
		
		// 5. 이 코스의 여행지 개수 저장
		dto.setTotalSpots(tourInfos.size());
		
		// 기타: briefcontent와 longdetail에서 띄어쓰기를 <br>로 바꿔주기
		String briefContent = dto.getBriefcontent();
		String replacedBrief = briefContent.replaceAll("\n", "<br>");
		dto.setBriefcontent(replacedBrief);
		
		String longDetail = dto.getLongdetail();
		String replacedLong = longDetail.replaceAll("\n", "<br>");
		dto.setLongdetail(replacedLong);
		
		model.addAttribute("dto", dto);
		
		return "course/coursedetail";
	}
	
	@GetMapping("/course/delete")
	public String delete(@RequestParam int coursecode) {
		// 삭제 진행
		courseService.deleteCourse(coursecode);
		
		return "redirect:./list";
	}
	
	@GetMapping("/course/revise")
	public String revise(Model model, @RequestParam int coursecode) {
		// 해당 코스의 정보들
		CourseDto dto = courseService.selectOneCourse(coursecode);
		// 각 코스의 여행지 정보들
		List<CourseRouteDto> routeDto = courseRouteService.selectOneRoute(coursecode);
		List<TourDto> tourDtos = new ArrayList<TourDto>();
		for (CourseRouteDto rdto: routeDto) {
			int tourcode = rdto.getTourcode();
			TourDto tdto = tourService.getData(tourcode);
			tourDtos.add(tdto);
		}
		dto.setTourInfos(tourDtos);
		
		model.addAttribute("dto", dto);
		
		return "course/courserevise";
	}
	
	@PostMapping("/course/revisecourse")
	public String reviseCourse(@ModelAttribute CourseDto dto, 
			@RequestParam(defaultValue = "") String route1,
			@RequestParam(defaultValue = "") String route2,
			@RequestParam(defaultValue = "") String route3,
			@RequestParam(defaultValue = "") String route4,
			@RequestParam(defaultValue = "") String route5
			) {
		
		// course의 다른 정보들 먼저 update
		courseService.updateCourse(dto);
		
		// 루트를 담은 배열
		List<String> newTour = new ArrayList<String>();
		if (!route1.equals("")) newTour.add(route1);
		if (!route2.equals("")) newTour.add(route2);
		if (!route3.equals("")) newTour.add(route3);
		if (!route4.equals("")) newTour.add(route4);
		if (!route5.equals("")) newTour.add(route5);
		
		// 여행지 루트 업데이트
		this.updateCourseRoute(newTour, dto.getCoursecode());
		
		return "redirect:./detail?coursecode=" + dto.getCoursecode();
	}
	
	// 코스 내 여행지를 수정하는 함수
	public void updateCourseRoute(List<String> newTourcodes, int coursecode) {
		// 기존 여행지 코스를 가져온다
		List<CourseRouteDto> originalTourDtos = courseRouteService.selectOneRoute(coursecode);
		
		int originIdx = 0; // 기존 여행지 배열을 순회하는 포인터(p1)
		int newIdx = 0; // 새로운 여행지코드 배열을 순회하는 포인터(p2)
		
		while (originIdx < originalTourDtos.size() && newIdx < newTourcodes.size()) {
			int originalCode = originalTourDtos.get(originIdx).getTourcode(),
					newCode = Integer.parseInt(newTourcodes.get(newIdx));
			
			// 기존 코스 정보에 대한 CourseRouteDto 객체를 만들어준다
			CourseRouteDto rdto = new CourseRouteDto();
			rdto.setCoursecode(coursecode);
			rdto.setTourcode(originalCode);
			rdto.setRouteorder(originIdx);
			
			// 1. 요소 일치하는 경우: 두 포인터 모두 이동시킴
			if (originalCode == newCode) {
				// 요소는 일치하지만 인덱스가 다른 경우 -> order 갱신
				if (originIdx != newIdx) {
					courseRouteService.updateSingleOrder(rdto, newIdx);
				}
				
				originIdx++;
				newIdx++;
				continue;
			}
			
			// 2. 요소가 불일치 -> 기존 요소 삭제 후, p1만 이동
			courseRouteService.deleteOneSpot(rdto);
			originIdx++;
		}
		
		// 순회하지 못한 기존 여행지가 남아있음 -> 나머지는 삭제한다
		for (int i = originIdx; i < originalTourDtos.size(); i++) {
			int originalCode = originalTourDtos.get(i).getTourcode();
			
			CourseRouteDto rdto = new CourseRouteDto();
			rdto.setCoursecode(coursecode);
			rdto.setTourcode(originalCode);
			rdto.setRouteorder(i);
			
			courseRouteService.deleteOneSpot(rdto);
		}
		
		// 순회하지 못한 새 여행지가 남아있음 -> 나머지는 삽입한다
		for (int i = newIdx; i < newTourcodes.size(); i++) {
			int newCode = Integer.parseInt(newTourcodes.get(i));
			
			CourseRouteDto rdto = new CourseRouteDto();
			rdto.setCoursecode(coursecode);
			rdto.setTourcode(newCode);
			rdto.setRouteorder(i);
			
			courseRouteService.insertCourseRoute(rdto);
		}
		
	}
	
	// direction 5 API를 활용하여 이동 거리를 반환하는 함수
	@GetMapping("/course/api/distance")
	@ResponseBody public double getDistanceAuto(@RequestParam String start, @RequestParam String goal,
			@RequestParam(defaultValue = "") String waypoints) {
		double distance = 0;
		
		try {
            // API 요청 URL
            String apiUrl = "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving";
            apiUrl += "?start=" + start; // 시작점
            apiUrl += "&goal=" + goal; // 목적지
            // 경유지 쿼리가 있으면 넣어준다
            if (!waypoints.equals(""))
            	apiUrl += "&waypoints=" + waypoints;
            // 옵션은 기본 옵션으로 넣어준다
            apiUrl += "&option=trafast";
            
            // API 키 및 헤더 값
            String clientId = "59skrsifwh";
            String clientSecret = "lymk68nGbD76pQkjn3t6t36vXGiKU1NgCtpqFICi";

            // HTTP 연결 설정
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            connection.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

            // 응답 코드 확인
            int responseCode = connection.getResponseCode();
            //System.out.println("Response Code: " + responseCode);

            // 응답 내용 읽기
            BufferedReader reader;
            if (responseCode == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            } else {
                reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
            }

            String line;
            StringBuilder response = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            // 응답 내용 출력
            //System.out.println("Response: " + response.toString());
            
            // JSON 형태로 뽑는다
            JSONObject ob = new JSONObject(response.toString());
            System.out.println(ob);
            distance = ob.getJSONObject("route").getJSONArray("trafast")
            		.getJSONObject(0).getJSONObject("summary")
            		.getInt("distance");
            
            // m -> km로 환산하고, 소수점 둘째자리까지 나타나도록 반올림해준다
            distance = distance / 1000.0;
            distance = Math.round(distance * 100) / 100.0;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		return distance;
	}
	
	// direction 5 API를 활용하여 경로의 좌표들을 반환하는 함수
	@GetMapping("/course/api/route")
	@ResponseBody public List<List<Double>> getRouteByAPI(@RequestParam String start, @RequestParam String goal,
			@RequestParam(defaultValue = "") String waypoints) {
		List<List<Double>> coords = new ArrayList<List<Double>>();
		
		try {
            // API 요청 URL
            String apiUrl = "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving";
            apiUrl += "?start=" + start; // 시작점
            apiUrl += "&goal=" + goal; // 목적지
            // 경유지 쿼리가 있으면 넣어준다
            if (!waypoints.equals(""))
            	apiUrl += "&waypoints=" + waypoints;
            // 옵션은 기본 옵션으로 넣어준다
            apiUrl += "&option=trafast";
            
            // API 키 및 헤더 값
            String clientId = "59skrsifwh";
            String clientSecret = "lymk68nGbD76pQkjn3t6t36vXGiKU1NgCtpqFICi";
	            // HTTP 연결 설정
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            connection.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
	            // 응답 코드 확인
            int responseCode = connection.getResponseCode();
            //System.out.println("Response Code: " + responseCode);
	            // 응답 내용 읽기
            BufferedReader reader;
            if (responseCode == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            } else {
                reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
            }
	            String line;
            StringBuilder response = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();
	            // 응답 내용 출력
            //System.out.println("Response: " + response.toString());
            
            // JSON 형태로 뽑는다
            JSONObject data = new JSONObject(response.toString());
            // path를 뽑는다
            JSONArray routePath = data.getJSONObject("route").getJSONArray("trafast").getJSONObject(0)
            		.getJSONArray("path");
            
            // 각 path를 내 이차원 배열에 넣어준다
            for (int i = 0; i < routePath.length(); i++) {
            	List<Double> currentCoord = new ArrayList<Double>();
            	double mapx = routePath.getJSONArray(i).getDouble(0);
            	double mapy = routePath.getJSONArray(i).getDouble(1);
            	currentCoord.add(mapx);
            	currentCoord.add(mapy);
            	
            	coords.add(currentCoord);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		return coords;
	}
}
