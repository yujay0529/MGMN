<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!--  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

    <link rel="stylesheet" href="/css/write.css">
    <title>Write</title>
    <script>
        $(document).ready(function () {
            $('#summernote').summernote({
                placeholder: '내용을 입력해주세요',
                tabsize: 2,
                height: 400
            });

            $('#submit_btn').on('click', function () {
                alert("글 작성 완료");
                window.history.go(-2);
            });
        });
    </script>
</head>

<body>
<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' /> 

<div id="wrap">
</div>

<div class="writeform">
    <main role="main" class="container">
        <form name="form" action="<c:url value='/notice/insertNotice'/>" method="post">
            <!-- method="POST" action="/bulletin_wr01" -->
            <div class="pt-1">
                <input type="text" name="noticeTitle" placeholder="제목을 입력하세요"
                       style="border: 0; border-radius:5px; width:100%; height: 50px; padding:5px; font-size: 40px;">
            </div>
            <div class="pt-1" id="writeSection">
                <textarea id="summernote" name="noticeContent"></textarea>
                <div class="pt-1 text-right" style="padding-bottom: 15%;">
                    <input type="file" name="profile" style="padding-top: 10px;">
                    <button class="btn btn-success" id="submit_btn" type="submit"
                            style="margin-left: 90%; width:10%;">등록</button>
                </div>
            </div>
        </form>
    </main>
</div>
<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' /> 
</body>

</html>