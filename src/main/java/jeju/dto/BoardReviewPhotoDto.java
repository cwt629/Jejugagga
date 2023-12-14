package jeju.dto;


import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BoardReviewPhotoDto {
	private int reviewphotocode;
	private int reviewcode;
	private int tourcode;
	private String photo;
}
