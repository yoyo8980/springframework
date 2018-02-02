<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
		init();
		$('#myModal form').submit(function(e) {
			e.preventDefault();//이벤트취소
			insertOne();
			$('#myModal').modal('hide');
		});
		$(document).on('click','table a', function() {
			var idx=$(this).parent().prev().text();
			console.log(idx);
			selectOne(idx);
		});
	});
	
	function selectOne(idx) {
		$.getJSON('http://localhost:8080/sts4x/'+idx, function(data) {
			$('.detail').eq(0).text(data.idx);
			$('.detail').eq(1).text(data.sub);
			$('.detail').eq(2).text(data.content);
			$('.detail').eq(3).text(data.cnt);
		});
	}
	
	function insertOne() {
		var data=$(this).serialize();
		$.post('add',data,function(){
			init();
		});
	}
	
	function init() {
		var listObj="";
		$.getJSON('http://localhost:8080/sts4x/list', function(data) {
			$(data).each(function(num,ele) {
				listObj+='<tr><td>'+ele.idx
						+'</td><td><a href="#" data-toggle="modal" data-target="#detailModal">'+ele.sub
						+'</td><td>'+ele.cnt
						+'</td></tr>';	
			});
			
		$('table tbody').eq(1).html(listObj);
		});
		
	}
	
	
	
</script>
</head>
<body>
	<div class="container">
		<h1>Guest 게시판</h1>
		<table class="table">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>조회수</th>
			</tr>
			<tbody></tbody>
		</table>
		
		
			
			<!-- Modal -->
			<div class="modal fade" id="detailModal" role="dialog" >
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">상세보기</h4>
			      </div>
			      <div class="modal-body">
			        <p>
			        	<span>글번호</span>
			        	<span class="detail"></span>
			        </p>
			        <p>
			        	<span>제목</span>
			        	<span class="detail"></span>
			        </p>
			        <p>
			        	<span>내용</span>
			        	<span class="detail"></span>
			        </p>
			        <p>
			        	<span>조회수</span>
			        	<span class="detail"></span>
			        </p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			
			
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
			  글쓰기
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">입력페이지</h4>
			      </div>
			      <div class="modal-body">
			        <form>
						  <div class="form-group">
						    <label for="sub">제목</label>
						    <input type="text" class="form-control" id="sub" name="sub" placeholder="제목없음">
						  </div>
						  <div class="form-group">
						   <textarea rows="" cols="" class="form-control" id="content" name="content"></textarea>
						  </div>
						  <div class="form-group">
						  <button type="submit" class="btn btn-primary">완료</button>
						  </div>
						</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>		
		
	</div>
</body>
</html>