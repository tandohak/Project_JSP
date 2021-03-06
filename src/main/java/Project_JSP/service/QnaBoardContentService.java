package Project_JSP.service;

import org.apache.ibatis.session.SqlSession;

import Project_JSP.dao.QnaBoardContentDao;
import Project_JSP.dao.QnaBoardDao;
import Project_JSP.dto.QnaBoardContent;
import Project_JSP.mvc.util.MySqlSessionFactory;

public class QnaBoardContentService implements QnaBoardContentDao{
	private static final QnaBoardContentService instance = new QnaBoardContentService();
	
	
	public static QnaBoardContentService getInstance() {
		return instance;
	}

	private QnaBoardContentService() {
		super();
	}

	@Override
	public void insertQnaBoardContent(QnaBoardContent qnaContent) {
		
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			QnaBoardContentDao dao = session.getMapper(QnaBoardContentDao.class);
			dao.insertQnaBoardContent(qnaContent);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public QnaBoardContent selectQnaBoardByNum(QnaBoardContent qnaContent) {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			QnaBoardContentDao dao = session.getMapper(QnaBoardContentDao.class);
			return dao.selectQnaBoardByNum(qnaContent);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void deleteQnaBoardContentByQnaNum(QnaBoardContent qnaContent) {
		try (SqlSession session = MySqlSessionFactory.openSession()) {
			QnaBoardContentDao dao = session.getMapper(QnaBoardContentDao.class);
			dao.deleteQnaBoardContentByQnaNum(qnaContent);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	
}
