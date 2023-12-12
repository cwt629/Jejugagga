package jeju.service;


import org.springframework.stereotype.Service;

import jeju.dao.MemberTableDao;
import jeju.dto.MemberTableDto;
import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class MemberTableService {
	
	private MemberTableDao memberTableDao;
	
	public MemberTableDto getData(int num)
	{
		return memberTableDao.getData(num);
	}
	
	public void pwdUpdate(MemberTableDto dto)
	{
		memberTableDao.pwdUpdate(dto);
	}
	
}
