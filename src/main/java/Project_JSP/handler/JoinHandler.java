package Project_JSP.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_JSP.dto.Client;
import Project_JSP.dto.ClientGrade;
import Project_JSP.mvc.controller.CommandHandler;
import Project_JSP.service.ClientDaoService;

public class JoinHandler implements CommandHandler {
	private static final String JOIN_VIEW = "/WEB-INF/view/join/joinForm.jsp";
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return JOIN_VIEW;
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
			String year = req.getParameter("birth_y");
			String month =  req.getParameter("birth_m");
			String date = req.getParameter("birth_d");
			
			String newDate = year+"-"+month+"-"+date;
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			
			
			String nameKo = req.getParameter("nameKo");
			String nameEn = req.getParameter("nameEn1").toUpperCase()+" "+req.getParameter("nameEn2").toUpperCase();
			 Date birth = df.parse(newDate);
			String email = req.getParameter("email1")+"@"+req.getParameter("email2");
			String phone = req.getParameter("p1")+req.getParameter("p2")+req.getParameter("p3");
			String home = req.getParameter("t1")+req.getParameter("t2")+req.getParameter("t3");
			String address = req.getParameter("addr1")+"/"+req.getParameter("addr2")+"/"+req.getParameter("addr3");
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			ClientDaoService service = ClientDaoService.getInstance();
			service.insertClient(new Client(id, 
											pw, 
											nameKo, 
											nameEn, 
											birth, 
											email, 
											phone, 
											home, 
											address, 
											ClientGrade.MEMBER));
			
			req.setAttribute("name", nameEn);
			req.setAttribute("id", id);
		return "/WEB-INF/view/join/joinSuccessForm.jsp";	
		}
		return null;
	}

}
