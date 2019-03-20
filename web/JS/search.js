var PageContext = $("#PageContext").val();
var keyword = GetQueryString('keyword');


function add_href() {
    $(".nav-justified a").each(function(){
       $(this).attr('href', $(this).attr('href')+'?keyword='+keyword)
    });
}

function GetQueryString(name)
{
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = decodeURI(window.location.search).substr(1).match(reg);
    if(r!=null) return  unescape(r[2]); return null;
}

function get_class_type(class_type_in) {
    var class_type;
    console.log(class_type_in);
    switch (class_type_in) {
        case 1:
            class_type='前端设计';
            break;
        case 2:
            class_type='后台设计';
            break;
        case 3:
            class_type='基础理论';
            break;
        case 4:
            class_type='嵌入式';
            break;
        case 5:
            class_type='移动开发';
            break;
        case 6:
            class_type='项目发布';
            break;
    }
    return class_type;
}

function highlight(type)
{
    clearSelection();//先清空一下上次高亮显示的内容；
    var searchText = $('#search_ipt').val();//获取你输入的关键字；
    var regExp = new RegExp(searchText, 'g');//创建正则表达式，g表示全局的，如果不用g，则查找到第一个就不会继续向下查找了；
    var get_high;
    switch (type) {
        case 1:
            get_high = '.course-item-detail p,.course-item-detail a';
            break;
        case 2:
            get_high = '.headline a';
            break;
        case 3:
            get_high = '.ui-box .qa-header .qa-tit i';
            break;
    }
    $(get_high).each(function()//遍历文章；
    {
        var html = $(this).html();
        var newHtml = html.replace(regExp, '<span class="highlight" >'+searchText+'</span>');//将找到的关键字替换，加上highlight属性；
        $(this).html(newHtml);//更新文章；
    });
}

function clearSelection()
{
    $('.course-item-detail p').each(function()//遍历
    {
        $(this).find('.highlight').each(function()//找到所有highlight属性的元素；
        {
            $(this).replaceWith($(this).html());//将他们的属性去掉；
        });
    });
    $('.course-item-detail a').each(function()//遍历
    {
        $(this).find('.highlight').each(function()//找到所有highlight属性的元素；
        {
            $(this).replaceWith($(this).html());//将他们的属性去掉；
        });
    });
}

function page_ul(page,count) {
    var page_ul =  $('#page');
    page_length = Math.ceil(count/6);
    if ((parseInt(page)-1)>0) page_ul.append('<li class="page-item"><a class="page-link" href="?'+keyword+'&page='+(parseInt(page)-1)+'">Previous</a></li>');
    else page_ul.append('<li class="page-item disabled"><a class="page-link">Previous</a></li>');

    if (page-1>2&&page_length-page>=2){
        for (var i = page-2;i<=page+2;i++){
            if (i<page_length+1){
                if (i===parseInt(page)){
                    page_ul.append(' <li class="page-item active"><a class="page-link" href="?'+keyword+'&page='+i+'">'+i+'</a></li>');
                }else page_ul.append(' <li class="page-item"><a class="page-link" href="?'+keyword+'&page='+i+'">'+i+'</a></li>');
            }
        }
    }else {
        if (page<=3){
            for (i=1;i<6;i++){
                if (i<page_length+1){
                    if (i===parseInt(page)){
                        page_ul.append(' <li class="page-item active"><a class="page-link" href="?'+keyword+'&page='+i+'">'+i+'</a></li>');
                    }else page_ul.append(' <li class="page-item"><a class="page-link" href="?'+keyword+'&page='+i+'">'+i+'</a></li>');
                }
            }
        }else {
            for (i=page_length-4;i<=page_length;i++){
                if (i<page_length+1){
                    if (i===parseInt(page)){
                        page_ul.append(' <li class="page-item active"><a class="page-link" href="?'+keyword+'&page='+i+'">'+i+'</a></li>');
                    }else page_ul.append(' <li class="page-item"><a class="page-link" href="?'+keyword+'&page='+i+'">'+i+'</a></li>');
                }
            }
        }

    }

    if ((parseInt(page)+1)<=page_length) page_ul.append('<li class="page-item"><a class="page-link" href="?'+keyword+'&page='+(parseInt(page)+1)+'">Next</a></li>');
    else page_ul.append('<li class="page-item disabled"><a class="page-link">Next</a></li>');

    page_ul.append(
        '<li class="page-item last">\n' +
        '<a >\n' +
        '<label>\n' +
        '<input id="jump" type="text" class="form-control" onkeydown="go();" style="width: 50px;">\n' +
        '</label>\n' +
        '<span id="count_page"> </span>\n' +
        '</a>\n' +
        '</li>');
    $('#count_page').text('/ '+page_length);
}

