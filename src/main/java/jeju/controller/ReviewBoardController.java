package jeju.controller;

import javax.servlet.http.HttpSession;
import jeju.dto.BoardReviewDto;
import jeju.dto.BoardReviewPhotoDto;
import jeju.service.ReviewBoardService;
import jeju.storage.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ReviewBoardController {
	private final ReviewBoardService reviewBoardService;
	private final NcpObjectStorageService storageService;

	@Autowired
	public ReviewBoardController(ReviewBoardService reviewBoardService, NcpObjectStorageService storageService) {
		this.reviewBoardService = reviewBoardService;
		this.storageService = storageService;
	}

	@GetMapping("/community/review/write")
	public String reviewwrite() {
		return "community/review/reviewwrite";
	}

	@GetMapping("/community/review/list")
	public String reviewList(Model model, HttpSession session,
							 @RequestParam(defaultValue = "1") int page) {
		// 현재 로그인한 사용자가 'root'인지 확인
		String currentUserId = (String) session.getAttribute("id");
		boolean isRootUser = "root".equals(currentUserId);

		Map<String, Object> pageData = reviewBoardService.getReviewsPage(page);

		List<BoardReviewDto> reviews = (List<BoardReviewDto>) pageData.get("reviews");
		Map<Integer, String> photos = new HashMap<>();
		Map<Integer, String> nicknames = new HashMap<>();

		for (BoardReviewDto review : reviews) {
			photos.put(review.getReviewcode(), reviewBoardService.getLatestPhotoByReviewcode(review.getReviewcode()));
			nicknames.put(review.getUsercode(), reviewBoardService.getNicknameByUsercode(review.getUsercode()));
		}

		// 모델에 속성을 추가합니다.
		model.addAttribute("isRootUser", isRootUser);
		model.addAttribute("reviews", reviews);
		model.addAttribute("photos", photos);
		model.addAttribute("nicknames", nicknames);
		model.addAllAttributes(pageData); // 페이징 정보를 모델에 추가합니다.

		return "community/review/reviewlist";
	}

	@PostMapping("/submitReview")
	@ResponseBody
	public ResponseEntity<?> submitReview(@RequestBody BoardReviewDto boardReviewDto, HttpSession session) {
		Integer usercode = (Integer) session.getAttribute("usercode");
		if (usercode == null) {
			return ResponseEntity
					.status(HttpStatus.UNAUTHORIZED)
					.contentType(MediaType.APPLICATION_JSON)
					.body("{\"error\": \"사용자가 로그인하지 않았습니다.\"}");
		}
		boardReviewDto.setUsercode(usercode);

		try {
			reviewBoardService.saveReview(boardReviewDto);
			int reviewcode = boardReviewDto.getReviewcode();
			return ResponseEntity
					.ok()
					.contentType(MediaType.APPLICATION_JSON)
					.body("{\"message\": \"리뷰가 성공적으로 제출되었습니다.\", \"reviewcode\": " + reviewcode + "}");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.contentType(MediaType.APPLICATION_JSON)
					.body("{\"error\": \"리뷰 제출에 실패했습니다.\"}");
		}
	}

	@PostMapping("/submitReviewPhotos")
	public ResponseEntity<?> submitReviewPhotos(
			@RequestParam("photo") List<MultipartFile> photoFiles,
			@RequestParam("reviewcode") int reviewcode) {
		try {
			// 버킷 이름과 폴더 이름을 설정
			String bucketName = "jejugagga-cwt";
			String bucketFolder = "review";

			int tourcode = reviewBoardService.getTourcodeByReviewcode(reviewcode);

			for (MultipartFile file : photoFiles) {
				String imageUrl = storageService.reviewUploadFile(bucketName, bucketFolder, file);

				BoardReviewPhotoDto boardReviewPhotoDto = new BoardReviewPhotoDto();
				boardReviewPhotoDto.setReviewcode(reviewcode);
				boardReviewPhotoDto.setTourcode(tourcode);
				boardReviewPhotoDto.setPhoto(imageUrl);
				reviewBoardService.saveReviewPhoto(boardReviewPhotoDto);
			}

			return ResponseEntity.ok("사진이 성공적으로 업로드되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("사진 업로드에 실패했습니다.");
		}
	}

	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<?> deleteReview(@RequestParam("reviewId") int reviewId, HttpSession session) {
		String currentUserId = (String) session.getAttribute("id");
		if (!"root".equals(currentUserId)) {
			return new ResponseEntity<>("Unauthorized", HttpStatus.UNAUTHORIZED);
		}

		try {
			reviewBoardService.deleteReview(reviewId);
			return new ResponseEntity<>("Review deleted successfully", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}

