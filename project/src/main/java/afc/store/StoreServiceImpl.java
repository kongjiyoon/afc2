package afc.store;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	@Qualifier("store")
	StoreDAO dao;
	FileOutputStream out;
	

	@Override
	public List<StoreDTO> storelist(String category) {
		List<StoreDTO> storelist = null;
		if(category!=null) {
			if(category.equals("all")) {
				storelist = dao.storelist();
			}else {
				storelist = dao.categorySearch(category);
			}
		}
		
		
		return storelist;
	}


	@Override
	public StoreDTO read(String code) {
		return dao.read(code);
	}


	@Override
	public List<BoardDTO> boardlist(String code) {		 
		return dao.boardlist(code);
	}


	@Override
	public int boarddelete(String review_no) {
		return dao.boarddelete(review_no);
	}


	@Override
	public int boardinsert(BoardDTO board) {
		System.out.println("���� ���� �߰�");
		return dao.boardinsert(board);
	}


	@Override
	public int storeinsert(StoreDTO store) {
		return dao.storeinsert(store);
	}


	@Override
	public void upload(MultipartFile file, String path, String fileName) {
		try {
			byte[] filebyte= file.getBytes();
			out = new FileOutputStream(path+File.separator+fileName);
			out.write(filebyte);
		}catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if (out != null)
					out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@Override
	public int storedel(String code) {
		return dao.storedel(code);
	}

	@Override
	public int storeupdate(StoreDTO store) {
		return dao.storeupdate(store);
	}


	@Override
	public int orderinsert(OrderDTO order) {
		return dao.orderinsert(order);
	}


	@Override
	public List<StoreDTO> listAll(int start, int end, String serchOption, String keyword) {
		return dao.listAll(start, end, serchOption, keyword);
	}


	@Override
	public int countArticle(String searchOption, String keyword) {
		return dao.countArticle(searchOption, keyword);
	}


	@Override
	public List<OrderDTO> storehistory() {
		return dao.storehistory();
	}


	@Override
	public OrderDTO orderdetail(String or_num) {
		return dao.orderdetail(or_num);
	}

}


