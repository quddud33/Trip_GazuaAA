   package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.LoginService;
import service.APIService;
import service.ReviewService;

@Controller
public class MyController {
	@Autowired
	private LoginService lService;
	
	@Autowired
	private ReviewService rService;
	

	//=================================여기서부터 로그인단================================//
	@RequestMapping("createUserForm.do")
	public void createUserForm() {}
	
	@RequestMapping("login.do")
	public String login(HttpSession session,String userID,String password) {
		if(lService.login(userID, password)) {
			session.setAttribute("user", lService.getUserInfo(userID));
			return "redirect:main.do";
		}
		else {
			session.setAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
			return "redirect:main.do";
		}
		
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
	
	@RequestMapping(value = "checkID.do", method = { RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody int checkID(String userID, Model model) {
        return lService.checkID(userID);
    }//

	@RequestMapping("createUser.do")
	public String createUser(@RequestParam HashMap<String, String> params) {
		if(params.get("password").equals(params.get("pw_CHECK"))) {
			lService.createUser(params);
		}
		return "redirect:main.do";
	}
	
	//리뷰작성
	@RequestMapping("reviewWrite.do")
	public String reviewWrite(@RequestParam HashMap<String, String> params) {
		rService.insertReview(params);
		System.out.println(params);
		return "redirect:contentView.do?contentid="+params.get("contentID")+"&contenttypeid="+params.get("contentTypeID");
	}
	
	//리뷰리스트
	@RequestMapping("reviewList.do")
	public String reviewList(Model model,@RequestParam String contentID) {
		model.addAttribute("reivewL",rService.reivewList(contentID));
		return "redirect:contentView?contentid="+contentID;
	}
	
	//리뷰업데이트
	@RequestMapping("reviewUpdateForm.do")
	public String reivewUpdate(Model model,@RequestParam HashMap<String, String>params) {
		model.addAttribute(rService.updateReview(params));
		return "redirect:contentView.do?contentid="+params.get("contentID");
	}
	
	//리뷰삭제
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(@RequestParam int num) {
		rService.deleteReview(num);
		return "redirect:contentView.do?contentid="+num;
	}
	
	
}
