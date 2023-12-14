package jeju.dto;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TourDto {
	private int tourcode;
	private int contentid;
	private int contenttype;
	private int sigungucode;
	private String title;
	private double mapx;
	private double mapy;
	private String firstimage;
	private String firstimage2;
	private String zipcode;
	private String overview;
	private String homepage;
	private String addr1;
	private String infocenter;
	private String restdate;
	private String expguide;
	private String usetime;
	private String parking;
	private String chkbabycarriage;
	private String chkpet;
	private String chkcreditcard;
	private String usefee;
	private String parkingfee;
	private String infocenterculture;
	private String usetimeculture;
	private String restdateculture;
	private String parkingculture;
	private String chkbabycarriageculture;
	private String chkpetculture;
	private String chkcreditcardculture;
	private String firstmenu;
	private String treatmenu;
	private String smoking;
	private String packing;
	private String infocenterfood;
	private String parkingfood;
	private String opentimefood;
	private String restdatefood;
	private String chkcreditcardfood;
	private String reservationfood;
	private String sponsor1;
	private String sponsor1tel;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp eventenddate;
	private String playtime;
	private String eventplace;
	private String eventhomepage;
	private String agelimit;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp eventstartdate;
	private String usetimefestival;
	private String spendtimefestival;


}
