<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<meta name="google-signin-client_id"
	content="346120053180-l6r9r2hq1sknebtp2ukd6mtoea688dhl.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/nav.css">
<link rel="stylesheet" href="/trip_GazuaAA/css/loginBox.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
   <style>
        #header {
            height: 100px;
            border-bottom: 1px solid #a3a3a3;
        }
        #body {
            margin-top: 10px;
            min-height: 200px;
        }
        #footer {
            height: 65px;
            margin-top: 50px;
        }
        #title {
            font-weight: bold;
            margin: 0 0 10px 0px;
        }
        #nickname {
            font-size: 15px;
            margin: 30px 0 15px 0px;
        }
        #viewsLike {
            font-size: 15px;
            margin: -35px 15px 15px 0px;
        }
        hr {
            border: .7px solid #a3a3a3;
            margin-top: 30px;
        }
        #content {
            margin-top: 10px;
        }
        #commentForm {
            width: 938px;
        }
        #commentCount {
            font-size: 15px;
            font-weight: bold;
        }
        button {
            height: 90px;
            margin: 0;
        }
        #likeBox {
            width: 60px;
            height: 75px;
            border: 1px solid #a3a3a3;
        }
        #footer #likeBox{
            text-align: center;
            display: inline-block;
        }
        #commentBox {
            min-height: 400px;
            margin-bottom: 100px;
        }
        .comment {
            min-height: 100px;
            border-bottom: 1px solid #a3a3a3;
            /*background: #00AAB4;*/
        }
        #comment {
            margin-top: 30px;
        }
        .comment .commentNickname {
            font-size: 15px;
            font-weight: bold;
            display: block;
            margin-top: 20px;
        }
        .comment .commentContent {
            font-size: 14px;
            width: 700px;
        }
        .comment .date {
            font-size: 14px;
        }
        .comment .commentDU {
            font-size: 14px;
            margin-top: -40px;

        }

        .comment .commentCancel {
            display: none;
        }

        .comment .commentTextarea {
            display: none;
        }
        .like {
        	font-size: 40px;
        }
        .deleteLike {
        	color: #EF5350
        }
        .insertLike {
        	color: #37474F;
        }
        #likeBox .likeCount {
        	font-size: 15px;
        	margin-top: -10px;
        }
        .backBtn {
        	margin-top: 60px;
        }
        #likeBox a {
        	text-decoration: none;
        }
        #likeBox a:hover {
        	color: #EF5350;
        }
        
    </style>
</head>
<body>
	<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>
    <div class="container">
        <div class="jumbotron">
            <div class="text-center">
                <div id="header">
                    <h2 class="text-left" id="title">${view.title }</h2>
                    <p class="text-left" id="nickname">by ${view.nickname }(${view.userID })  ${view.wDate }</p>
                    <p class="text-right" id="viewsLike">조회수 ${viewsCount } 댓글 ${commentCount }</p>
                </div>
                <div id="body">
                    <div class="text-left" id="content">
						${view.content }
                    </div>
                </div>
                <div id="footer">
                    <div id="likeBox" class="text-center">
                        <c:choose>
							<c:when  test="${likeCheck eq 1}">
								<a href="tripBoardLikeDelete.do?num=${view.num}&userID=${user.userID}&page=${page}" class="like deleteLike">♥</a>
							</c:when>
							<c:otherwise>
								<a href="tripBoardLike.do?num=${view.num }&userID=${user.userID}&page=${page}" class="like insertLike">♥</a>
							</c:otherwise>
						</c:choose>
						<p class="likeCount">${like}</p>
                    </div>
                 </div>
                    <div class="text-right">
                    	<c:if test="${user.userID eq view.userID}">
							<a href="tripBoardUpdateForm.do?num=${view.num }&page=${page}">수정하기</a>
							<a id="del" href="#">삭제하기</a><!-- boardNum,userID -->
						</c:if>
                    </div>
                <hr>
                <p class="text-left" id="commentCount">댓글 ${commentCount }개</p>
                <div class="text-center" id="commentBox">
					<form action="tripCommentInsert.do" id="commentInsertForm">
						<input type="hidden" name="userID" value="${user.userID}"/>
						<input type="hidden" name="num" value="${view.num }">
						<input type="hidden" name="nickname" value="${user.nickname }">
						<input type="hidden" name="page" value="${page }">
						<textarea class="form-control col-sm-5" rows="4" style="resize: none;"
									 placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 댓글은 제재를 받을 수 있습니다."
									 id="commentForm" name="content"></textarea>
						<button class="btn btn-primary" id="commentSubmit">댓글등록</button>
					</form>

					<div id="comment">
						<c:choose>
							<c:when test="${!empty comment }">
								<c:forEach var="comment" items="${comment }">
									<div class="comment" >
										<form action="tripCommentUpdate.do" class="commentUpdateForm">
											<p class="text-left commentNickname">${comment.nickname }(${comment.userID })</p>
											<div class="commentContentForm">
												<p class="text-left commentContent">${comment.content }</p>
												<input type="hidden" name="num" value="${view.num}">
												<input type="hidden" name="commentNum" value="${comment.commentNum}">
												<input type="hidden" name="page" value="${page}">
												<input type="hidden" name="nickname" value="${user.nickname }">
												<input type="hidden" name="userID" value="${user.userID}"/>
												<textarea name="content" class="commentTextarea"></textarea>
											</div>
											<p class="text-left date">${comment.wDate }</p>
											<p class="text-right commentDU">
												<c:if test="${user.userID eq comment.userID}">
													<a class="delComment" href="#" commentNum="${comment.commentNum }">삭제</a>
													<a class="updateComment commentUpdate" href="#">수정</a>
													<a class="check" style="display: none">수정 </a>
													<a href="#" class="commentCancel">취소</a>
												</c:if>
											</p>
										</form>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h2 class="text-center"><br>댓글이 없습니다.</h2>
							</c:otherwise>
						</c:choose>
                    </div>

                    <div class="text-right backBtn">
                    	<a href="tripBoard.do?page=${page }" class="btn btn-primary">목록</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<c:if test="${msg ne null }">
	<script>
		alert('${msg}');
	</script>
