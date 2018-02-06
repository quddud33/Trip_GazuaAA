<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

        #bg {
            width:100%;
            height:100%;
            position:fixed;
            left:0;
            top:0;
            background-color: rgba(0,0,0,.7);
            display: none;
        }

        #updateBox {
            width:600px;
            height:200px;
            position:absolute;
            left:50%;
            top:50%;
            margin:-150px 0 0 -300px;
            background: #fff;
        }
        .title {
            text-align: center;
            color:#03A9F4;
        }
        #updateBox dt {
            text-indent: 10px;
            margin:5px;
            font-size:21px;
            color:#29B6F6;
        }
        #updateBox dd {
            text-indent: 10px;
            margin:5px;
        }

</style>
</head>
<body>

	${view.nickname }<br>
	${view.title }<br>
	${view.content }<br>
	${view.wDate }<br>
	
	<table border="1">
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="comment" items="${comment }">
			<tr>
				<td>${comment.nickname }</td>
				<td class="commentContent">${comment.content }</td>
				<td>${comment.wDate }</td>
				<c:if test="${user.userID eq comment.userID}">
					<td>	
						<a class="delComment" href="#" commentNum="${comment.commentNum }">삭제하기</a>
					</td>
					<td>
						<a class="updateComment" href="#">수정하기</a>
					</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form action="tripCommentInsert.do">
			<input type="hidden" name="userID" value="${user.userID}"/>
			<input type="hidden" name="num" value="${view.num }">
			<input type="hidden" name="nickname" value="${user.nickname }">
			<textarea rows="5" cols="100" name="content"
				style="resize: none; overflow: hidden;" placeholder="댓글을 입력해주세요"></textarea>
			<button>등록</button>
	</form>
	<br>
	
	<a href="tripBoard.do">뒤로가기</a>

	<c:if test="${user.userID eq view.userID}">
		<a href="tripBoardUpdateForm.do?num=${view.num }">수정하기</a>
		<a id="del" href="#">삭제하기</a><!-- boardNum,userID -->
	</c:if>
	<a href="tripBoardLike.do">좋아요</a><!-- boardNum -->
	
	<form action="tripCommentUpdate.do">
		<div id="bg">
			<div id="updateBox">
				<h2 class="title">수정</h2>
					<input type="hidden" name="userID" value="${user.userID}"/>
				<input type="hidden" name="num" value="${view.num }">
				<input type="hidden" name="commentNum" id="commentNum">
				<input type="hidden" name="nickname" value="${user.nickname }">
				<textarea rows="5" cols="80" name="content" id="commentContent"
					style="resize: none; overflow: hidden;" placeholder="댓글을 입력해주세요"></textarea>
			<button>등록</button>	
			</div>
		</div>
	</form>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>
		$('#del').click(function(e) {
			if(confirm("정말로 삭제하시겠습니까?"))
				location.href = "tripBoardDelete.do?num=${view.num }";
			else
				e.preventDefault();
		});
		
		$('.delComment').click(function(e) {
			if(confirm("정말로 삭제하시겠습니까?"))
				location.href = "tripCommentDelete.do?commentNum=" + $(this).attr("commentNum") + "&num=${view.num }";
			else
				e.preventDefault();
		});
		
		$(".updateComment").on("click", function(){
			$("#bg").css("display", "block");
			$("#commentNum").val($(this).parent().prev().children(".delComment").attr("commentNum"));
			$("#commentContent").val($(this).parent().parent().children(".commentContent").text());
		});
		
	    $("#updateBox").on("click",function (e) {                                                             
		        e.stopPropagation();                                                                       
		    });//click end                                                                                
		    $("#bg").on("click",function () {                                                                 
		        $("#bg").css("display","none");                                
		    });//click end
	</script>
</body>
</html>