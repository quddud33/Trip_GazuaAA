package util;

import org.springframework.beans.factory.annotation.Autowired;

import service.APIService;

public class PaginateUtil {
		


	public static String getPaginate(int pageNo,
			                         int total,
			                         int numpageNo,
			                         int numBlock,
			                         String url,
			                         String param) {
		//현재 페이지 : pageNo
		//전체 게시물수 : total 
		//한 페이지당 게시물수 : numpageNo
		//한 페이지당 보여질 블록수 : numBlock
		//주소 : url
		//파라미터 : param
		
		//전체 페이지수
		int totalpageNo = (int)Math.ceil((double)total/numpageNo);
		
		//System.out.println(totalpageNo);
		
		//현재 블록a
		int nowBlock = (int)Math.ceil((double)pageNo/numBlock);
		
		
		String paginate = 
				"<ul class=\"pagination\">";
		
		if(total!=0) {
			
			//이전버튼
			if(pageNo<=1) {
				//비활성화
				paginate += "<li class=\"page-item disabled\">" + 
						"<a class=\"page-link\" href='"+url+"?"+param+(pageNo-1)+"' aria-label=\"Previous\">" + 
						"<span aria-hidden=\"true\">&laquo;</span>" + 
						"<span class=\"sr-only\">Previous</span>" + 
						"</a>" + 
						"</li> ";
			}else {
				//활성화
				paginate += "<li class=\"page-item\">" + 
						"<a class=\"page-link\" href='"+url+"?"+param+(pageNo-1)+"' aria-label=\"Previous\">" + 
						"<span aria-hidden=\"true\">&laquo;</span>" + 
						"<span class=\"sr-only\">Previous</span>" + 
						"</a>" + 
						"</li> ";
						
			}//if end
			
			
			for(int i = 1 ; i <= numBlock ; i++) {
				
				//실제 출력 페이지
				int realpageNo = ((nowBlock-1)*numBlock)+i;
				
				//현재 페이지냐? 아니냐?
				if(realpageNo==pageNo) {
					//현재 페이지
					paginate += "<li class=\"page-item\"><a class=\"page-link\" href='#' title='"+realpageNo+"'>"+realpageNo+"</a></li>";
					
					
				}else {
					//현재 페이지가 아님
					paginate += "<li class=\"page-item\"><a class=\"page-link\" href='"+url+"?"+param+realpageNo+"' title='"+realpageNo+"'>"+realpageNo+"</a></li>";
					
					
				}//if ~ else end
				
				if(realpageNo==totalpageNo) {
					break;
				}//if end
				
			}//for end(블록 만들기)
			
			//다음버튼
			if(pageNo >= totalpageNo) {
				//비활성화
				paginate+="<li class=\"page-item\">" +
						"<a class=\"page-link\" href='"+url+"?"+param+(pageNo+1)+"' aria-label=\"Next\">" +
						"<span aria-hidden=\"true\">&raquo;</span>" +
						"<span class=\"sr-only\">Next</span>" +
						"</a>" +
						"</li> ";
			}else {
				//활성화
				paginate+="<li class=\"page-item\">" +
						"<a class=\"page-link\" href='"+url+"?"+param+(pageNo+1)+"' aria-label=\"Next\">" +
						"<span aria-hidden=\"true\">&raquo;</span>" +
						"<span class=\"sr-only\">Next</span>" +
						"</a>" +
						"</li> ";
			}//if end
			
		}//if end
		
		paginate+= "</ul>";
		
		return paginate;
	}

}
