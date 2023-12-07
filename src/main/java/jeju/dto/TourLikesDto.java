package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TourLikesDto {
	private int tourlikecode;
	private int tourcode;
	private int usercode;
	private Timestamp registereddate ;
}
