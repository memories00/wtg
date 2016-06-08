package map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class company {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/companyLogin.nhn")
	public String companyLogin(HttpServletRequest request)
	{
		return "str";
	
	}

}
