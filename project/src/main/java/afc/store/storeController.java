package afc.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

@Controller
public class storeController {
	
	@Autowired
	StoreService service;

	/*@RequestMapping("/store.do")
	public ModelAndView storelist() {
		List<StoreDTO> storelist = service.storelist();
		ModelAndView mav = new ModelAndView();
		mav.addObject("storelist", storelist);
		mav.setViewName("store");		
		return mav;
	}*/
	@RequestMapping("/store/store.do")
	public ModelAndView list(@RequestParam(defaultValue="name") String searchOption,
					@RequestParam(defaultValue="") String keyword, 
					@RequestParam(defaultValue="1") int curPage) throws Exception{		
		// ���ڵ��� ���� ���
				int count = service.countArticle(searchOption, keyword);
				// ������ ������ ���� ó��
				BoardPager boardPager = new BoardPager(count, curPage);
				int start = boardPager.getPageBegin();
				int end = boardPager.getPageEnd();
				
				List<StoreDTO> list = service.listAll(start, end, searchOption, keyword);
				//List<StoreDTO> storelist = service.storelist();
				
				// �����͸� �ʿ� ����
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", list); // list
				map.put("count", count); // ���ڵ��� ����
				map.put("searchOption", searchOption); // �˻��ɼ�
				map.put("keyword", keyword); // �˻�Ű����
				map.put("boardPager", boardPager);
				// ModelAndView - �𵨰� ��
				ModelAndView mav = new ModelAndView();
				mav.addObject("map", map); // �ʿ� ����� �����͸� mav�� ����
				mav.setViewName("store"); // �並 list.jsp�� ����
				return mav; // list.jsp�� List�� ���޵ȴ�.
		
		
	}
	
	
	
	
	
	@RequestMapping("/store/read.do")
	public ModelAndView storeread(String code, String state) {
		StoreDTO store = service.read(code);
		List<BoardDTO> boardlist = service.boardlist(code);
		ModelAndView mav = new ModelAndView();
		String view = "";
		if(state.equals("update")) {
			view="store/update";
		}else {
			view="store/read";
		}		
		mav.addObject("store", store);
		mav.addObject("boardlist", boardlist);
		mav.setViewName(view);		
		return mav;		
	}
	@RequestMapping("/store/store/update.do")
	public String storeupdate(StoreDTO store) {
		int result = service.storeupdate(store);
		
		return "redirect:/store.do";
	}
	
	@RequestMapping("/store/delete.do")
	public String boarddelete(String review_no, String code) {
		
		int result = service.boarddelete(review_no);
		
		return "redirect:/store/read.do?code="+code;
		 
	}
	@RequestMapping(value="/store/board/insert.do")
	public String boardinsert(BoardDTO board) {
		System.out.println(board.code);
		int result = service.boardinsert(board);
		return "redirect:/store/read.do?code="+board.code+"&state=READ";
	}
	@RequestMapping(value="/store/store/insert.do")
	public String storeinsert(StoreDTO store,  HttpSession session) throws Exception{		
		//store�� ����� ���� ����ϱ�
		//		
		System.out.println(store.uploadFiles);
		
		//uploadFiles�� length����ϱ�
		System.out.println(store.uploadFiles.length);
		
		//uploadFiles�� ������ŭ for�� �ȿ��� getOriginalFilename�� �����Ͽ� ArrayList�� �迭�� �����ϱ�
		int size = store.uploadFiles.length;
		for(int i=0; i<size; i++) {			
			System.out.println(store.uploadFiles[i]);
			MultipartFile file = store.uploadFiles[i];
			String realPath = WebUtils.getRealPath(session.getServletContext(),"/resources/images/store");
			String fileName = file.getOriginalFilename();
			System.out.println(fileName);
			service.upload(file, realPath, fileName);	
			System.out.println(realPath);
		}
		
		//uploadFiles�� ������ŭ for�� �ȿ���  ������ upload�޼ҵ� ȣ���ϱ�
		//���ε� ����Ȯ���ϱ�		
		/*MultipartFile file = store.getUpFile();
		String realPath = WebUtils.getRealPath(session.getServletContext(),"/resources/images/store");
		String fileName = file.getOriginalFilename();
		service.upload(file, realPath, fileName);*/			
		int result = service.storeinsert(store);
		return "redirect:/store.do";
	}
	@RequestMapping("/store/store/delete.do")
	public String storedel(String code) {
		int result = service.storedel(code);
		return "redirect:/store.do";		
	}
	@RequestMapping("/store/store/order.do")
	public ModelAndView order(OrderDTO order, String code, String state) {		
		StoreDTO store=service.read(code);
		ModelAndView mav = new ModelAndView();
		mav.addObject("order",order);
		mav.addObject("store",store);
		if(state.equals("order")) {
			mav.setViewName("store/order");
		}else {
			
		}
		
		
		
		return mav;
	}
	@RequestMapping("/store/pay.do")
	public ModelAndView pay(OrderDTO order) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("order",order);
		mav.setViewName("store/pay");
		
		return mav;
	}
	@RequestMapping("/store/resultinsert.do")
	public String resultinsert(OrderDTO order) {
		int result = service.orderinsert(order);
		return null;
	}	
	
	@RequestMapping("/store/result.do")
	public ModelAndView result(String or_num) {		
		//타입 종류로 insert할지 select 할지 선택 그리고 나머지는 그대로
		OrderDTO order = service.orderdetail(or_num);	
		ModelAndView mav = new ModelAndView();					
			mav.addObject("order",order);
			mav.setViewName("store/result");	
		return mav;
	}
	@RequestMapping(value="/store/ajax_storelist.do", method=RequestMethod.GET,
			produces="application/json;charset=utf-8")
	public @ResponseBody List<StoreDTO> ajaxstorelist(String category){
		return service.storelist(category);		
	}
	@RequestMapping("/store/purchase/history.do")
	public ModelAndView storehistory() {
		List<OrderDTO> orderlist=service.storehistory();		
		ModelAndView mav = new ModelAndView();		
		mav.addObject("orderlist", orderlist);
		mav.setViewName("store/history");		
		return mav;
	}
	@RequestMapping("/store/sales.do")
	public String storesales() {
		return "store/sales";
	}
	
}
