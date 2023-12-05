package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CourseDto {
	private int usercode;
	private String id;
	private String nickname;
	private String password;
	private String photo;
	private String name;
	private String phone;
	private String email;
	private Timestamp birth;
	private String gender;
	private String type;
	private Timestamp registereddate;

}
