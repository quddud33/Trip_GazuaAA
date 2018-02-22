	$(".login").on("click", function(){
		$("#bg").css("display", "block");
	});
	
    $("#loginBox").on("click",function (e) {                                                              //상세정보를 보여주는 박스 클릭이벤트
	        e.stopPropagation();                                                                        //부모로의 이벤트 전파를 중지시킴 (이걸 하지 않을시 박스를 클릭했는데 뒷배경의 이벤트까지
	  });//click end                                                                                  //함께 발생하는일이 일어나게됨.
	    $("#bg").on("click",function () {                                                                    //뒷배경 박스 클릭이벤트
	        $("#bg").css("display","none");                                                                  //상세정보 창을 안보이게 변경
	 });//click end