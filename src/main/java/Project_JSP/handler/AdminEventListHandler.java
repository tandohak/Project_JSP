package Project_JSP.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_JSP.dto.Event;
import Project_JSP.mvc.controller.CommandHandler;
import Project_JSP.service.EventService;

public class AdminEventListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		EventService service = EventService.getInstance();
		
		List<Event> list = service.selectListEvent();
		
		if(list.size() == 0){
			req.setAttribute("exist","현재 진행중인 이벤트가 없습니다.");
			return "/WEB-INF/view/adminpage/adminpage_eventList.jsp";
		}
		
		req.setAttribute("list", list);
		return "/WEB-INF/view/adminpage/adminpage_eventList.jsp";
	}

}
