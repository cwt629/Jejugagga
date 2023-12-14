package jeju.controller;

import jeju.dto.BoardReviewDto;
import jeju.dto.BoardReviewPhotoDto;
import jeju.service.ReviewBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ReviewBoardController {
	private final ReviewBoardService reviewBoardService;

	@Autowired
	public ReviewBoardController(ReviewBoardService reviewBoardService) {
		this.reviewBoardService = reviewBoardService;
	}

	@GetMapping("/community/review/write")
	public String reviewwrite() {
		return "community/review/reviewwrite";
	}

	@GetMapping("/community/review/list")
	public String reviewList(Model model) {
		List<BoardReviewDto> reviews = reviewBoardService.getAllReviews();
		Map<Integer, String> photos = new HashMap<>();
		Map<Integer, String> nicknames = new HashMap<>();

		for (BoardReviewDto review : reviews) {
			photos.put(review.getReviewcode(), reviewBoardService.getPhotoByReviewcode(review.getReviewcode()));
			nicknames.put(review.getUsercode(), reviewBoardService.getNicknameByUsercode(review.getUsercode()));
		}

		model.addAttribute("reviews", reviews);
		model.addAttribute("photos", photos);
		model.addAttribute("nicknames", nicknames);

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
			int tourcode = reviewBoardService.getTourcodeByReviewcode(reviewcode);

			for (MultipartFile file : photoFiles) {
				String filename = file.getOriginalFilename();
				BoardReviewPhotoDto boardReviewPhotoDto = new BoardReviewPhotoDto();
				boardReviewPhotoDto.setPhoto(filename);
				boardReviewPhotoDto.setReviewcode(reviewcode);
				boardReviewPhotoDto.setTourcode(tourcode);

				reviewBoardService.submitReviewPhotos(boardReviewPhotoDto);
			}

			return ResponseEntity.ok("사진이 성공적으로 업로드되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("사진 업로드에 실패했습니다.");
		}
	}



}

