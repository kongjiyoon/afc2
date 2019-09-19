package ktds.afc.stadium;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ktds.afc.match.MatchDTO;






@Controller
public class StadiumController {
	
	@Autowired
	StadiumService service;
	
	

	@RequestMapping(value="/ticketing/stadium.do",
			method=RequestMethod.GET)
	public ModelAndView showstadium(String code) {
		ModelAndView mav= new ModelAndView();
		//System.out.println(code);
		mav.addObject("code", code);
		mav.setViewName("ticketing/stadium");
		return mav;
	}
	
	
	
	//ajax로 요청되는 메소드
	//pom.xml에 jackson라이브러리를 추가해놓으면
	//자동으로 @ResponseBody가 추가된 리턴타입에 해당하는 json데이터가
	//만들어진다.
	@RequestMapping(value="/ticketing/ajax_stadium.do",
			method=RequestMethod.GET,
			produces="application/json;charset=utf-8")
	public @ResponseBody List<SectionSeatDTO> ajaxstadium(String section){
		//System.out.println(section);
		List<SectionSeatDTO> list = service.section2search(section);
		//System.out.println("contrlll-->"+list);
		return list;
	}
	@RequestMapping(value="/ticketing/ajax_showstadiumimg.do",
			method=RequestMethod.GET,
			produces="application/json;charset=utf-8")
	public @ResponseBody String ajaxshowstadiumimg(String section_name, String section){
		String imgpath = service.showStadiumImg(section_name,section);
		//System.out.println(imgpath);
		return imgpath;
	}
}
