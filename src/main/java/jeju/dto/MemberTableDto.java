package jeju.dto;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberTableDto {
	private int usercode;
	private String id;
	private String nickname;
	private String password;
	private String photo;
	private String name;
	private String phone;
	private String email;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String gender;
	private String type;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp registereddate;

}
