package jeju.dto;

import lombok.Data;

@Data
public class TourDetailDto {
	private int detailcode;
	private int tourcode;
	private int serialnum;
	private String infoname;
	private String infotext;
}
