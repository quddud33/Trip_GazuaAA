function paginate(now, total, redirect) {
	
	if(this._pageTmp == undefined) {
		var result;
		$.ajax('/trip_GazuaAA/template/pageTmp.html', {
			async: false,
			success: function(html) { result = html; }
		})
		this._pageTmp = _.template(result);
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