function go(){
    var sp = location.pathname.split('/');
    //console.log(sp[sp.length-1]);
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if (keycode  === 13) {
        var jump = $('#jump');
        if (jump.val()>0&&jump.val()<=page_length&&jump.val()%1 === 0){
            window.location.href= sp[sp.length-1]+"?keyword="+keyword+'&page='+jump.val();
        }else alert('请重新输入页号');
    }
}

function search_to() {
    var sp = location.pathname.split('/');
    var new_keyword = $('#search_ipt').val();
    //console.log(new_keyword+'!!!');
    if (new_keyword===keyword || new_keyword.trim()==='') return;
    window.location.href=sp[sp.length-1]+'?keyword='+encodeURI(new_keyword);
}

function search_user() {
    var keyword = $('#search_ipt').val();
    if (keyword.trim() === '') return;
    var page = GetQueryString('page');
    if (page == null) page = '1';
    $.ajax({
        type: "POST",
        asynch: "false",
        url: PageContext+"/changeInfor",
        data: {
            page: page,
            action: '2',
            keyword: keyword
        },
        dataType: 'json',
        success: function (jsonObj) {
            $('#count').text('共找到' + jsonObj.count + '个结果');
            if (jsonObj.count === '0') return;
            for (var i = 0; i < jsonObj.nike.length; i++) {
                $('.user-list').append(
                    '      <li class="up-item">\n' +
                    '                        <div class="up-face">\n' +
                    '                            <a href="javascript:void(0)" target="_blank"  class="face-img">\n' +
                    '                                <div class="lazy-img">\n' +
                    '                                    <img alt="" src="'+PageContext+jsonObj.head[i]+'">\n' +
                    '                                </div>\n' +
                    '                            </a>\n' +
                    '                        </div>\n' +
                    '                        <div class="info-wrap">\n' +
                    '                            <div class="headline">\n' +
                    '                                <a href="javascript:void(0)"  target="_blank" class="title">'+jsonObj.nike[i]+'</a>\n' +
                    '                            </div>\n' +
                    '                            <div class="up-info">\n' +
                    '                                <span>性别：'+jsonObj.sex[i]+'</span>\n' +
                    '                                <span>'+jsonObj.usertype[i]+'</span>\n' +
                    '                            </div>\n' +
                    '                            <div class="desc">'+jsonObj.information[i]+'</div>\n' +
                    '                        </div>\n' +
                    '                    </li>'
                )
            }
            page_ul(page, jsonObj.count);
            highlight(2);
        }
    })
}

