package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardFreeCommentDto {
	private int freecommentcode;
	private int freeboardcode;
	private int usercode;
	private String content;
	private int relevel;
	private int regroup;
	private int restep;
	private boolean isdeleted;
	private Timestamp registereddate;
}
