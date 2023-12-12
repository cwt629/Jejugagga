package jeju.dto;

import java.sql.Timestamp;
import java.util.List;

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
	// 이하는 DB 정보 외에 추가적으로 필요한 정보들
	private boolean likedByCurrentUser;
	private List<String> routePhotos;
	private int totalLikes;
	private String writersPhoto;
	private String writersNickname;
}
