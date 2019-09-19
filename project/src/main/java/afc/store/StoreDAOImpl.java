package afc.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("store")
public class StoreDAOImpl implements StoreDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<StoreDTO> storelist() {
		return sqlSession.selectList("afc.store.selectall");
	}
	@Override
	public List<OrderDTO> storehistory(){
		return sqlSession.selectList("afc.store.history");
	}

	@Override
	public StoreDTO read(String code) {
		return sqlSession.selectOne("afc.store.read", code);
	}

	@Override
	public List<BoardDTO> boardlist(String code) {
		return sqlSession.selectList("afc.store.boardlist", code);
	}

	@Override
	public int boarddelete(String review_no) {
		return sqlSession.delete("afc.store.boarddel",review_no);
	}

	@Override
	public int boardinsert(BoardDTO board) {
		return sqlSession.insert("afc.store.insert", board);
	}

	@Override
	public int storeinsert(StoreDTO store) {
		return sqlSession.insert("afc.store.storeinsert", store);
	}

	@Override
	public int storedel(String code) {
		return sqlSession.delete("afc.store.storedel", code);
	}

	@Override
	public int storeupdate(StoreDTO store) {
		return sqlSession.update("afc.store.storeupdate", store);
	}

	@Override
	public int orderinsert(OrderDTO order) {
		return sqlSession.insert("afc.store.orderinsert", order);
	}

	@Override
	public List<StoreDTO> listAll(int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("afc.store.listAll", map);
	}

	@Override
	public int countArticle(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		
		return sqlSession.selectOne("afc.store.countArticle", map);
	}

	@Override
	public List<StoreDTO> categorySearch(String category) {
		
		return sqlSession.selectList("afc.store.categorysearch", category);
	}
	@Override
	public OrderDTO orderdetail(String or_num) {
		return sqlSession.selectOne("afc.store.orderdetail", or_num);
	}

}
