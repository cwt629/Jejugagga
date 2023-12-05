package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CourseLikesDto {
	private int courselikecode;
	private int usercode;
	private int coursecode;
	private Timestamp registereddate;

}
