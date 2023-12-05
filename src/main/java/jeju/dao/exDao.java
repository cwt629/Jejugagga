package jeju.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class exDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="jeju.dao.exDao.";

}
