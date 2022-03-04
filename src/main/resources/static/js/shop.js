$(document).ready(() => {
    // ip 구하는 api 키
    // IP API 변경
    // let apiKey = '1be9a6884abd4c3ea143b59ca317c6b2';
    

    $.getJSON('https://api.ipify.org?format=jsonp&callback=?', function (data) {
        //console.log(JSON.stringify(data, null, 2));
        //console.log(data.ip); // 아이피 정보
        //console.log(data.ip_address); // 아이피 정보

        // ip 주소 화면에 출력
        $("#client-ip").text(data.ip);
       
        // ip 주소를 RestController 로 post -> geolocation api 실행
        $.ajax({
            type: "post",
            url: "/location",
            data: {
                ip: data.ip
    
            },
            dataType: "text",
            success: function (data) {
                //console.log(data);
                
                //sessionStorage에 저장 (자바스크립트에서 세션 사용하기)
                sessionStorage.setItem("address",data);

                // ip 주소에 해당하는 현재 위치 표시
                $("#client-location").text(data);
            },
            error: function (data, textStatus) {
                console.log(data);
                console.log(textStatus);
            }
        })
        
        // 위도
        $.ajax({
            type: "post",
            url: "/locationLat",
            data: {
                ip: data.ip
                
            },
            dataType: "text",
            success: function (data) {
                console.log(data);
                
                //sessionStorage에 저장 (자바스크립트에서 세션 사용하기)
                sessionStorage.setItem("lat",data);
         
                // ip 주소에 해당하는 현재 위도 표시
                $("#client-lat").text(data);
            },
            error: function (data, textStatus) {
                console.log(data);
                console.log(textStatus);
            }
        })
        // 경도
         $.ajax({
            type: "post",
            url: "/locationLong",
            data: {
                ip: data.ip
                
            },
            dataType: "text",
            success: function (data) {
                console.log(data);
                
                sessionStorage.setItem("long",data);
				
                // ip 주소에 해당하는 현재 경도 표시
                $("#client-long").text(data);
            },
            error: function (data, textStatus) {
                console.log(data);
                console.log(textStatus);
            }
        })
        
        
    });
})
