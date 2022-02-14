$(document).ready(() => {
    // ip 구하는 api 키
    let apiKey = '1be9a6884abd4c3ea143b59ca317c6b2';

    $.getJSON('https://ipgeolocation.abstractapi.com/v1/?api_key=' + apiKey, function (data) {
        console.log(JSON.stringify(data, null, 2));
        console.log(data.ip_address); // 아이피 정보

        // ip 주소 화면에 출력
        $("#client-ip").text(data.ip_address);

        // ip 주소를 RestController 로 post -> geolocation api 실행
        $.ajax({
            type: "post",
            url: "/location",
            data: {
                ip: data.ip_address
            },
            dataType: "text",
            success: function (data) {
                console.log(data);

                // ip 주소에 해당하는 현재 위치 표시
                $("#client-location").text(data);
            },
            error: function (data, textStatus) {
                console.log(data);
                console.log(textStatus);
            }
        })
    });
})
