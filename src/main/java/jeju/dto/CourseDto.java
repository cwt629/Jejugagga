package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CourseDto {
	private int coursecode;
	private int usercode;
	private String name;
	private int spendingtime;
	private String timestandard;
	private double distance;
	private String briefcontent;
	private String longdetail;
	private Timestamp registereddate;
	private int readcount;
}
