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
import service.BoardService;
import service.ReviewService;

@Controller
public class MyController {
	@Autowired
	private LoginService lService;
	
	@Autowired
	private ReviewService rService;
	
	@Autowired
	private BoardService bService;
	

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
	
	//====================================리뷰==================================================
	
	//리뷰작성
	@RequestMapping("reviewWrite.do")
	public String reviewWrite(@RequestParam HashMap<String, String> params) {
		rService.insertReview(params);
		System.out.println("입력 : "+params);
		return "redirect:contentView.do?contentid="+params.get("contentID")+"&contenttypeid="+params.get("contentTypeID");
	}
	
	//리뷰리스트
	@RequestMapping("reviewList.do")
	public String reviewList(Model model,@RequestParam String contentID) {
		model.addAttribute("reviewL",rService.reviewList(contentID));
		return "redirect:contentView?contentid="+contentID;
	}
	
	//리뷰업데이트
	@RequestMapping("reviewUpdateForm.do")
	public String reivewUpdate(Model model,@RequestParam HashMap<String, String>params, @RequestParam String num) {
		model.addAttribute("reviewInfo",rService.reviewNum(num));
		System.out.println(rService.reviewNum(num));
		System.out.println("업데이트 : "+params);
		return "reviewUpdateForm";
	}
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate(@RequestParam HashMap<String, String> params) {
		System.out.println(params);
		rService.updateReview(params);
		return "redirect:contentView.do?contentid="+params.get("contentID")+"&contenttypeid="+params.get("contentTypeID")+"&num="+params.get("num");
	}
	
	//리뷰삭제
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(@RequestParam HashMap<String, String>params) {
		rService.deleteReview(params);
		System.out.println("삭제 : "+params);
		return "redirect:contentView.do?contentid="+params.get("contentid")+"&contenttypeid="+params.get("contenttypeid")+"&num="+params.get("num");
	}
	
	//좋아용+1
	@RequestMapping("likeSum.do")
	public String likeSum(@RequestParam String num,@RequestParam HashMap<String, String >params) {
		rService.likeSum(num);
		return "redirect:contentView.do?contentid="+params.get("contentid")+"&contenttypeid="+params.get("contenttypeid")+"&num="+params.get("num");
	}
	
	//좋아용-1
	@RequestMapping("likeMinus.do")
	public String likeMinus(@RequestParam String num,@RequestParam HashMap<String, String >params) {
		rService.likeMinus(num);
		return "redirect:contentView.do?contentid="+params.get("contentid")+"&contenttypeid="+params.get("contenttypeid")+"&num="+params.get("num");
	}
	
//============================소켓=================================================
		@RequestMapping("chat.do")
		public String chat() {
			return "chat";
		}
		
//==================================게시판=============================================
		
		//게시판 메인페이지(selectAll)
		@RequestMapping("tripBoard.do")
		public ModelAndView tripBoard() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("board", bService.selectAll());
			mav.setViewName("tripBoard");
			
			return mav;
		}
		
		//글 쓰기 폼
		@RequestMapping("tripBoardWriteForm.do")
		public String tripBoardUpdateForm(HttpSession session) {
			
			if(session.getAttribute("user") == null) {
				session.setAttribute("msg","로그인 후 이용해주세요");
				return "redirect:tripBoard.do";
			} else {
				return "tripBoardWriteForm";
			}
		}
		
		//글 쓰기
		@RequestMapping("tripBoardWrite.do")
		public String tripBoardWrite(@RequestParam HashMap<String, Object> params) {
			bService.insertBoard(params);
			
			return "redirect:tripBoard.do";
		}
		
		//게시글  보기(selectOne)
		@RequestMapping("tripBoardView.do")
		public ModelAndView tripBoardView(@RequestParam int num) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("view",bService.selectOne(num));
			mav.setViewName("tripBoardView");
			
			return mav;
		}
		
		//글 삭제
		@RequestMapping("tripBoardDelete.do")
		public String tripBoardDelete(@RequestParam int num, HttpSession session) {
			session.setAttribute("msg", "삭제하시겠습니까?");
			bService.deleteBoard(num);
			
			return "redirect:tripBoard.do";
		}
		
		//글 수정폼
		@RequestMapping("tripBoardUpdateForm.do")
		public ModelAndView tripBoardUpdateForm(int num) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("update",bService.selectOne(num));
			mav.setViewName("tripBoardUpdateForm");
			
			return mav;
		}
		
		//글 수정 
		@RequestMapping("tripBoardUpdate.do")
		public String tripBoardUpdate(@RequestParam HashMap<String, Object> params) {
//			System.out.println(params);
			bService.updateBoard(params);
			return "redirect:tripBoard.do";
		}
		
}
