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
    });
    </script>
</head>

<body>
    <div id="wrap">

    </div>
   
    <div class="writeform">
        <main role="main" class="container">
            <form method="post" action="<c:url value='/notice/updateNotice'/>">
             <input type="hidden" name="noticeNo" id="noticeNo" value="${noti.noticeNo}"><!-- 게시글 수정을 위해 hidden으로 값을 넘겨줌-->
                <div class="pt-1">
                    <input type="text" name="noticeTitle" value="${noti.noticeTitle }"
                        style="border: 0; border-radius:5px; width:100%; height: 50px; padding:5px; font-size: 30px;">
                </div>
                <div class="pt-1" id="writeSection">
                    <textarea id="summernote" name="noticeContent">${noti.noticeContent }</textarea>
                    <div class="pt-1 text-right" style="padding-bottom: 15%;">
                        <input type="file" name="profile" style="padding-top: 10px;">
                        <button class="btn btn-success" id="submit_btn" type="submit"
                            style="margin-left: 90%; width:10%;">수정</button>
                    </div>
                </div>
            </form>
        </main>
-	    </div>

</body>

</html>