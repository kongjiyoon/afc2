package afc.store;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface StoreService {

	List<StoreDTO> storelist(String category);
	StoreDTO read(String code);
	OrderDTO orderdetail(String or_num);
	
	List<OrderDTO> storehistory();
	
	List<BoardDTO> boardlist(String code);
	
	int boarddelete(String review_no);
	int boardinsert(BoardDTO board);
	
	int storeinsert(StoreDTO store);
	
	void upload(MultipartFile file, String path, String fileName);
	
	int storedel(String code);
	int storeupdate(StoreDTO store);
	
	int orderinsert(OrderDTO order);
	//�Խ��� ��ü��� ����¡
	List<StoreDTO> listAll(int start, int end, String serchOption, String keyword);
	
	
	int countArticle(String searchOption,String keyword);
}
