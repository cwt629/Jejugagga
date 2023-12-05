package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardFreeCommentDto {
	private int courseroutecode;
	private int coursecode;
	private int tourcode;
	private int routeorder;
	private Timestamp registereddate;
}
