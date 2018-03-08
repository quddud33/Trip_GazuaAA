package util;


public class PaginateUtil {
	
	public static String getPaginate(int pageNo,
			                         int total,
			                         int numPage,
			                         int numBlock,
			                         String url,
			                         String param) {
		//현재 페이지 : pageNo
		//전체 게시물수 : total 
		//한 페이지당 게시물수 : numPage
		//한 페이지당 보여질 블록수 : numBlock
		//주소 : url
		//파라미터 : param
		
		//전체 페이지수
		int totalPage = (int)Math.ceil((double)total/numPage);
		
		int savePage = pageNo;
		
		if(savePage % 5 == 0) {
			savePage -= 1;
		}
		//System.out.println(totalPage);
		
		//현재 블록
		int nowBlock = (int)Math.ceil((double)pageNo/numBlock);
		
		
		String paginate = 
				"<div class='paginate'>";
		
		if(total!=0) {
			//이전버튼 & 처음버튼
			if(pageNo <= numBlock) {
				//비활성화
//				paginate += "<button title=\"이전 페이지 없음\"><i class=\"fa fa-chevron-left\"></i></button>";
			}else {
				//활성화
				paginate += "<button onclick='location.href = \""+url+param+(int)((Math.floor((savePage-5)/5)+1)*5)+"\"' title='이전 페이지로'><i class='fa fa-chevron-left'></i></button> ";
			}//if end
			
			
			for(int i = 1 ; i <= numBlock ; i++) {
				
				//실제 출력 페이지
				int realPage = ((nowBlock-1)*numBlock)+i;
				
				//현재 페이지냐? 아니냐?
				if(realPage==pageNo) {
					//현재 페이지
					paginate += "<button style='cursor : not-allowed; background-color: #AAA;' title='현재 "+pageNo+"페이지' disabled>"+pageNo+"</button> ";
					
				}else {
					//현재 페이지가 아님
					paginate += "<button onclick='location.href = \""+url+param+realPage+"\"' title='"+realPage+"'>"+realPage+"</button> ";
					
					
				}//if ~ else end
				
				if(realPage==totalPage) {
					break;
				}//if end
				
			}//for end(블록 만들기)
			
			//다음버튼 & 마지막버튼
			if(pageNo > totalPage - ((totalPage % 5 == 0) ? 5 : totalPage % 5)) {
				//비활성화
//				paginate+="<button title='다음 페이지 없음'><i class='fa fa-chevron-right'></i></button>";
			}else {
				//활성화
				paginate+="<button onclick='location.href = \""+url+param+(int)(((Math.floor(savePage/5)+1)*5)+1)+"\"' title='다음 페이지로'><i class='fa fa-chevron-right'></i></button> ";
			}//if end
			
		}//if end
		
		paginate+= "</div>";
		
		return paginate;
	}
	

}
