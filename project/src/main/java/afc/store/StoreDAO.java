package afc.store;

import java.util.List;

public interface StoreDAO {
	
	List<StoreDTO> storelist();
	
	List<OrderDTO> storehistory();
	
	List<StoreDTO> categorySearch(String category);
	
	StoreDTO read(String code);
	
	OrderDTO orderdetail(String or_num);
	
	List<BoardDTO> boardlist(String code);	
	
	int boarddelete(String review_no);
	
	int boardinsert(BoardDTO board);
	
	int storeinsert(StoreDTO store);
	
	int storedel(String code);
	
	int storeupdate(StoreDTO store);
	
	int orderinsert(OrderDTO order);
	
	List<StoreDTO> listAll(int start, int end, String searchOption, String keyword);
	
	int countArticle(String searchOption, String keyword);


}
