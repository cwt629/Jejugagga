package jeju.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeju.dto.CourseDto;
import jeju.dto.MemberTableDto;

@Repository
public class MemberTableDao {
	@Autowired
	private SqlSession session;
	private String nameSpace="jeju.dao.MemberTableDao.";

	public void insertMember(MemberTableDto dto)
	{
		session.insert(nameSpace+"insertMember",dto);
	}
	
	public boolean isLoginCheck(String id,String password)
	{
		Map<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		
		int n=session.selectOne(nameSpace+"loginCheck",map);
		return n==0?false:true;
	}
	
	public MemberTableDto getData(String id)
	{
		return session.selectOne(nameSpace+"selectDataById",id);
	}
	
	public MemberTableDto getData(int usercode)
	{
		return session.selectOne(nameSpace+"selectDataByNum",usercode);
	}
	
	public int searchIdCount(String id)
	{
		return session.selectOne(nameSpace+"searchIdCount",id);
	}
	
	public void pwdUpdate(MemberTableDto dto)
	{
		session.update(nameSpace+"pwdTempUpdate",dto);
	}
	
	public int pwdCheck(MemberTableDto dto)
	{
		return session.selectOne(nameSpace+"pwdCheck",dto);
	}
	
	public List<MemberTableDto> selectAllmem10Bydesc() {
		return session.selectList(nameSpace + "selectAllmemBydesc");
	}
	
	public String selectGetMail(MemberTableDto dto)
	{
		return session.selectOne(nameSpace+"selectGetMail",dto);
	}
	
	public void updateMemberPhoto(String photo, String myid) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("photo", photo);
		map.put("id", myid);
		session.update(nameSpace + "updatePhotoByNum", map);
	}
	public void deleteMemberbyID(String id)
	{
		session.delete(nameSpace + "deleteMemberbyID", id);
	}
}
