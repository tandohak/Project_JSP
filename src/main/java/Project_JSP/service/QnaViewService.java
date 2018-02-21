package Project_JSP.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Project_JSP.dao.QnaViewDao;
import Project_JSP.dto.QnaView;
import Project_JSP.mvc.util.MySqlSessionFactory;

public class QnaViewService implements QnaViewDao {
	private static final QnaViewService instance = new QnaViewService();
		
	public static QnaViewService getInstance() {
		return instance;
	}

	private QnaViewService() {
		// TODO Auto-generated constructor stub
	}


	@Override
	public List<QnaView> selectQnaViewAll(QnaView qnaView) {
		try(SqlSession session = MySqlSessionFactory.openSession()){
			QnaViewDao dao = session.getMapper(QnaViewDao.class);
			return dao.selectQnaViewAll(qnaView);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<QnaView> selectAll() {
		try(SqlSession session = MySqlSessionFactory.openSession()){
			QnaViewDao dao = session.getMapper(QnaViewDao.class);
			return dao.selectAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<QnaView> selectNotNullQnaView() {
		try(SqlSession session = MySqlSessionFactory.openSession()){
			QnaViewDao dao = session.getMapper(QnaViewDao.class);
			return dao.selectNotNullQnaView();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<QnaView> selectNullQnaView() {
		try(SqlSession session = MySqlSessionFactory.openSession()){
			QnaViewDao dao = session.getMapper(QnaViewDao.class);
			return dao.selectNullQnaView();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


}
