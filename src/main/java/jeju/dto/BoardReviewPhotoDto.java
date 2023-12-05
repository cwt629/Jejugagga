package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardReviewPhotoDto {
	private int reviewphotocode;
	private int reviewcode;
	private int tourcode;
	private String photo;
}
