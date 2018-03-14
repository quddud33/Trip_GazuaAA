function paginate(now, total, redirect) {
	
	if(this._pageTmp == undefined) {
		this._pageTmp = _.template('<ul><%if(start != 1) {%><li><button class="page" value="<%=start-1%>"><i class="fa fa-chevron-left"></i></button></li><%}%><%for(; start <= end; start++) {%><li><%if(start == now) {%><button class="page" value="<%=start%>" style="cursor:not-allowed;background-color:#AAA" disabled><%=start%></button><%} else {%><button class="page" value="<%=start%>"><%=start%></button><%}%></li><%}%><%if(next) {%><li><button class="page" value="<%=start%>"><i class="fa fa-chevron-right"></i></button></li><%} else {}%></ul>');
	}
	
	var start, end, next;

	start = now - ((now - 1) % 5);
	end = Math.min(start + 4, total)
	next = total != end

	return _pageTmp ({
		redirect: redirect,
		now: now,
		start: start,
		end: end ,
		next: next 
	})

}