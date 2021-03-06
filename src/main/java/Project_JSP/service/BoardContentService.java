package Project_JSP.service;

import org.apache.ibatis.session.SqlSession;

import Project_JSP.dao.BoardContentDao;
import Project_JSP.dao.BoardDao;
import Project_JSP.dto.Board;
import Project_JSP.dto.BoardContent;
import Project_JSP.mvc.util.MySqlSessionFactory;

public class BoardContentService {
	private static final BoardContentService instance = new BoardContentService();
	
	public static BoardContentService getInstance() {
		return instance;
	}
	
	private BoardContentService() {}

	/*public int insert(BoardContent content){
		SqlSession session = MySqlSessionFactory.openSession();
		try {
			BoardContentDao dao = session.getMapper(BoardContentDao.class);
			dao.insert(content);
			session.commit();
			return 0;
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return -1;		
	};*/
	public BoardContent findByNum(int boardNum){
		try(SqlSession session = MySqlSessionFactory.openSession()){
			BoardContentDao dao = session.getMapper(BoardContentDao.class);
			
			return dao.findByNum(boardNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	};
/*	public int deletByNum(int boardNum){
		SqlSession session = MySqlSessionFactory.openSession();
		try{
			BoardContentDao dao = session.getMapper(BoardContentDao.class);

			int result=dao.deletByNum(boardNum);
			System.out.println("deletcontent"+result);
			if(result<=0){
				return -1;
			}
			session.commit();
			return result;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			return -1;
		}finally {
			session.close();
		}
	};*/
	public int update(Board board,BoardContent content){
		SqlSession session = MySqlSessionFactory.openSession();
		try{
			BoardContentDao contentDao = session.getMapper(BoardContentDao.class);
			BoardDao dao = session.getMapper(BoardDao.class);
			dao.updateBoard(board);
			contentDao.update(content);
			session.commit();
			return 0;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			return -1;
		}finally {
			session.close();
		}
	};
}
