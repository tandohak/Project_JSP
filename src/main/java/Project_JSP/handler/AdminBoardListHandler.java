package Project_JSP.handler;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_JSP.dto.Board;
import Project_JSP.mvc.controller.CommandHandler;
import Project_JSP.service.BoardService;

public class AdminBoardListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			BoardService service = BoardService.getInstance();
			List<Board> list = service.selcetAllBoard();
			HashMap<String, Object> map = new HashMap<>();
			if (list.size() == 0) {
				req.setAttribute("error", "123");
			}
			req.setAttribute("change", 1);
			
			int pageNum = list.size()/15;
			
			req.setAttribute("page", pageNum);
			
			if(req.getParameter("page_num") != null){
				pageNum = Integer.parseInt(req.getParameter("page_num"));
			}else{
				pageNum = 0;
			}


			map.put("num1",pageNum*15 );
			map.put("num2",15);
			
			
			list = service.selcetAllLimitBoard(map);
		
			if (list.size() == 0) {
				req.setAttribute("error", "123");
			}
			req.setAttribute("boardList", list);
			return "/WEB-INF/view/adminpage/adminpage_board.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			BoardService service = BoardService.getInstance();
			Board board = new Board();
			HashMap<String, Object> map = new HashMap<>();
			List<Board> list=null;
			req.setAttribute("change", 2);
			
			
			String search = req.getParameter("search");
			if(search.equals("")){
				req.setAttribute("error", "123");
				req.setAttribute("boardList", list);
				return "/WEB-INF/view/adminpage/adminpage_board.jsp";
			}
			
			
			
			
			switch (req.getParameter("search_type")) {
			case "작성자":
				board.setName("%"+search+"%");
				list = service.findByNameBoard(board); 			
				break;

			case "제목":
				board.setTitle("%"+search+"%");
				list = service.findByTitleBoard(board);

				break;
			case "아이디":
				board.setId("%"+search+"%");
				list = service.findByIdBoard(board);
			
				break;
				
			default:
				break;
			}
			    
			
			
			
			if (list.size() == 0) {
				
				req.setAttribute("error", "123");
			}
			req.setAttribute("boardList", list);
			return "/WEB-INF/view/adminpage/adminpage_board.jsp";
		}

		return null;
	}

}
