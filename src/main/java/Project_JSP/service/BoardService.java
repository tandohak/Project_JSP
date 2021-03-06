package Project_JSP.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Project_JSP.dao.BoardContentDao;
import Project_JSP.dao.BoardDao;
import Project_JSP.dto.Board;
import Project_JSP.dto.BoardContent;
import Project_JSP.mvc.util.MySqlSessionFactory;

public class BoardService {
	private static final BoardService instance = new BoardService();

	private BoardService() {
	}

	public static BoardService getInstance() {
		return instance;
	}

	public List<Board> selcetAllLimitBoard(HashMap<String, Object> map) {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			BoardDao dao = session.getMapper(BoardDao.class);

			return dao.selcetAllLimitBoard(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Board findByNumBoard(Board board) {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			BoardDao dao = session.getMapper(BoardDao.class);

			return dao.findByNumBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	};

	public List<Board> selcetAllBoard() {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			BoardDao dao = session.getMapper(BoardDao.class);

			return dao.selcetAllBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	};

	public List<Board> findByNameBoard(Board board) {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			BoardDao dao = session.getMapper(BoardDao.class);

			return dao.findByNameBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Board> findByTitleBoard(Board board) {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			BoardDao dao = session.getMapper(BoardDao.class);

			return dao.findByTitleBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	};
	public List<Board> findByIdBoard(Board board) {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			BoardDao dao = session.getMapper(BoardDao.class);

			return dao.findByIdBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	};

	public List<Board> findByNameLimitBoard(HashMap<String, Object> map) {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			BoardDao dao = session.getMapper(BoardDao.class);

			return dao.findByNameLimitBoard(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Board> findByTitleLimitBoard(HashMap<String, Object> map) {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			BoardDao dao = session.getMapper(BoardDao.class);

			return dao.findByTitleLimitBoard(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int insertBoard(Board board, BoardContent content) {
		SqlSession session = MySqlSessionFactory.openSession();
		try {
			BoardDao dao = session.getMapper(BoardDao.class);
			BoardContentDao contentDao = session.getMapper(BoardContentDao.class);

			int yes = dao.insertBoard(board);
			if (yes <= 0) {
				return -1;
			}

			int lastId = dao.lastId();
			board.setNum(lastId);
			content.setNum(board);

			int result = contentDao.insert(content);
			if (result <= 0) {
				return -1;
			}

			session.commit();
			return yes;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return -1;

	}

	public int deletByNumBoard(Board board) {
		SqlSession session = MySqlSessionFactory.openSession();
		try {
			BoardDao dao = session.getMapper(BoardDao.class);
			BoardContentDao contentDao = session.getMapper(BoardContentDao.class);

			int result = contentDao.deletByNum(board.getNum());

			/* System.out.println("�궘�젣"+yes); */

			if (result <= 0) {
				return -1;
			}
			int yes = dao.deletByNumBoard(board);
			if (yes <= 0) {
				return -1;
			}
			session.commit();
			return yes;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return -1;

	}

	/*
	 * dao.insertEvent(event); System.out.println("insertEvent"); int newEventId
	 * = dao.selectLastInsert(); System.out.println(newEventId);
	 * 
	 * if(newEventId < 0){ System.out.println(log + "insert event fail"); return
	 * -2; }
	 * 
	 * EventContent eventContent = new EventContent(newEventId, content);
	 * 
	 * int successContent = contentDao.insertEventContent(eventContent);
	 * System.out.println(successContent);
	 * 
	 * if(successContent <0){ System.out.println(log +
	 * "insert eventContent fail"); return -3; }
	 * 
	 * session.commit(); } catch (Exception e) { session.rollback();
	 * e.printStackTrace(); }finally { session.close(); }
	 */

	public int updateBoard(Board board) {
		SqlSession session = MySqlSessionFactory.openSession();
		try {
			BoardDao dao = session.getMapper(BoardDao.class);
			
			dao.updateBoard(board);
			
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return 0;

	}

}
