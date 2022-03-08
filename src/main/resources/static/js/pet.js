var pagePopup = {
    _config: {
        updateTaget: null,
        tempInputElement: null,
    },
    mainTipPopup: function() {
        $.ajax({
            url: "/get/loginCheck",
            type: "GET",
            data: {},
            dataType: "JSON",
            success: function(data) {
                if (data.code == 600) {
                    pagePopup.openGotoPopup();
                    return false;
                } else if (data.code == 200) {
                    $('.main_tip_popup').addClass('active');
                } else {
                    alert("관리자에게 문의해주세요.");
                }
            },
            error: function() {
                alert("관리자에게 문의해주세요.");
            }
        });
    },
    setMainInterestPopup: function() {
        var type = $(".main_tip_popup input[name=tip_radio]:checked").val();
        var prevType = $("input[name=prev_interest]").val();

        if (typeof(type) == "undefined" || !type) {
            alert("관심 노하우를 선택해주세요.");
            return false;
        }

        if (type == prevType) {
            pagePopup.closePopup();
            return false;
        }
 
        $.ajax({
            url: "/add/instructor",
            type: "POST",
            data: {
                type: type
            },
            dataType: "JSON",
            success: function(data) {
                if (data.code == 600) {
                    pagePopup.closePopup();
                    pagePopup.openGotoPopup();
                    return false;
                } else if (data.code == 200) {
                    window.location.reload();
                } else {
                    alert("관리자에게 문의해주세요.");
                }
            },
            error: function() {
                alert("관리자에게 문의해주세요.");
            }
        });
    },
    closePopup: function() {
        $('.popup-wrapper').removeClass('active');
    },
    close2Popup: function() {
        $('.normal-2-popup').removeClass('active');
    },
    closeDelPopup: function() {
        $('.mypage-petDelete-popup').removeClass('active');
    },
    openGotoPopup: function() {
        $('.goto-login-popup').addClass('active');
    },
    openReplyGotoPopup: function() {
        $('.goto-reply-login-popup').addClass('active');
    },
    openInfoPopup: function(path) {
        $('.goto-info-popup #gotoInfoBtn').attr('onclick', "location.href='" + path + "'");
        $('.goto-info-popup').addClass('active');
    },
    openRequestStorePopup: function() {
        $('input[name=request_store_phone]').val('');
        $('input[name=request_store_email]').val('');
        $('textarea[name=request_store_contents]').val('');
        $('#request_file_path').val('');

        if (WitCommon._config.CURRENT_BROWSER == 'IE') { //IE version
            $('#request_input_file').eq(0).replaceWith($('#request_input_file').eq(0).clone(true));
        } else { //other browser
            $('#request_input_file').eq(0).val("");
        }

        $('.request-store-popup').addClass('active');
    },
    closeRequestStorePopup: function() {
        $('.request-store-popup').removeClass('active');
    },
    requestStore: function(phone, email, contents) {
        if (WitCommon._config.SUBMIT_WRITE) {
            WitCommon._config.SUBMIT_WRITE = false;
            if ($('input[name=request_store_phone]').val() == '') {
                pagePopup.alramPopup('휴대폰 번호가 입력되지 않았습니다.');
                WitCommon._config.SUBMIT_WRITE = true;
                return false;
            }
            if ($('input[name=request_store_email]').val() == '') {
                pagePopup.alramPopup('이메일이 입력되지 않았습니다.');
                WitCommon._config.SUBMIT_WRITE = true;
                return false;
            }
            if ($('textarea[name=request_store_contents]').val() == '') {
                pagePopup.alramPopup('문의 내용이 입력되지 않았습니다.');
                WitCommon._config.SUBMIT_WRITE = true;
                return false;
            }
            if ($('#request_input_file')[0].files[0] == null) {
                pagePopup.alramPopup('파일이 등록되지 않았습니다.');
                WitCommon._config.SUBMIT_WRITE = true;
                return false;
            }
            var data = new FormData();
            data.append('phone', $('input[name=request_store_phone]').val());
            data.append('email', $('input[name=request_store_email]').val());
            data.append('contents', $('textarea[name=request_store_contents]').val());
            data.append('requestFile', $('#request_input_file')[0].files[0]);

            try {
                $.ajax({
                    type: 'POST',
                    url: "/request/store",
                    data: data,
                    contentType: false,
                    processData: false,
                    success: function(res) {
                        if (res.code == 200) {
                            pagePopup.closePopup();
                            pagePopup.alramPopup(res.msg);
                        } else {
                            pagePopup.alramPopup(res.msg);
                        }
                    },
                    error: function(xhr, status, error) {
                        WitCommon._config.SUBMIT_WRITE = true;
                        console.log('error');
                    }
                });
            } catch (ex) {
                WitCommon._config.SUBMIT_WRITE = true;
            }
        }
    },
    closeGotoPopup: function() {
        $('.goto-login-popup').removeClass('active');
        $('.goto-reply-login-popup').removeClass('active');
    },
    closeInfoPopup: function() {
        $('.goto-info-popup').removeClass('active');
    },
    closeNormalPopup: function() {
        $('.normal-popup').removeClass('active');
    },
    alramPopup: function(msg) {
        $('.normal-popup #alram_msg').text(msg);
        $('.normal-popup').addClass('active');
    },
    alram2Popup: function(msg) {
        $('.normal-2-popup #alram_msg').text(msg);
        $('.normal-2-popup').addClass('active');
    },
    closeBoardDeletePopup: function() {
        $('.board-delete-popup').removeClass('active');
    },
    providerPopup: function() {
        $('.store-list-popup').addClass('active');
    },
    closeProviderPopup: function() {
        $('.store-list-popup').removeClass('active');
    },
    boardDeletePopup: function(page, bd_id) {
        $('.board-delete-popup #boardDeleteConfirm').removeAttr('onclick');
        $('.board-delete-popup #boardDeleteConfirm').attr('onclick', 'WitCommon.boardDelete("' + page + '", ' + bd_id + ')');
        $('.board-delete-popup').addClass('active');
    },
    closeBoardReportPopup: function() {
        $('.board-report-popup').removeClass('active');
    },
    boardReportPopup: function(page, bd_id) {
        $.get('/report/check', { 'page': page, 'bd_id': bd_id }, function(res) {
            if (res.code == 600) {
                pagePopup.openGotoPopup();
                return false;
            }

            if (res.code == 800) {
                pagePopup.openInfoPopup(res.path);
                return false;
            }

            if (res.code == 900) {
                pagePopup.alram2Popup(res.msg);
                return false;
            }

            if (res.check) {
                pagePopup.alram2Popup('이미 신고한 게시글 입니다.');
            } else {
                $(".board-report-popup .report-text").prop('disabled', true);
                $('.board-report-popup input[type=checkbox]').prop('checked', false);
                $('.board-report-popup .report-text').val('');
                $('.board-report-popup #reportConfirm').removeAttr('onclick');
                $('.board-report-popup #reportConfirm').attr('onclick', 'WitCommon.boardReport("' + page + '", ' + bd_id + ')');
                $('.board-report-popup').addClass('active');
            }
        });
    },
    boardReplyReportPopup: function(page, bd_id, bd_reply_id, type) {
        $.get('/report/boardReply/check', { 'page': page, 'bd_id': bd_id, 'bd_reply_id': bd_reply_id }, function(res) {
            if (res.code == 600) {
                pagePopup.openGotoPopup();
                return false;
            }

            if (res.code == 800) {
                pagePopup.openInfoPopup(res.path);
                return false;
            }

            if (res.code == 900) {
                pagePopup.alram2Popup(res.msg);
                return false;
            }

            if (res.check) {
                pagePopup.alram2Popup('이미 신고한 댓글 입니다.');
            } else {
                $(".board-report-popup .report-text").prop('disabled', true);
                $('.board-report-popup input[type=checkbox]').prop('checked', false);
                $('.board-report-popup .report-text').val('');
                $('.board-report-popup #reportConfirm').removeAttr('onclick');
                $('.board-report-popup #reportConfirm').attr('onclick', 'WitCommon.boardReplyReport("' + page + '", ' + bd_id + ', ' + bd_reply_id + ', "' + type + '")');
                $('.board-report-popup').addClass('active');
            }
        });
    },
    openNewsPhoto: function(newsId) {
        //WitCommon.lockParentScroll();
        $.get('/board/news/photo/' + newsId, function(res) {
            $('.index-box .news-photo-popup').html("");
            $('.index-box .news-photo-popup').html(res);
            $('.news-photo-popup').addClass('active');
        });
    },
    closeNewsPhoto: function() {
        WitCommon.unlockParentScroll();
        $('.popup-wrapper').removeClass('active');
    },
    openPetType: function() {
        $('input[name=q3]').prop('checked', false);
        $('.mypage-petType-popup').addClass('active');
    },
    openAddPetForm: function() {
        var type = $('input[name=q3]:checked').val();

        $.get('/mypage/add/pet/' + type, function(res) {
            if (type == 'dog') {
                pagePopup.closePopup();
                $('.index-box .mypage-petAddDog-popup').html("");
                $('.index-box .mypage-petAddDog-popup').html(res);
                $('.mypage-petAddDog-popup').addClass('active');
            } else if (type == 'cat') {
                pagePopup.closePopup();
                $('.index-box .mypage-petAddCat-popup').html("");
                $('.index-box .mypage-petAddCat-popup').html(res);
                $('.mypage-petAddCat-popup').addClass('active');
            } else {
                pagePopup.alram2Popup('반려동물을 선택해주세요.');
            }
        });
    },
    openUpdatePetForm: function(type, id) {
        pagePopup.closePopup();

        $.get('/mypage/update/pet/' + id, function(res) {
            if (type == 'dog') {
                $('.index-box .mypage-petAddDog-popup').html("");
                $('.index-box .mypage-petAddDog-popup').html(res);

                $('.mypage-petAddDog-popup').addClass('active');
            } else {
                $('.index-box .mypage-petAddCat-popup').html("");
                $('.index-box .mypage-petAddCat-popup').html(res);

                $('.mypage-petAddCat-popup').addClass('active');
            }
        });
    },
    openAddWriteImg: function() {
        alert('aaaaa');
    },
    openPetDetail: function(id) {
        $.get('/mypage/detail/pet/' + id, function(res) {
            console.log(res.data);
            var data = res.data;
            if (res.code == 200) {
                if (data.gender == 'M') {
                    $('.mypage-petDetail-popup #myPet_gender').attr('src', '/web/img/ico_gender02.png');
                } else if (data.gender == 'W') {
                    $('.mypage-petDetail-popup #myPet_gender').attr('src', '/web/img/ico_gender01.png');
                } else {
                    $('.mypage-petDetail-popup #myPet_gender').attr('src', '');
                }
                if (data.neutrality == 'Y') {
                    $('.mypage-petDetail-popup #myPet_gender_text').text('(중성화)');
                } else {
                    $('.mypage-petDetail-popup #myPet_gender_text').text('');
                }
                if (data.birthday_check == 'Y') {
                    $('.mypage-petDetail-popup #myPet_age_check').text('(추정)');
                } else {
                    $('.mypage-petDetail-popup #myPet_age_check').text('');
                }
                if (data.img != null) {
                    $('.mypage-petDetail-popup #myPet_img').css({ "background": "url('" + data.img_url + "') center center no-repeat", 'background-size': 'cover' });
                } else {
                    $('.mypage-petDetail-popup #myPet_img').css({ "background": "" });
                }
                $('.mypage-petDetail-popup #myPet_name').text(data.name != null ? data.name : '-');
                $('.mypage-petDetail-popup #myPet_kind').text(data.kind != null ? data.kind : '-');
                $('.mypage-petDetail-popup #myPet_age').text((data.age != null) ? data.age : '-');
                $('.mypage-petDetail-popup #myPet_weight').text((data.weight != null) ? data.weight + "kg" : '-');

                if (data.pet_type == 'dog') {
                    $('.mypage-petDetail-popup #detail_length').hide();
                    $('.mypage-petDetail-popup #detail_form').hide();
                    $('.mypage-petDetail-popup #detail_pattern').hide();
                    $('.mypage-petDetail-popup #detail_nack').show();
                    $('.mypage-petDetail-popup #detail_back').show();
                    $('.mypage-petDetail-popup #detail_chest').show();
                    $('.mypage-petDetail-popup #detail_size').show();

                    $('.mypage-petDetail-popup #myPet_nack').text((data.nack != null) ? data.nack + "cm" : '-');
                    $('.mypage-petDetail-popup #myPet_back').text((data.back != null) ? data.back + "cm" : '-');
                    $('.mypage-petDetail-popup #myPet_chest').text((data.chest != null) ? data.chest + "cm" : '-');
                    $('.mypage-petDetail-popup #myPet_size').text((data.size != null) ? data.size : '-');
                } else {
                    $('.mypage-petDetail-popup #detail_nack').hide();
                    $('.mypage-petDetail-popup #detail_back').hide();
                    $('.mypage-petDetail-popup #detail_chest').hide();
                    $('.mypage-petDetail-popup #detail_size').hide();
                    $('.mypage-petDetail-popup #detail_length').show();
                    $('.mypage-petDetail-popup #detail_form').show();
                    $('.mypage-petDetail-popup #detail_pattern').show();
                    $('.mypage-petDetail-popup #myPet_length').text(data.length != null ? data.length : '-');
                    $('.mypage-petDetail-popup #myPet_form').text(data.form != null ? data.form : '-');
                    $('.mypage-petDetail-popup #myPet_pattern').text(data.pattern != null ? data.pattern : '-');
                }
                $('.mypage-petDetail-popup #myPet_uniqueness').text(data.uniqueness != null ? data.uniqueness : '-');
            }
            if (data.pet_mine == 'Y') {
                var myPetMine = '<button id="myPet_update" type="button" onclick="pagePopup.openUpdatePetForm(\'' + data.pet_type + '\',' + id + ')"><img src="/web/img/ico_modify.png" alt="">수정</button>';
                myPetMine += '<button id="myPet_delete" type="button" onclick="pagePopup.openPetDelete(' + id + ')"><img src="/web/img/ico_trash_v2.png" alt="">삭제</button>';
                $('.mypage-petDetail-popup #myPet_mine').html(myPetMine);
            }
            $('.mypage-petDetail-popup').addClass('active');
        });
    },
    openPetDelete: function(id) {
        $('.mypage-petDelete-popup #deletePet').removeAttr('onclick');
        $('.mypage-petDelete-popup #deletePet').attr('onclick', 'pageMypage.deletePet(' + id + ')');
        $('.mypage-petDelete-popup').addClass('active');
    },
    openBoardSel: function(type) {
        $('.index-box .board-select-popup .item-list').html("");
        var html = '';

        if (type == 'news') {
            html += '<li>댕냥한컷</li>';
            html += '<li>댕냥일기</li>';
            html += '<li>댕냥뉴스</li>';
        } else if (type == 'bulletin') {
            html += '<li>댕냥게시판</li>';
            html += '<li>자유게시판</li>';
            html += '<li>고민게시판</li>';
            html += '<li>유머게시판</li>';
        }
        $('.index-box .board-select-popup .item-list').html(html);
        $("input[name='board_type']").val(type);
        $('.board-select-popup').addClass('active');

        $('.drop-content .item-list li').click(function() {
            var listValue = $(this).text();
            $(this).parent().siblings().children('span').text(listValue);
            $(this).parent().fadeOut().siblings().removeClass('active').children('img').attr("src", $(this).parent().siblings().children('img').attr("src").replace("up", "down"));
            $("input[name='board_link']").val(listValue);
        });
    },
    link: function() {
        var url = '';
        var type = $("input[name='board_type']").val();
        var link = $("input[name='board_link']").val();

        if (type == 'news') {
            url = '/board/write/news/' + link;
        } else if (type == 'bulletin') {
            url = '/board/bulletin/write/' + link;
        }
        location.href = url;
    },
    openWriteCategory: function(type) {
        $('.' + type + '-category-popup').addClass('active');
    },
    gotoWrite: function(type) {
        var board_type = WitCommon.setBoardType($('.' + type + '-category-popup .drop-item span').text());

        if (type == 'dog') {
            location.href = '/community/write/' + type + '?board_type=' + board_type;
        } else if (type == 'cat') {
            location.href = '/community/write/' + type + '?board_type=' + board_type;
        } else if (type == 'knowhow') {
            var pet_type = $('input[name=pet_type]').val();
            if (pet_type == 'cat') {
                location.href = '/board/write/cat/knowhow?board_type=' + board_type;
            } else if (pet_type == 'dog') {
                location.href = '/board/write/dog/knowhow?board_type=' + board_type;
            }
        } else if (type == 'news') {
            if (board_type == 'news') {
                location.href = '/board/bulletin/write/' + board_type;
            } else {
                location.href = '/board/write/pet/news/' + board_type;
            }
        } else if (type == 'bulletin') {
            location.href = '/board/bulletin/write/' + board_type;
        } else if (type == 'qna') {
            location.href = '/board/write/qna?pet_type=' + board_type;
        } else if (type == 'story') {
            location.href = '/story/write/' + board_type;
        }
    },
    insertComment: function(msg, page, bd_id, pageNum, view) {
        if (page == 'qna') {
            WitCommon.getCommentImage(page, bd_id, pageNum);
        } else if (page == 'photo') {
            WitCommon.getCommentPhoto(page, bd_id, pageNum);
        } else {
            WitCommon.getCommentNormal(page, bd_id, pageNum, view);
        }
    },
    openPushDeleteAll: function() {
        $('.push-delete-popup #alram_msg').text('모든 알림을 삭제하시겠습니까?');
        $('.push-delete-popup #pushDeleteConfirm').removeAttr('onclick');
        $('.push-delete-popup #pushDeleteConfirm').attr('onclick', 'pagePush.deleteAll()');
        $('.push-delete-popup').addClass('active');
    },
    openPushDeleteOne: function(t) {
        $('.push-delete-popup #alram_msg').text('선택한 알림을 삭제하시겠습니까?');
        $('.push-delete-popup #pushDeleteConfirm').removeAttr('onclick');
        $('.push-delete-popup #pushDeleteConfirm').attr('onclick', 'pagePush.deleteOne(' + t + ')');
        $('.push-delete-popup').addClass('active');
    },
    closePushDeletePopup: function() {
        $('.push-delete-popup').removeClass('active');
    },
    openQnaSelectComment: function(bd_reply_id, bd_id, page, pageNum) {
        $('.select-comment-popup #selectComment').removeAttr('onclick');
        $('.select-comment-popup #selectComment').attr('onclick', 'pageKinDetail.selectComment(' + bd_reply_id + ', ' + bd_id + ', "' + page + '", ' + pageNum + ')');
        $('.select-comment-popup').addClass('active');
    },
    completeQnaSelectComment: function(page, bd_id, pageNum) {
        $('.select-complete-popup .closed').attr('onclick', 'WitCommon.getCommentImage("' + page + '", ' + bd_id + ', ' + pageNum + '); pagePopup.closePopup();');
        $('.select-complete-popup #selectConfirm').attr('onclick', 'WitCommon.getCommentImage("' + page + '", ' + bd_id + ', ' + pageNum + '); pagePopup.closePopup();');
        $('.select-complete-popup').addClass('active');
    },
    openDeleteReplyPopup: function(page, bd_id, bd_reply_id, boardType, deleteType, pageNum) {
        $('.delete-comment-popup #deleteComment').removeAttr('onclick');
        $('.delete-comment-popup #deleteComment').attr('onclick', 'WitCommon.deleteReply("' + page + '", ' + bd_id + ', ' + bd_reply_id + ', "' + boardType + '", "' + deleteType + '", ' + pageNum + ')');
        $('.delete-comment-popup').addClass('active');
    },
    closeDeleteReplyPopup: function() {
        $('.delete-comment-popup').removeClass('active');
    },
    openKnowhowPopup: function(type) {
        $('.' + type + '-category-popup').removeClass('active');
        var pet_type = $('.' + type + '-category-popup .drop-item span').text();
        if (pet_type == '고양이') {
            pet_type = 'cat';
        } else {
            pet_type = 'dog';
        }
        $('input[name=pet_type]').val(pet_type);
        $('.knowhow-category-popup').addClass('active');
    },
    openPetTypeSelectPopup: function() {
        $('.animal-category-popup').addClass('active');
    },
    closeProductTagPopup: function(t, i) {
        // if(WitCommon._config.CURRENT_BROWSER == 'IE'){    //IE version
        //
        // }else{    //other browser
        //     $('input[name='+t+'_tag_img]').eq(i).replaceWith(pagePopup._config.tempInputElement.clone());
        // }
        $('.product-tag-popup').removeClass('active');
    },
    openProductTagPopup: function(t, i, old_sub_img_index, sectionId) {
        //기존 팝업의 데이터 초기화
        $('.add-tag-popup').css('display', 'none');
        $('.preview-box').css('height', '');
        $('#tag_img_view').attr('src', '/web/img/upload-preview.png');
        $('#tag_img_view').addClass('target');
        $('.product-tag-popup #addComment').removeClass('onclick');
        $('.product-tag-popup #addImage').removeClass('onclick');
        $('button[name=close_popup_tag_btn]').removeClass('onclick');
        $('#tag_img_view').removeAttr('style');
        $('#product_tag_item').empty();
        $('.product-tag-popup').find('[name=video_url]').removeAttr('value');
        $('.product-tag-popup').find('#imgFile').click();
        if ($("[name=boardType]").val() == "photo") {
            $('.product-tag-popup').find('#imgFile').parent(".radio").remove();
            $('.product-tag-popup').find('#videoFile').parent(".radio").remove();
        }
        $('input[name=origin_src]').val('');
        $('input[name=temp_tag_img]').remove();
        $('input[name=area_t]').val(t);
        $('input[name=area_i]').val(i);

        //
        // if(WitCommon._config.CURRENT_BROWSER == 'IE'){    //IE version
        //     pagePopup._config.tempInputElement = $('input[name='+t+'_tag_img]').eq(i);
        // }else{    //other browser
        //     pagePopup._config.tempInputElement = $('input[name='+t+'_tag_img]:eq('+i+')').clone();
        // }

        var inputfile = '<input type="file" name="temp_tag_img" accept="image/*, .jfif" style="display: none;">';
        $('.product-tag-popup').find('.preview-title').append(inputfile);

        if (t == 'sub') {
            $('input[name=img_index]').val(i + 1);
            if ($('div[name=' + t + '_preview]').eq(i).find('[name=' + t + '_img]').attr('src') != null) {
                $('.preview-box').css('height', 'auto');
                $('#tag_img_view').removeClass('target');
            }
            $('#tag_img_view').attr('src', $('div[name=' + t + '_preview]').eq(i).find('[name=' + t + '_img]').attr('src'));
            $('#product_tag_item').append($('div[name=sub_preview]').eq(i).children('.tag-item').html());
        } else if (t == 'main') {
            $('input[name=img_index]').val(i);
            if ($('div[name=' + t + '_preview]').eq(i).find('[name=' + t + '_img]').attr('src') != null) {
                $('.preview-box').css('height', 'auto');
                $('#tag_img_view').removeClass('target');
            }
            $('#tag_img_view').attr('src', $('div[name=' + t + '_preview]').eq(i).find('[name=' + t + '_img]').attr('src'));
            $('input[name=origin_src]').val($('div[name=' + t + '_preview]').eq(i).find('[name=' + t + '_img]').attr('src'));
            $('#product_tag_item').append($('div[name=main_preview]').eq(i).children('.tag-item').html());
        } else if (t == 'news' + i) {
            $('#tag_img_view').attr('src', $(".write-crob-img-wrapper li").eq(i).find("img").attr("src"));
        }
        $('#product_tag_item').children('button').attr('onclick', 'pagePopup.openProductTagUpdatePopup(this)');
        $('#product_tag_item').append($(".write-crob-img-wrapper li").eq(i).children('.tag-item').html());
        if ($("[name=page]").val() == "story") {
            $('.product-tag-popup #addComment').attr('onclick', 'pageStory.imageInContent(\'' + t + '\',' + i + ',' + old_sub_img_index + ',\'' + sectionId + '\')');
        } else if ($("[name=boardType]").val() == "photo") {
            console.log("i : " + i);
            if (i >= 5) {
                pagePopup.alramPopup('사진은 최대 5장까지 추가 가능합니다.');
                return false;
            } else {
                $('.product-tag-popup #addComment').attr('onclick', 'pageSnsWrite.imageInContent(\'' + t + '\',' + i + ',' + old_sub_img_index + ',\'' + sectionId + '\')');
                $('#product_tag_item').children('button').attr('onclick', 'pagePopup.openProductTagUpdatePopup(this)');
                $('.product-tag-popup #add_tag_update_btn').attr('onclick', 'pageSnsWrite.updateTag()');
            }
            $('.product-tag-popup #add_tag_submit_btn').attr('onclick', 'pageSnsWrite.addTag()');
        } else {
            $('.product-tag-popup #addComment').attr('onclick', 'pageBlogWrite.imageInContent(\'' + t + '\',' + i + ',' + old_sub_img_index + ',\'' + sectionId + '\')');
        }
        //$('.product-tag-popup #addImage').attr('onclick', '$(\'input[name='+t+'_tag_img]:eq('+i+')\').click()');
        $('.product-tag-popup #addImage').attr('onclick', '$(\'input[name=temp_tag_img]\').click()');
        $('button[name=close_popup_tag_btn]').attr('onclick', 'pagePopup.closeProductTagPopup(\'' + t + '\',' + i + ')');

        //pageBlogWrite.readImage($('input[name='+t+'_tag_img]')[i], '#tag_img_view');


        $('.product-tag-popup').addClass('active');
    },
    openSharePopup: function() {
        $('.share-sns-popup').addClass('active');
    },
    openProductTagAddPopup: function(x, y) {
        console.log("!!!");
        if (!$('.product-tag-popup').hasClass('active')) {
            $('.product-tag-popup').addClass('active');
        }
        //초기화 함수
        $('.add-tag-popup #tag_x').val('');
        $('.add-tag-popup #tag_y').val('');
        $('input[name=searchCase]').eq(0).click();
        $('#tf_search_product').val('');
        $('#custom_product_title').val('');
        $('#custom_product_url').val('');
        $('#custom_product_content').val('');
        $('#search_product_src').val('');
        $('#search_product_id').val('');
        $('.search-item.product').empty();
        $('#add_tag_update_btn').hide();
        $('#add_tag_submit_btn').show();

      
        $('.add-tag-popup #tag_x').val(x);
        $('.add-tag-popup #tag_y').val(y);
        if ($('.add-tag-popup').css('display') != 'block') {
            $('.add-tag-popup').css('display', 'block');
        }

    },
    openProductTagUpdatePopup: function(obj) {
        if ($(obj).attr('id') == 'temp_tag_button') {
            return false;
        }
        $('#temp_tag_button').remove();
        $('#tf_search_product').val('');
        $('#custom_product_title').val('');
        $('#custom_product_url').val('');
        $('#custom_product_content').val('');
        $('#search_product_id').val('');
        $('.search-item.product').empty();
        $('#add_tag_update_btn').show();
        $('#add_tag_submit_btn').hide();
        pagePopup._config.updateTaget = null;

        pagePopup._config.updateTaget = obj;

        if ($(obj).next().children('[name=product_id]').val() != '') {
            $('input[name=searchCase]').eq(0).click();
            $('#tf_search_product').val($(obj).next().children('[name=name]').val())
            $('#search_product_id').val($(obj).next().children('[name=product_id]').val())
            $('#search_product_src').val($(obj).next().children('[name=img_url]').val())
        } else if ($(obj).next().children('[name=custom_title]').val() != '') {
            $('input[name=searchCase]').eq(1).click();
            $('#search_product_id').val($(obj).next().children('[name=product_id]').val(''))
            $('#custom_product_title').val($(obj).next().children('[name=custom_title]').val())
            $('#custom_product_url').val($(obj).next().children('[name=custom_url]').val())
            $('#custom_product_content').val($(obj).next().children('[name=custom_contents]').val())
        } else {
            $('input[name=searchCase]').eq(0).click();
        }

        if ($('.add-tag-popup').css('display') != 'block') {
            $('.add-tag-popup').css('display', 'block');
        }

    },
    closeProductTagAddPopup: function() {
        $('.product-tag-popup').find('#temp_tag_button').remove();
        $('.add-tag-popup').css('display', 'none');
    },
    openQnaPopup: function() {
        $('.qna-category-popup').addClass('active');
    },
    readImage: function(input, val, t, i) {
        if (input.files && input.files[0]) {
            //파일의 확장자명
            var extension = input.files[0].name.substring(input.files[0].name.lastIndexOf('.') + 1, input.files[0].name.length);

            pagePopup.openProgressPopup('로딩중 입니다. 잠시만 기다려주세요.');
            var orientation = 0;
            try {
                if (extension.toLowerCase() == 'gif') {
                    $(val).attr('src', window.URL.createObjectURL(input.files[0]));
                    $('.preview-box').css('height', 'auto');
                    $(val).removeClass("target");
                    pagePopup.closeProgressPopup();
                } else {
                    EXIF.getData(input.files[0], function() {
                        orientation = EXIF.getTag(input.files[0], 'Orientation');
                        var rotate = 0;
                        switch (orientation) {
                            case 0:
                                rotate = 0;
                                break;
                            case 1:
                                rotate = 0;
                                break;
                            case 2:
                                rotate = 0;
                                break;
                            case 3:
                                rotate = 180;
                                break;
                            case 4:
                                rotate = 180;
                                break;
                            case 5:
                                rotate = 90;
                                break;
                            case 6:
                                rotate = 90;
                                break;
                            case 7:
                                rotate = -90;
                                break;
                            case 8:
                                rotate = -90;
                                break;
                            default:
                                rotate = 0;
                                break;
                        }

                        $('.' + t + '-wrapper').eq(i).find('[name=' + t + '_orientation]').val(rotate);
                        if (WitCommon._config.CURRENT_BROWSER == 'CHROME' || rotate == 0) {
                            loadImage(input.files[0], function(image, data) {
                                $(val).attr('src', WitCommon.getUrlToBlobUrl(image.toDataURL()));
                                $('.preview-box').css('height', 'auto');
                                $(val).removeClass("target");
                                pagePopup.closeProgressPopup();
                            }, { orientation: 1, maxWidth: 1055 });
                        }
                        if (WitCommon._config.CURRENT_BROWSER != 'CHROME' && rotate != 0) {
                            loadImage(input.files[0], function(image, data) {
                                $(val).attr('src', WitCommon.getUrlToBlobUrl(image.toDataURL()));
                                $('.preview-box').css('height', 'auto');
                                $(val).removeClass("target");
                                pagePopup.closeProgressPopup();
                            }, { orientation: true, maxWidth: 1055 });
                        }

                    });
                }
            } catch (e) {
                pagePopup.closeProgressPopup();
            }
        }
    },
    openSubmitPopup: function(msg) {
        $('.submit-popup').addClass('active');
        $('.normal-popup #alarm_msg').text(msg);
    },
    closeSubmitPopup: function() {
        $('.submit-popup').removeClass('active');
    },
    readFile: function(input, val) {
        if (input.files && input.files[0]) {
            if (input.files[0].size >= 3 * 1024 * 1024) {
                pagePopup.alramPopup('제한 용량 초과');
                //올라온 file 삭제
                if (WitCommon._config.CURRENT_BROWSER == 'IE') { //IE version
                    $(input).replaceWith($(input).clone(true));
                } else { //other browser
                    $(input).val("");
                }
                $(val).val('');
                return false;
            }
            $(val).val(input.value)
        }
    },
    openFilePopup: function(t, i) {
        //초기화
        $('.file-type-category-popup').find('.drop-item').children('span').text('선택해주세요.');
        $('.file-type-category-popup .submit').css('background-color', 'gray');
        $('.file-type-category-popup .submit').prop('disabled', true);
        $('.file-type-category-popup').find('[name=type]').val('');
        $('.file-type-category-popup').find('[name=idex]').val('');

        $('.file-type-category-popup').addClass('active');
        $('.file-type-category-popup').find('[name=type]').val(t);
        $('.file-type-category-popup').find('[name=index]').val(i);
    },
    closeFilePopup: function() {
        $('.file-type-category-popup').removeClass('active');
    },
    openSelectPopup: function() {
        var fileType = $('.file-type-category-popup .drop-item span').text();
        pagePopup.closeFilePopup();
        if (fileType == '이미지') {
            pagePopup.openProductTagPopup($('.file-type-category-popup').find('[name=type]').val(), $('.file-type-category-popup').find('[name=index]').val());

        } else if (fileType == '동영상URL') {
            pagePopup.openVideoUrlPopup($('.file-type-category-popup').find('[name=type]').val(), $('.file-type-category-popup').find('[name=index]').val());
        }
    },
    closeVideoUrlPopup: function() {
        $('.video-url-popup').removeClass('active');
    },
    openVideoUrlPopup: function(t, i) {
        $('.video-url-popup .submit').removeAttr('onclick');
        $('.video-url-popup').find('[name=video_url]').val('');
        $('.video-url-popup').addClass('active');
        $('.video-url-popup .submit').attr('onclick', 'pageBlogWrite.videoInContent(\'' + t + '\',' + i + ')');

    },

    followListPopup: function(target, id) {
        $.get('/mypage/follow/list', { 'id': id, 'target': target }, function(res) {
            if (res.code == 200) {
                if (res.target == 'sender') {
                    $('.follow-list-popup .follow-target').text('팔로잉');
                } else {
                    $('.follow-list-popup .follow-target').text('팔로워');
                }

                $('.follow-list-popup .follow-item').html("");
                var html = '';

                for (var i = 0; i < res.cnt; i++) {
                    html += '<li>';
                    html += '<div class="user-wrap" onclick="location.href=\'/follower/main/' + res.data[i].id + '/home?page=1\'">';
                    html += '<div class="follow-profile" style="' + res.data[i].userImg + '"></div>';
                    html += '<div class="follow-name">';
                    html += '<p>' + res.data[i].nickname + '</p>';
                    html += '</div>';
                    html += '</div>';
                    html += '<div class="btn-box">';
                    html += '<button type="button" class="follow ' + res.data[i].userStatus + ' followWrite_' + res.data[i].id + '" onclick="WitCommon.boardFollow(' + id + ',' + res.data[i].id + ', \'board\')">팔로잉</button>';
                    html += '</div>';
                    html += '</li>';
                }
                $('.index-box .follow-list-popup .follow-item').html(html);
            }
        });
        $('.follow-list-popup').addClass('active');
    },
    followMemberListPopup: function(target, id, userId) {
        $.get('/follower/followMember/list', { 'id': id, 'target': target, 'userId': userId }, function(res) {
            if (res.code == 200) {
                if (res.target == 'sender') {
                    $('.follow-list-popup .follow-target').text('팔로잉');
                } else {
                    $('.follow-list-popup .follow-target').text('팔로워');
                }

                $('.follow-list-popup .follow-item').html("");
                var html = '';

                for (var i = 0; i < res.cnt; i++) {
                    console.log(res.data[i].userStatus);
                    html += '<li>';
                    html += '<div class="user-wrap" onclick="location.href=\'/follower/' + res.data[i].id + '/home?page=1\'">';
                    html += '<div class="follow-profile" style="' + res.data[i].userImg + '"></div>';
                    html += '<div class="follow-name">';
                    html += '<p>' + res.data[i].nickname + '</p>';
                    html += '</div>';
                    html += '</div>';
                    html += '<div class="btn-box">';
                    if (res.data[i].userStatus == "active") {
                        html += '<button type="button" class="follow ' + res.data[i].userStatus + ' followWrite_' + res.data[i].id + '" onclick="WitCommon.boardFollow(' + userId + ',' + res.data[i].id + ', \'board\')">팔로잉</button>';
                    } else {
                        html += '<button type="button" class="follow ' + res.data[i].userStatus + ' followWrite_' + res.data[i].id + '" onclick="WitCommon.boardFollow(' + userId + ',' + res.data[i].id + ', \'board\')">팔로우</button>';
                    }
                    html += '</div>';
                    html += '</li>';
                }
                $('.index-box .follow-list-popup .follow-item').html(html);
            }
        });
        $('.follow-list-popup').addClass('active');
    },
    openProgressPopup: function(msg) {
        $('.progress-popup').find('p').empty();
        $('.progress-popup').find('p').append(msg);
        $('.progress-popup').addClass('active');

    },
    closeProgressPopup: function() {
        $('.progress-popup').removeClass('active');
    },
    cancelAddUserInfo: function() {
        $('.add-userInfo-popup').addClass('active');
    },
    openGuidePopup: function() {
        $('.guide-popup').addClass('active');
    },
    openTempPopup: function() {
        $('.preview-check-popup').addClass('active');
    },
    openCompletePopup: function() {
        $('.write-complete-popup').addClass('active');
    },
    openCropPopup: function() {
        $('.preview-crob-popup').addClass('active');
    },
    openPreviewPopup: function() {
        $('.preview-popup').addClass('active');
        // [ 2차 ] 미리보기 팝업
        var target = $('.preview-popup').children(".popup-content").children("div").children(".popup-inner").children(".side-title");
        var main_html = "";

        var preview_img_name = crob_preview_img_name.replace(/[0-9]/g, ""); // 크롭된 이미지 명 (ex: main, sub...)
        //var preview_img_number = crob_preview_img_name.replace(/[^0-9]/g, "");		// 크롭된 이미지의 번호 (ex: 0, 1, 2, 3...)
        //console.log(preview_img_name);
        // 메인 제목
        target.children("h2").text($("[name=main_title]").val());
        // 메인 비디오
        var video_type = $("[name=main_video]");
        // 서브 비디오
        var sub_video_type = $("[name=sub_video]");

        //.children(".image-section").children(".main-img").html('<img name="main_img" src="'+$('[name=main_img]').attr('src')+'">');
        // 메인 카테고리
        target.children("div").children("p").children("span").text($(".category_name").children("span").text());
        // 메인 내용
        $('#ir0').val(editor_0.getContents());
        $('#ir1').val(editor_1.getContents());

        for (var i = 0; i < textareaUseIdList.length; i++) {
            setTextareaContents(textareaUseIdList[i]);
        }

        var crob_img_active = $(".write-crob-thumb.active");
        crob_img_active = (typeof(crob_img_active) != "undefined") ? crob_img_active.parent().index() : null;

        if (crob_img_active != null) {
            var active_name = null;
            active_name = (crob_img_active <= 0) ? 'main0' : ('sub' + (crob_img_active - 1));
        }
        var main_preview = $("[name='main_preview']");
        var main_thumb_type_length = main_preview.find("img").length;
        var main_video_type_length = main_preview.find("iframe").length;

        main_html += '<div class="image-section">';
        main_html += '	<div class="tag-item main-img">';
        if (main_thumb_type_length > 0) {
            main_html += '		<img name="main_img" src="' + $('[name=main_img]').attr('src') + '">';
        } else if (main_video_type_length > 0) {
            main_html += '		<iframe width="100%" height="593px" src="' + setVideoUrl(main_preview.find("iframe").attr("src")) + '" frameborder="0" allow="autoplay;" allowfullscreen></iframe>';
        }
        /*if ($("[name=main_video]").val() != "" && video_type.length > 0) {
        	main_html += '		<iframe width="100%" height="593px" src="'+setVideoUrl($("[name=main_video]").val())+'" frameborder="0" allow="autoplay;" allowfullscreen></iframe>';
        } else {
        	if (active_name === 'main0') {
        		// 여기다가 src 추가
        		main_html += '		<img name="main_img" src="'+ $('[name=main_img]').attr('src') +'">';	
        	} else {
        		if (typeof $('[name=main_img]').attr('src') !== "undefined") {
        			main_html += '		<img name="main_img" src="'+$('[name=main_img]').attr('src')+'">';					
        		}
        	}
        }*/
        main_html += '	</div>';
        main_html += '</div>';
        main_html += '<div class="text-section sun-editor-editable">';
        main_html += $('textarea[name=main_content]').val();
        main_html += '</div>';

        target.siblings(".inner-box").html(main_html);

        // 서브 

        // 이미지
        var sub_html = "";
        var sub_img_arr = new Array();
        var sub_video_arr = new Array();
        var sub_img_cnt = $(".sub-wrapper").length;
        var sub_video_cnt = $("[name=sub_video]").length;

        $('.sub-container').empty();

      
        var sub_preview = $("[name='sub_preview']");

        for (var i = 0; i < $(".sub-wrapper").length; i++) {
            //var sub_write_inner = sub_preview.parent().parent().eq(i);		
            var sub_thumb_type_length = sub_preview.eq(i).find("img").length;
            var sub_video_type_length = sub_preview.eq(i).find("iframe").length;

            sub_html += '<h2 class="sub-title">' + $("[name=sub_title]").eq(i).val() + '</h2>';
            sub_html += '<div class="inner-box">';
            sub_html += '	<div class="image-section">';
            sub_html += '		<div class="tag-item">';
            if (sub_thumb_type_length > 0) {
                sub_html += '	<img name="sub_img1" src="' + sub_preview.eq(i).find("img").attr("src") + '" alt="">';
            } else if (sub_video_type_length > 0) {
                sub_html += '	<iframe width="100%" height="593px" src="' + setVideoUrl(sub_preview.eq(i).find("iframe").attr("src")) + '" frameborder="0" allow="autoplay;" allowfullscreen></iframe>';
            }
            /*if (typeof sub_img_arr[i] != "undefined") {
            	sub_html +=				sub_img_arr[i];
            } 
            if (typeof sub_video_arr[i] != "undefined") {
            	sub_html +=				sub_video_arr[i];
            }*/
            sub_html += '		</div>';
            sub_html += '	</div>';
            sub_html += '</div>';
            sub_html += '<div class="text-section sun-editor-editable">';
            sub_html += $('textarea[name=sub_content]').eq(i).val();
            sub_html += '</div>';
            sub_html += '<div class="tag-item sub-img"></div>';

            $('.sub-container').html(sub_html);
        }

        // 프로필
        var target_parent_kind = "";
        if ($("[name=checkedAnimal]").val() > 0 && $("[name=checkedAnimal]").val() != "self") {
            target.siblings(".side-content").children(".side-content-inner").children(".animal-list").css("display", "block");
            var target_kind = "";
            target_parent_kind = target.siblings(".side-content").children(".side-content-inner").children(".animal-list").children(".animal_kind").children("tbody").children("tr:nth-child(2)");
            $("#info_" + $("[name=checkedAnimal]").val()).children(".animal-list").children(".animal_kind1").children("tbody").children("tr").each(function(i) {
                target_kind = $("#info_" + $("[name=checkedAnimal]").val()).children(".animal-list").children(".animal_kind1").children("tbody").children("tr").children("td").eq(i).text();
                //console.log(target_kind);
                target_parent_kind.children("td").eq(i).text(target_kind);
            });
        } else if ($("[name=checkedAnimal]").val() == "self") {
            target.siblings(".side-content").children(".side-content-inner").children(".animal-list").css("display", "block");
            target_parent_kind = target.siblings(".side-content").children(".side-content-inner").children(".animal-list").children(".animal_kind").children("tbody").children("tr:nth-child(2)");
            //console.log(target_parent_kind);
            for (var i = 0; i < 5; i++) {
                target_parent_kind.children("td").eq(i).text('');
            }
            // 이름
            if ($("[name=pet_name]").val() != "") {
                target_parent_kind.children("td").eq(0).text($("[name=pet_name]").val());
            }
            // 성별
            if ($("input[name=gender]:checked").val() != "" && typeof $('input[name=gender]:checked').val() != "undefined") {
                var neutrality = "";
                var gender = "";

                // 중성화 유무
                if ($("input[name=neutrality]:checked").val() == "Y") {
                    neutrality = "(중성화)";
                } else {
                    neutrality = "";
                }

                // 성별
                if ($("input[name=gender]:checked").val() == "M") {
                    gender = "수컷";
                } else {
                    gender = "암컷";
                }

                target_parent_kind.children("td").eq(1).text(gender + neutrality);
            }
            // 견,묘 종
            if ($("[name=pet_kind]").val() != "") {
                //console.log($("[name=pet_kind]").val());
                target_parent_kind.children("td").eq(2).text($("[name=pet_kind]").val());
            }
            // 나이
            if ($("#birth_year").text() != "연도") {
                var birth_check = "";

                // 중성화 유무
                if ($("input[name=birth_check]:checked").val() == "Y") {
                    birth_check = "(추정)";
                } else {
                    birth_check = "";
                }

                var age = pagePopup.getAgeFromBirthDay($("#birth_year").text() + "/" + $("#birth_month").text() + "/" + $("#birth_day").text());
                target_parent_kind.children("td").eq(3).text(age + "살" + birth_check);
            }
            // 몸무게
            if ($("[name=pet_weight]").val() != "") {
                target_parent_kind.children("td").eq(4).text($("[name=pet_weight]").val() + "kg");
            }
        } else {
            target.siblings(".side-content").children(".side-content-inner").children(".animal-list").css("display", "none");
        }
    },
    // [ 2차 ] 나이 구하기
    getAgeFromBirthDay: function(birth_day) {
        // 전달받은 생년월일로 Date 객체 생성한다. 이하 생년월일 객체라고 칭한다.
        var birthday = new Date(birth_day);
        // 오늘 날짜 기준으로 나이를 구하기 위해 Date 객체 생성한다. -> 이하 오늘날짜 객체라고 칭한다.
        var today = new Date();
        // 오늘날짜 객체의 연도에서 생년월일 객체의 연도를 뺀다.
        var years = today.getFullYear() - birthday.getFullYear();

        return years;
    }
};
