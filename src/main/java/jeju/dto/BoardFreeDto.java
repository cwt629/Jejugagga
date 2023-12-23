package jeju.dto;

import lombok.Data;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

@Data
public class BoardFreeDto {
	private int freeboardcode;
	private int usercode;
	private String title;
	private String content;
	private int viewcount;
	private String photo;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp registereddate;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp modifieddate;

	// 게시판 유저에 관한 닉네임불러오기
	private String writersNickname;
}