<%session.invalidate(); %>
	</c:if>
	
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
	<script src="/trip_GazuaAA/js/login.js"></script>
<script>
    var commentContentVal;

    $('.commentUpdate').click(function (e) {
        e.preventDefault();
        var commentContent = $(this).parent().siblings('.commentContentForm');
        $(this).siblings('.commentCancel').css({'display' : 'inline'});
        $(this).siblings('.delComment').css({'display' : 'none'});
        $(this).siblings('.check').css({'display' : 'inline'});
        $(this).css({'display' : 'none'});
        commentContent.find('.commentTextarea').css({'display' : 'block', 'width' : commentContent.css('width'), 'height' : commentContent.css('height')});
        commentContent.find('.commentTextarea').val(commentContent.find('.commentContent').text());
        commentContent.find('.commentContent').css({'display' : 'none'});
        

        commentContentVal = commentContent.html();
        // commentContent.html("<textarea style='width: " + commentContent.css('width') + "; height: " + commentContent.css('height') + ";'>" + commentContent.children('.commentContent').text() + "</textarea>");

        
    });

    $('.commentCancel').click(function (e) {
       e.preventDefault();
       $(this).css({'display' : 'none'});
       $(this).siblings('.delComment').css({'display' : 'inline'});
       $(this).siblings('.check').css({'display' : 'none'});
       $(this).siblings('.commentUpdate').css({'display' : 'inline'});
       var commentContent = $(this).parent().siblings('.commentContentForm');

       commentContent.find('.commentTextarea').css({'display' : 'none'});
       commentContent.find('.commentContent').css({'display' : 'block'});
    });
	
	$('#del').click(function(e) {
		if(confirm("정말로 삭제하시겠습니까?"))
			location.href = "tripBoardDelete.do?num=${view.num }";
		else
			e.preventDefault();
	});
		
	$('.delComment').click(function(e) {
		if(confirm("정말로 삭제하시겠습니까?"))
			location.href = "tripCommentDelete.do?num=${view.num }&page=${page}&commentNum=" + $(this).attr("commentNum");
		else
			e.preventDefault();
	});
			
	$('#commentSubmit').click(function(e) {
		e.preventDefault();
		if ($('#commentForm').val().length <= 0) {
			alert('댓글을 입력해주세요');
		} else
			$('#commentInsertForm').submit();
	});
	
	$('.commentUpdateForm').on('click', '.check', function (e) {
		e.preventDefault();
		
		$(this).closest('.commentUpdateForm').submit();
	});
		
</script>
<!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>
</body>
</html>