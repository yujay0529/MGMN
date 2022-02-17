$(function () {
    // file image 변화 감지
    $("#input_img").on('change', function () {
        readURL(this);
    });

    // 상세주소 수정시 geocoding api 호출
    $("#userAddress2").on('change', () => {
        callGeocoding();
    });
});

// file image 미리보기
function readURL(input) {
    if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_preview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
    }
}

function callGeocoding() {
    const geocodingUrl = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode";
    const clientID = "e9m4p9u3gx";
    const clientSecret = "dFMcRtfMmms518Hr17OcdpRjqVfsSyda7LJoOwko";
    const address = $("#userAddress1").text();

    $.ajax({
        url: geocodingUrl,
        type: "get",
        headers: {
            "X-NCP-APIGW-API-KEY-ID": clientID,
            "X-NCP-APIGW-API-KEY": clientSecret,
        },
        data: {
            "query": "중랑구 면목4동"
        },
        success: (data) => {
            console.log(data);
            return data;
        },
        error: (e, stat) => {
            console.log(e);
            console.log(stat);
        }

    })
}