package jeju.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardFreeDto {
	private int freeboardcode;
	private int usercode;
	private String title;
	private String content;
	private int viewcount;
	private String photo;
	private Timestamp registereddate;
	private Timestamp modifieddate;

	// 게시판 유저에 관한 닉네임불러오기
	private String writersNickname;
}