function search_ask() {
    var keyword = $('#search_ipt').val();
    if (keyword.trim() === '') return;
    var page = GetQueryString('page');
    if (page == null) page = '1';
    $.ajax({
        type: "POST",
        asynch: "false",
        url: PageContext + "/postask",
        data: {
            action: 'search_ask',
            page:page,
            keyword:keyword
        },
        dataType: 'json',
        success: function (jsonObj) {
            $('#count').text('共找到' + jsonObj.count + '个结果');
            if (jsonObj.count === '0') return;
            var ask_ul = $('#ask_ul');
            for (var i=0;i<jsonObj.ask_id.length;i++){
                ask_ul.append(
                    ' <li>\n' +
                    '                            <div class="ui-box">\n' +
                    '                                <div class="headslider qa-medias l">\n' +
                    '                                    <a class="media" target="_blank" href="javascript:void(0)">\n' +
                    '                                        <img src="'+PageContext+jsonObj.cover_address[i]+'" style="width: 50px;height: 50px;border-radius: 0;" alt="">\n' +
                    '                                    </a>\n' +
                    '                                </div>\n' +
                    '                                <div class="wendaslider qa-content">\n' +
                    '                                    <h2 class="wendaquetitle qa-header">\n' +
                    '                                        <div class="wendatitlecon qa-header-cnt clearfix">\n' +
                    '                                            <a class="qa-tit" target="_blank" href="../questions.jsp?'+jsonObj.ask_id[i]+'">\n' +
                    '                                                <i>'+jsonObj.ask_title[i]+'</i>\n' +
                    '                                            </a>\n' +
                    '                                        </div>\n' +
                    '                                    </h2>\n' +
                    '                                    <div class="replycont qa-body clearfix">\n' +
                    '                                        <div class="l replydes" id="new_reply'+jsonObj.ask_id[i]+'">\n' +
                    '                                        </div>\n' +
                    '                                    </div>\n' +
                    '                                    <div class="replymegfooter qa-footer clearfix">\n' +
                    '                                        <div class="l-box l">\n' +
                    '                                            <a class="replynumber static-count " target="_blank" href="../questions.jsp?'+jsonObj.ask_id[i]+'">\n' +
                    '                                                <span class="static-item answer">'+jsonObj.answer_count[i]+' 回答</span>\n' +
                    '                                                <span class="static-item">'+jsonObj.visits_count[i]+' 浏览</span>\n' +
                    '                                            </a>\n' +
                    '                                            <a href="../Learn_list.jsp?='+jsonObj.belong_class_id[i]+'" target="_blank">'+jsonObj.class_title[i]+'</a>\n' +
                    '                                        </div>\n' +
                    '                                        <em class="r">'+jsonObj.ask_time[i]+'</em>\n' +
                    '                                    </div>\n' +
                    '                                </div>\n' +
                    '                            </div>\n' +
                    '                        </li>'
                );
                if (jsonObj.new_answer[i]===null){
                    $('#new_reply'+jsonObj.ask_id[i]).append(
                        '<button type="button" class="btn btn-light" onclick="window.open(\'../questions.jsp?'+jsonObj.ask_id[i]+'\')">我来回答</button>\n'
                    )
                } else {
                    $('#new_reply'+jsonObj.ask_id[i]).append(
                        '<span class="replysign">\n' +
                        ' 最新回复 /\n' +
                        '   <a class="nickname" target="_blank" href="javascript:void(0)">'+jsonObj.new_answerer[i]+'</a>\n' +
                        ' </span>\n' +
                        ' <div class="replydet">'+jsonObj.new_answer[i]+'</div>\n'
                    )
                }
            }
            page_ul(page, jsonObj.count);
            highlight(3);
        }
    })
}

function search_class() {
    var keyword = $('#search_ipt').val();
    if (keyword.trim() === '') return;
    var page = GetQueryString('page');
    if (page == null) page = '1';
    $.ajax({
        type: "POST",
        asynch: "false",
        url: PageContext+"/SaveClassInfor",
        data: {
            page: page,
            Read_or_Save: 'search_class',
            keyword: keyword
        },
        dataType: 'json',
        success: function (jsonObj) {
            $('#count').text('共找到' + jsonObj.count + '个结果');
            if (jsonObj.class_id.length === 0) return;
            for (var i = 0; i < jsonObj.class_id.length; i++) {
                var class_type = get_class_type(jsonObj.class_type[i]);
                $('.search-content').append(
                    ' <div class="course-item">\n' +
                    '                    <a href="../Learn_list.jsp?=' + jsonObj.class_id[i] + '" target="_blank" class="course-detail-title">\n' +
                    '                        <img src="'+PageContext + jsonObj.cover_address[i] + '" alt="">\n' +
                    '                    </a>\n' +
                    '                    <div class="course-item-detail">\n' +
                    '                        <a href="../Learn_list.jsp?=' + jsonObj.class_id[i] + '" target="_blank" class="course-detail-title">\n' +
                    '                            ' + jsonObj.class_title[i] + '\n' +
                    '                        </a>\n' +
                    '                        <div class="course-item-classify">\n' +
                    '                            <span>' + class_type + '</span>\n' +
                    '                            <span>教师：' + jsonObj.teacher[i] + '</span>\n' +
                    '                            <i class="fa fa-user-o" style="font-size: 11px;"></i><span>' + jsonObj.student_count[i] + '</span>\n' +
                    '                        </div>\n' +
                    '                        <p>\n' +
                    '                            ' + jsonObj.outline[i] + '\n' +
                    '                        </p>\n' +
                    '                    </div>\n' +
                    '                </div>'
                )
            }
            page_ul(page, jsonObj.count);
            highlight(1);
        }
    });
}