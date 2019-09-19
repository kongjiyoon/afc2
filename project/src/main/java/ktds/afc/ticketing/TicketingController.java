package ktds.afc.ticketing;





import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ktds.afc.match.MatchDTO;
import ktds.afc.stadium.StadiumDTO;





@Controller
public class TicketingController {
	
	@Autowired
	TicketingService service;

	@RequestMapping(value="/ticketing/seatchoice.do")
	public ModelAndView showSeat(String section1,String section2,String code) {
		//System.out.println("TicketingController==>"+section1+","+section2);
		ModelAndView mav= new ModelAndView();
		System.out.println(code);
		mav.addObject("section1", section1);
		mav.addObject("section2", section2);
		mav.addObject("code", code);
		mav.setViewName("ticketing/seatchoice");
		return mav;
	}
	
	
	/*@RequestMapping(value="/ticketing/insert.do")
	public String write(TicketDTO ticket) {
		int result = service.insert(ticket);
		return "redirect:/board/list.do?category=all";
	}*/
	
	@RequestMapping(value="/ticketing/history.do")
	public String showhistory() {
		return "ticketing/history";
	}
	
	@RequestMapping(value="/ticketing/payresultview.do")
	public String showPayResultView() {
		return "ticketing/payresultview";
	}
	
	
	/*@ResponseBody
	@RequestMapping(value="/ticketing/ticketingorder.do",
		method=RequestMethod.GET,
			produces="application/json;charset=utf-8")
	public ModelAndView ajaxshowPayResultView(@RequestParam(value="section1")String section1,
			@RequestParam(value="section2")String section2,
			@RequestParam(value="ea")int ea,
			@RequestParam(value="seats_selected[]")List<String>seats_selected) throws Exception{
		System.out.println(section1+","+section2+","+seats_selected);
		SectionSeatDTO sectionseatdto = service.selectSectionSeat(section1, section2);
		int size = seats_selected.size();
		System.out.println(section1+","+section2+","+seats_selected);
		TicketDTO ticketdto = service.findTicketById("kong");
		String t_code = ticketdto.getT_code();
		for (int i = 0; i < size; i++) {
			String seat_num = sectionseatdto.getSection_code()+'_'+sectionseatdto.getSection_name()+'_'+seats_selected.get(i);
			
			
			//int result2 = service.insert2(t_code,seat_num);
		}
		ModelAndView mav= new ModelAndView();
		MatchDTO match = service.findMatchByCode("A01");
		StadiumDTO stadium = service.findStadiumByStadiumCode("001");
		mav.addObject("match", match);
		mav.addObject("stadium", stadium);
		mav.addObject("ea",ea);
		mav.addObject("seats_selected",seats_selected);
		mav.setViewName("ticketing/ticketingorder");
		return mav;
	}*/
	
	@RequestMapping(value="/ticketing/ticketingorder.do",method=RequestMethod.POST)
	public ModelAndView goOrderPage(String section1, String section2, int ea, String[] seats_selected,String code) {
		System.out.println(section1+","+section2+","+ea+","+seats_selected[0]+","+code);
		ModelAndView mav= new ModelAndView();
		MatchDTO match = service.findMatchByCode(code);
		StadiumDTO stadium = service.findStadiumByStadiumCode("001");
		mav.addObject("match", match);
		mav.addObject("stadium", stadium);
		mav.addObject("section1", section1);
		mav.addObject("section2", section2);
		mav.addObject("ea", ea);
		mav.addObject("price",ea*100000);
		mav.addObject("seats_selected", seats_selected);
		mav.setViewName("ticketing/ticketingorder");
		return mav;
	}
	
	@RequestMapping(value="/ticketing/ticketingpay.do",method=RequestMethod.POST)
	public ModelAndView goPayPage(String section1, String section2, int ea, String price, 
			String[] seats_selected, MatchDTO match, StadiumDTO stadium ) {
		System.out.println(match);
		System.out.println(stadium);
		System.out.println(section1+","+section2+","+ea+","+price+","+seats_selected[0]);
		ModelAndView mav= new ModelAndView();
		/*MatchDTO match = service.findMatchByCode("a01");
		StadiumDTO stadium = service.findStadiumByStadiumCode("001");*/
		mav.addObject("match", match);
		mav.addObject("stadium", stadium);
		mav.addObject("section1", section1);
		mav.addObject("section2", section2);
		mav.addObject("ea", ea);
		mav.addObject("price",price);
		mav.addObject("seats_selected", seats_selected);
		mav.setViewName("ticketing/ticketingpay");
		return mav;
	}
}
