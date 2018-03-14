package controller;
   

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import service.NaverMemberService;
import service.ReservationService;
import service.APIService;
import service.BoardLikeService;
import service.BoardService;
import service.CommentService;
import service.FBLoginService;
import service.GoogleLoginService;
import service.ReviewService;

@Controller
public class MyController {
	@Autowired
	private LoginService lService;
	
	@Autowired
	private ReviewService rService;
	
	@Autowired
	private BoardService bService;

	@Autowired
	private ReservationService resService;
	
	@Autowired
	private APIService aService;
	
	@Autowired 
	private CommentService cService;
	
	@Autowired
	private BoardLikeService blService;

	@Autowired
	private NaverMemberService nService;
	
	@Autowired
	private GoogleLoginService gService;
	
	@Autowired
	private FBLoginService FBService;

	//=================================여기서부터 로그인단================================//
	@RequestMapping("createUserForm.do")
	public void createUserForm() {}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request, HttpSession session,String userID,String password) {
		String old_url = request.getHeader("referer");
		if(lService.login(userID, password)) {
			session.setAttribute("user", lService.getUserInfo(userID));
		}
		else {
			session.setAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
		}
		return "redirect:" + old_url;
		
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
	
	@RequestMapping("naverLogin.do")
	public String naverLogin(@RequestParam String code, HttpSession session) throws Exception {

		session.setAttribute("user", nService.naverLogin(
				"https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=rXNTEaBc1MiIpkex1vR5&client_secret=VUpmCnOobA&code="
						+ code + "&state=STATE_STRING"));

		HashMap<String, String> params = (HashMap<String, String>) session.getAttribute("user");
		if (lService.checkID((String) params.get("userID")) == 0)
			nService.createNaverUser(params);

		return "redirect:main.do";

	}
	
	@RequestMapping("googleLogin.do")
	public String googleLogin(@RequestParam HashMap<String, String> params, HttpSession session) {
		
		session.setAttribute("user", params);
		
		if(lService.checkID((String) params.get("userID")) == 0)
			gService.createGoogleUser(params);
		
		return "redirect:main.do";
	}
	
	@RequestMapping("FBLogin.do")
	public String FBLogin(@RequestParam HashMap<String, String> params, HttpSession session) {
		
			session.setAttribute("user", params);
		
		if(lService.checkID((String) params.get("userID")) == 0)
			FBService.createFBUser(params);
		
		return "redirect:main.do";
	}
	
	//====================================리뷰==================================================
	
	//리뷰작성
	@RequestMapping("reviewWrite.do")
	public String reviewWrite(@RequestParam HashMap<String, String> params) {
		rService.insertReview(params);
		return "redirect:contentView.do?contentid="+params.get("contentID")+"&contenttypeid="+params.get("contentTypeID") + "&name=" + params.get("name");
	}
	
	//리뷰업데이트
	@RequestMapping("reviewUpdateForm.do")
	public String reivewUpdate(Model model,@RequestParam HashMap<String, String>params, @RequestParam String num) {
		model.addAttribute("reviewInfo",rService.reviewNum(num));
		return "reviewUpdateForm";
	}
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate(@RequestParam HashMap<String, String> params) {
		rService.updateReview(params);
		return "redirect:contentView.do?contentid="+params.get("contentID")+"&contenttypeid="+params.get("contentTypeID")+"&num="+params.get("num");
	}
	
	//리뷰삭제
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(@RequestParam HashMap<String, String>params) {
		rService.deleteReview(params);
		return "redirect:contentView.do?contentid="+params.get("contentid")+"&contenttypeid="+params.get("contenttypeid")+"&num="+params.get("num");
	}
	
	//좋아용+1
	@RequestMapping("likeSum.do")
	public String likeSum(@RequestParam String num,@RequestParam HashMap<String, String >params,HttpSession session) {
		rService.likeSum(num);
		HashMap map = (HashMap)session.getAttribute("user");
		params.put("userID", (String) map.get("userID"));
		rService.userLikeReviewInsert(params);
		return "redirect:contentView.do?contentid="+params.get("contentid")+"&contenttypeid="+params.get("contenttypeid")+"&num="+params.get("num");
	}
	
	//좋아용-1
	@RequestMapping("likeMinus.do")
	public String likeMinus(@RequestParam String num,@RequestParam HashMap<String, String >params,HttpSession session) {
		rService.likeMinus(num);
		HashMap map = (HashMap)session.getAttribute("user");
		params.put("userID", (String) map.get("userID"));
		rService.userlikeReviewDelete(params);
		return "redirect:contentView.do?contentid="+params.get("contentid")+"&contenttypeid="+params.get("contenttypeid")+"&num="+params.get("num");
	}
	
//============================소켓=================================================
		@RequestMapping("chat.do")
		public String chat() {
			return "chat";
		}
		
//==================================게시판=============================================
		
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
		
		//게시글  보기(selectOne), 댓글, 좋아요
		@RequestMapping("tripBoardView.do")
		public ModelAndView tripBoardView(@RequestParam int num, @RequestParam int page, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> params = new HashMap<>();
			HttpSession session = request.getSession();
			if(session.getAttribute("user") == null) {
				mav.addObject("page",page);
				mav.addObject("view",bService.selectOne(num));
				mav.addObject("comment",cService.selectAll(num));
	            mav.addObject("like",bService.likeCount(num));
	            mav.addObject("viewsCount",bService.viewsCount(num));
	            mav.addObject("commentCount",cService.commentCount(num));
				mav.setViewName("tripBoardView");
				return mav;
			} else {
				HashMap<String, String> user = (HashMap<String, String>)session.getAttribute("user");
				String userID = user.get("userID");
				params.put("num", num);
				params.put("userID",userID);
				if(userID.equals(blService.likeCheck(params))) {
					mav.addObject("likeCheck",1);
				}
				mav.addObject("page",page);
				mav.addObject("view",bService.selectOne(num));
				mav.addObject("comment",cService.selectAll(num));
	            mav.addObject("like",bService.likeCount(num));
	            mav.addObject("viewsCount",bService.viewsCount(num));
	            mav.addObject("commentCount",cService.commentCount(num));
				mav.setViewName("tripBoardView");
				bService.views(num);
				
				return mav;
			}
		}
		
		//글 삭제
		@RequestMapping("tripBoardDelete.do")
		public String tripBoardDelete(@RequestParam int num) {
			bService.deleteBoard(num);
			
			return "redirect:tripBoard.do";
		}
		
		//글 수정폼
		@RequestMapping("tripBoardUpdateForm.do")
		public ModelAndView tripBoardUpdateForm(int num, @RequestParam int page) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("page",page);
			mav.addObject("update",bService.selectOne(num));
			mav.setViewName("tripBoardUpdateForm");
			
			return mav;
		}
		
		//글 수정 
		@RequestMapping("tripBoardUpdate.do")
		public String tripBoardUpdate(@RequestParam HashMap<String, Object> params, @RequestParam int page) {
			bService.updateBoard(params);
			return "redirect:tripBoard.do?page="+  page;
		}
		
		//검색
		@RequestMapping("tripBoardSearch.do")
		public ModelAndView tripBoardSearch(@RequestParam int page, String search, String board) {
			ModelAndView mav = new ModelAndView();
			int start = (page - 1) * 15;
			
			HashMap<String, Object> params = new HashMap<>();
			params.put("search", search);
			params.put("board", board);
			params.put("start", start);
			
			mav.addObject("board", bService.selectSearch(params));
			mav.addObject("total",bService.searchCount(params));
			mav.addObject("page",page);
			mav.setViewName("tripBoard");
			return mav;
		}
		
		//selectAll
		@RequestMapping("tripBoard.do")
		public ModelAndView tripBoard(@RequestParam(defaultValue="1") int page, @RequestParam(defaultValue="new") String sort) {
			ModelAndView mav = new ModelAndView();
			int start = (page - 1) * 15;
			
			HashMap<String, Object> params = new HashMap<>();
			params.put("start", start);
			params.put("sort", sort);
			
			mav.addObject("total", bService.count());
			mav.addObject("page", page);
			mav.addObject("board", bService.selectAll(params));
			mav.setViewName("tripBoard");
			return mav;
		}
		
