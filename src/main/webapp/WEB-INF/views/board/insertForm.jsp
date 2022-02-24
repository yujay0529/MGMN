<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
<link href="<c:url value='/css/insertForm.css'/>" rel="stylesheet" type="text/css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
$(document).ready(function () {
    $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        height: 400
    });
    $('#submit_btn').on('click', function () {
        alert("글이 성공적으로 등록되었습니다!");
        window.history.go(-2);
    });
});

</script>

<!-- <script src="/js/board.js"></script> -->
</head>

<body>
    <div id="wrap">
         
      <!-- TOP  -->
      
    <form id="insertForm" name="insertForm" method="post"  action="<c:url value='/insertBoard'/>">
     <h2 id="title2"> 게시글 작성 </h2>
     <table border="2">
     <tr><th>brdNo</th><td>
        <input type="text" class="form-control" id="brdNo" name="brdNo" placeholder="1001같은거">
      </td></tr>
        <tr><th>제목</th><td>
        <input type="text" class="form-control" id="brdTitle" name="brdTitle" placeholder="제목을 입력하세요.">
      </td></tr>
        <tr><th>작성자</th><td>
        <input type="text" class="form-control" id="userId" name="userId"<%--  value="${memDto.userId }" --%>>
      </td></tr>
      <tr><th id="content">내용</th><td>
        <textarea class="form-control" name="brdCon" id="summernote" rows="5"></textarea>
      </td></tr>
      <tr><th colspan="2" id="button"><button type="submit" class="btn btn-primary">작성</button>
     </th></tr>
    </table>
    <input type="hidden" name="brdImg" id="brdImg">
    </form>

   <!-- BOTTOM  -->
   
   </div>
</body>
</html>