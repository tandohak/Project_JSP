package Project_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_JSP.dto.Client;
import Project_JSP.dto.ClientGrade;
import Project_JSP.mvc.controller.CommandHandler;
import Project_JSP.service.ClientDaoService;

public class LoginHandler implements CommandHandler {
	private static final String LOGIN_VIEW = "/WEB-INF/view/login/loginForm.jsp";
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			req.removeAttribute("noMember");
			return LOGIN_VIEW;
		}else if(req.getMethod().equalsIgnoreCase("post")){
		
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			String clientGrade = req.getParameter("clientGrade");
			String name = req.getParameter("name1")+req.getParameter("name2");
			
			Client client = new Client();
			client.setId(id);
		
			if(clientGrade.equals("MEMBER")){
				client.setClientGrade(ClientGrade.MEMBER);
				client.setPw(pw);
			}else if(clientGrade.equals("NONMEMBER")){
				client.setClientGrade(ClientGrade.NONMEMBER);
				client.setNameEn(name);
				client.setNameKo(name);
			}
		
			ClientDaoService service = ClientDaoService.getInstance();
		
			if(clientGrade.equals("MEMBER")){
				Client cId = service.selectClientId(client);
				
				req.removeAttribute("noMember");
				if(cId==null){
					req.setAttribute("error1","* 회원이 아닙니다. 아이디를 확인해주세요");
					return LOGIN_VIEW;
				}else{
					Client cPw = service.selectClientPw(client);
					 if(cPw==null){
						req.setAttribute("error3", "*비밀번호를 확인해주세요");
						return LOGIN_VIEW;
					}
					 
					 res.sendRedirect("index.jsp");
					 return null;
					 
				}
				
			}
	
			
			if(clientGrade.equals("NONMEMBER")){
				req.setAttribute("noMember", "checked");
				Client cId = service.selectClientId(client);
				
				if(cId==null){
					req.setAttribute("error2","*예약한 기록이 없습니다.");
					return LOGIN_VIEW;
				}else{
					Client cName = service.selectClientName(client);
					if(cName ==null){
						req.setAttribute("error4", "*이름을 확인해주세요");
						return LOGIN_VIEW;
					}
					
					 res.sendRedirect("index.jsp");
					 return null;
				}
					
				
			}
			/*if(cId==null&&clientGrade.equals("NONMEMBER")){
				System.out.println("id없음");
				req.setAttribute("noMember", "checked");
				req.setAttribute("error2","*예약한 기록이 없습니다.");
				return LOGIN_VIEW;
			}else{
				Client cName = service.selectClientName(client);
				System.out.println(cName);
				if(cName ==null&&clientGrade.equals("NONMEMBER")){
					req.setAttribute("noMember", "checked");
					req.setAttribute("error4", "*이름을 확인해주세요");
					return LOGIN_VIEW;
				}
			}*/
			return LOGIN_VIEW;
	
		}
		return null;
	}

}