//================================게시글 좋아요=====================================

		//좋아요++
		@RequestMapping("tripBoardLike.do")
		public String tripBoardLike(@RequestParam HashMap<String, Object> params, @RequestParam int page, HttpSession session, int num) {
			if(session.getAttribute("user") == null) {
				session.setAttribute("msg","로그인 후 이용해주세요");
				return "redirect:tripBoardView.do?num=" + params.get("num") +"&page="+ page;
			} else {
				blService.likeInsert(params);
				bService.likeCountUp(num);
				return "redirect:tripBoardView.do?num=" + params.get("num") +"&page="+ page;
			}
		}
		
		//조아요--
		@RequestMapping("tripBoardLikeDelete.do")
		public String tripBoardLikeDelete(@RequestParam HashMap<String, Object> params,@RequestParam int page, HttpSession session,int num) {
			if(session.getAttribute("user") == null) {
				session.setAttribute("msg","로그인 후 이용해주세요");
				return "redirect:tripBoardView.do?num="+params.get("num")+"&page="+page;
			} else {
				bService.likeCountDown(num);
				blService.likeDelete(params);

				return "redirect:tripBoardView.do?num="+params.get("num")+"&page="+page;
			}
		}

				
//====================================예약관련=================================
		
		@RequestMapping("reservationView.do")
		public String reservationView(Model model, @RequestParam HashMap<String, String> params) throws Exception {
			model.addAttribute("detail", aService.detailInfo(params.get("contentID"), params.get("contentTypeID")));
			return "reservationView";
		}
				
		@RequestMapping("reservation.do")
		public String reservation(Model model, @RequestParam HashMap<String, String> params) {
			resService.insertReservation(params);
			return "redirect:myPage.do";
		}
		
		/*@RequestMapping("wish.do")
		public void wish(String contentTypeID, String contentID) {
			
		}*/
		
		@RequestMapping("festvalWish.do")
		public String festvalWish(@RequestParam HashMap<String, String> params) {
			resService.insertFestval(params);
			return "redirect:myPage.do";
		}
		
		@RequestMapping("restaurantWish.do")
		public String restaurantWish(@RequestParam HashMap<String, String> params) {
			resService.insertRestaurant(params);
			return "redirect:myPage.do";
		}
		
	//=================================댓글======================================
		
		//댓글 입력
		@RequestMapping("tripCommentInsert.do")
		public String tripCommentInsert(@RequestParam HashMap<String, Object> params, @RequestParam int page, HttpSession session) {
			if(session.getAttribute("user") == null) {
				session.setAttribute("msg","로그인 후 이용해주세요");
				return "redirect:tripBoardView.do?num=" + params.get("num") + "&page=" + page;
			}
			cService.insertComment(params);
			return "redirect:tripBoardView.do?num=" + params.get("num") + "&page=" + page;
		}
		
		//댓글 삭제
		@RequestMapping("tripCommentDelete.do")
		public String tripCommentDelete(@RequestParam int commentNum, @RequestParam int num, int page) {
			cService.deleteComment(commentNum);
			return "redirect:tripBoardView.do?num=" + num + "&page=" + page;
		}
		
		//댓글 수정
		@RequestMapping("tripCommentUpdate.do")
		public String tripCommentUpdate(@RequestParam HashMap<String, Object> params, @RequestParam int page) {
			cService.updateComment(params);
			return "redirect:tripBoardView.do?num=" + params.get("num") +"&page="+ page; 
		}
		
//====================================마이페이지==================================
		
		@RequestMapping("myPage.do")
		public String myPage(Model model, HttpSession session) throws Exception {
			String userID = ((HashMap<String, String>)session.getAttribute("user")).get("userID");
			List<HashMap<String, String>> reservation = resService.selectReservation(userID);
			List<HashMap<String, String>> festval = resService.selectFestval(userID);
			List<HashMap<String, String>> restaurant = resService.selectRestaurant(userID);
			List<HashMap<String,Object>> boardSelect = bService.myPageSelect(userID);
			List<HashMap<String, String>> myPageReviewSelect = rService.myPageReviewSelect(userID);
			for(HashMap<String, String> res : reservation) {
				res.put("img", aService.imgInfo(res.get("contentID"), res.get("contentTypeID")).get("originimgurl"));
			}
			
			for(HashMap<String, String> fes : festval) {
				fes.put("img", aService.imgInfo(fes.get("contentID"), fes.get("contentTypeID")).get("originimgurl"));
			}
			
			for(HashMap<String, String> rest : restaurant) {
				rest.put("img", aService.imgInfo(rest.get("contentID"), rest.get("contentTypeID")).get("originimgurl"));
			}
			
			model.addAttribute("reservation", reservation);
			model.addAttribute("festval", festval);
			model.addAttribute("restaurant", restaurant);
			model.addAttribute("boardSelect",boardSelect);
			model.addAttribute("myPageReviewSelect",myPageReviewSelect);
			
			return "myPage";
		}
		
		@RequestMapping("reservationDelete.do")
		public String reservationDelete(@RequestParam HashMap<String, String> params) {
			resService.deleteReservation(params);
			
			return "redirect:myPage.do";
		}
		
		@RequestMapping("festvalDelete.do")
		public String festvalDelete(@RequestParam HashMap<String, String> params) {
			resService.deleteFestval(params);
			
			return "redirect:myPage.do";
		}
		
		@RequestMapping("restaurantDelete.do")
		public String restaurantDelete(@RequestParam HashMap<String, String> params) {
			resService.deleteRestaurant(params);
			
			return "redirect:myPage.do";
		}
		@RequestMapping("myPageBoardDelete.do")
		public String myPageBoardDelete(@RequestParam int num) {
			bService.deleteBoard(num);
			return "redirect:myPage.do";
		}
		@RequestMapping("myPageReviewDelete.do")
		public String myPageReviewDelete(@RequestParam HashMap<String, String> params) {
			rService.deleteReview(params);
			return "redirect:myPage.do";
		}
		

//===================================지도 맵핑=====================================
		@RequestMapping("festivalMap.do")
		public String festivalMap() {
			return "festivalMap";
		}
		@RequestMapping("weatherMap.do")
		public String weatherMap() {
			return "weatherMap";
		}
}
