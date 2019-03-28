<%--
  Created by IntelliJ IDEA.
  User: LI
  Date: 2018/11/25 0025
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Test</title>
    <link rel="stylesheet" type="text/css" href="../CSS/Learn_list.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/navigation_dark.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="../bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <script src="../bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../JS/LoginPC.js"></script>
    <script type="text/javascript" src="../JS/Learn_list.js"></script>
</head>

<script type="text/javascript">
    var pass = -1;
    var ask_flag = 0;
    var note_flag = 0;
    var get_class_flag = 0;
    var ask_count = -1;
    var note_count = -1;
    $(document).ready(function(){
        get_Class();
        if (GetQueryString('page_ask')!=null) get_Ask();
        else if (GetQueryString('page_note')!=null) get_Note();
    });
    function get_Class() {
        $.ajax({
            type: "POST",
            asynch: "false",
            url: PageContext+"/learn_list",
            data: {
                action:'get_class',
                No:No
            },
            dataType: 'json',
            success: function (jsonObject) {
                console.log('jsonObj.release_status'+jsonObject.release_status);
                if (jsonObject.release_status===0){
                    pass = 0;
                    console.log('1:'+pass);
                    alert('该课程尚未发布');
                    window.location.href="homepage.jsp";
                    return
                }
                get_schedule();
                $("title").text(jsonObject.title);
                $("#title").text(jsonObject.title);
                $("#teacher").text(jsonObject.teacher);
                $('#head').attr('src',"${pageContext.request.contextPath}"+jsonObject.head);
                $('#student_number').text(jsonObject.student_number);
                ask_count = jsonObject.ask_count;
                note_count = jsonObject.note_count;
                var ask_nav = $('#ask_nav');
                var note_nav = $('#note_nav');
                ask_nav.prev().text(ask_count);
                note_nav.prev().text(note_count);
                var class_type;
                switch (jsonObject.class_type) {
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
                var other_class = $('#other_class');
                var one = $('#one');
                other_class.text(class_type+'相关课程');
                for (var i=0;i<jsonObject.other_class_title.length;i++){
                    other_class.append(
                        '<div class="sno2-allbox">\n' +
                        '      <img src="'+"${pageContext.request.contextPath}"+jsonObject.other_class_iamge[i]+'" class="imagesize">\n' +
                        '           <div class="coursecount">\n' +
                        '           <a href="Learn_list.jsp?='+jsonObject.other_class_no[i]+'" class="coursecount-font">'+jsonObject.other_class_title[i]+'</a>\n' +
                        '      </div>\n' +
                        '</div>'
                    )
                }
                $('#class_type').text(class_type);
                $('#Bread_crumb_navigation').append(
                    '  <a target="_blank" href="homepage.jsp">首页</a>\n' +
                    '  <i class="i">\\</i>\n' +
                    '  <a target="_blank" href="course.jsp?type='+jsonObject.class_type+'">'+class_type+'</a>\n' +
                    '  <i class="i">\\</i>\n' +
                    '  <a href="">'+jsonObject.title+'</a>\n' +
                    '  <i class="i">\\</i>'
                );
                if (GetQueryString('page_ask')==null && GetQueryString('page_note')==null) {
                    $('#unit-nav').addClass('active show');
                    one.addClass('active show');
                }
                else if (GetQueryString('page_note')==null) {
                    ask_nav.addClass('active show');
                    $('#two').addClass('active show');
                }else {
                    note_nav.addClass('active show');
                    $('#three').addClass('active show');
                }

                $('.sno1-1 .course-info-tip').append(
                    '      <dl class="first">\n' +
                    '          <dt>课程概要</dt>\n' +
                    '          <dd class="autowrap">'+jsonObject.outline+'</dd>\n' +
                    '      </dl>'
                );

                var flag='';var class_count = 0;
                for(i=0;i<jsonObject.Unit_Name.length;i++){
                    if (!flag.match(jsonObject.Unit_Name[i].trim())){
                        flag = flag+','+jsonObject.Unit_Name[i].trim();
                    }
                }
                if (flag!=='') flag = flag.substring(1).split(",");
                
                for (i=0;i<flag.length;i++){
                    one.append(
                        '<div id="Unit'+i+'" class="ui-box" draggable="true"  >' +
                        '<span  style="margin-right:20px;color:#999;font-weight:bold;">第'+(i+1)+'章 '+'</span>'+
                        '<span >'+flag[i]+'</span>'+
                        '</div>'
                    );
                    var Class_flag='';
                    for (var j=0;j<jsonObject.Serial_No.length;j++)  if (jsonObject.Serial_No[j].match((i+1)+'-'))  Class_flag+=','+jsonObject.Serial_No[j];
                    Class_flag = Class_flag.substring(1).split(",");
                    for (var k=0;k<Class_flag.length;k++){
                        if (jsonObject.State[class_count].trim()==='1'){
                            $("#Unit"+i).append(
                                '<div class="list_box" >' +
                                '    <a  href="Play.jsp?'+GetQueryString('class_id')+'/'+Class_flag[k]+'">' +
                                '       <div class="ui-box1">' +
                                '           <i class="fa fa-adjust"></i>'+
                                '               <span style="margin-right: 20px;color: #999;">课时'+Class_flag[k].charAt(Class_flag[k].length-1) +'</span>'+
                                '               <span >'+jsonObject.Class_Name[class_count]+'</span>'+
                                '       </div>'+
                                '    </a>'+
                                ' </div>'
                            );
                        }
                        class_count++;
                    }
                    //alert(Class_flag);
                }
                if (one.html().length === 0) {
                    one.append(
                        '<div class="no_find_class">暂无发布的章节</div> '
                    )
                }
                //alert(Serial_No+"\n"+Unit_Name+"\n"+Class_Name+"\n"+Video_Src+"\n"+Editor+"\n"+File_Href+"\n"+State);
            }
        });

    }

    function get_schedule() {
        if(user === 'null'){
            $('.sno1-1 .learn-btn').append(
                '<button type="button" class="studyfont btn btn-outline-primary" data-toggle="modal" data-target="#LoginModal" >开始学习</button>\n'
            )
        }else {
            $.ajax({
                url:" ${pageContext.request.contextPath}/students",
                data: {
                    No:No,
                    student:user,
                    action:'get_schedule'
                },
                type: "POST",
                dataType: "json",
                asynch: "false",
                success: function (jsonObj) {
                    var percentage = jsonObj.schedule;
                    var last_time = jsonObj.last_time;
                    if(percentage === undefined) {
                        $('.sno1-1 .learn-btn').append(
                            '<button type="button" class="studyfont btn btn-outline-primary" data-toggle="modal" data-target="#join_class">开始学习</button>\n'
                        )
                    }else {
                        $('.sno1-1 .learn-btn').append(

                            '      <div class="learn-info"><span>已学 '+percentage+'%</span></div>\n' +
                            '      <div class="progress">\n' +
                            '         <div class="progress-bar" style="width:'+percentage+'%"></div>\n' +
                            '     </div>\n' +
                            '     <div class="learn-info-media" data-class="'+last_time+'">上次学至 '+last_time+'</div>\n' +
                            '     <button type="button" class="studyfont btn btn-outline-primary" onclick="continue_class(this)">继续学习</button>\n'
                        )
                    }
                }
            });
        }
    }

    function add_page(page_ul_id,page,count,page_type) {
        var page_ul =  $(page_ul_id);
        console.log(count);
        page_length = Math.ceil(count/6);
        if ((parseInt(page)-1)>0) page_ul.append('<li class="page-item"><a class="page-link" href="?='+No+'&'+page_type+'='+(parseInt(page)-1)+'">Previous</a></li>');
        else page_ul.append('<li class="page-item disabled"><a class="page-link">Previous</a></li>');

        if (page-1>2&&page_length-page>=2){
            for (var i = page-2;i<=page+2;i++){
                if (i<page_length+1){
                    if (i===parseInt(page)){
                        page_ul.append('<li class="page-item active"><a class="page-link" href="?='+No+'&'+page_type+'='+i+'">'+i+'</a></li>');
                    }else page_ul.append('<li class="page-item"><a class="page-link" href="?='+No+'&'+page_type+'='+i+'">'+i+'</a></li>');
                }
            }
        }else {
            if (page<=3){
                for (i=1;i<6;i++){
                    if (i<page_length+1){
                        if (i===parseInt(page)){
                            page_ul.append('<li class="page-item active"><a class="page-link" href="?='+No+'&'+page_type+'='+i+'">'+i+'</a></li>');
                        }else page_ul.append('<li class="page-item"><a class="page-link" href="?='+No+'&'+page_type+'='+i+'">'+i+'</a></li>');
                    }
                }
            }else {
                for (i=page_length-4;i<=page_length;i++){
                    if (i<page_length+1){
                        if (i===parseInt(page)){
                            page_ul.append('<li class="page-item active"><a class="page-link" href="?='+No+'&'+page_type+'='+i+'">'+i+'</a></li>');
                        }else page_ul.append('<li class="page-item"><a class="page-link" href="?='+No+'&'+page_type+'='+i+'">'+i+'</a></li>');
                    }
                }
            }

        }

        if ((parseInt(page)+1)<=page_length) page_ul.append('<li class="page-item"><a class="page-link" href="?='+No+'&'+page_type+'='+(parseInt(page)+1)+'">Next</a></li>');
        else page_ul.append('<li class="page-item disabled"><a class="page-link">Next</a></li>')
    }

    function get_Note() {
        if (note_flag===1) return;
        var page = GetQueryString('page_note');
        if (page == null) page = '1';
        $.ajax({
            type: "POST",
            asynch: "false",
            url: PageContext + "/postnote",
            data: {
                action: 'get_this_class_note',
                No: No,
                page: page
            },
            dataType: 'json',
            success: function (jsonObj) {
                for (i=0;i<jsonObj.text.length;i++){
                    $('#note_ul').append(
                        '<li class="post-row js-find-txt">\n' +
                        '                            <div class="media">\n' +
                        '                                <a href="" target="_blank">\n' +
                        '                                    <img src="'+"${pageContext.request.contextPath}"+jsonObj.head[i]+'" width="40" height="40">\n' +
                        '                                </a>\n' +
                        '                            </div>\n' +
                        '                            <div class="bd">\n' +
                        '                                <div class="tit">\n' +
                        '                                    <a href="" target="_blank">'+jsonObj.name[i]+'</a>\n' +
                        '                                </div>\n' +
                        '                                <div class="js-note-main">\n' +
                        '                                    <div class="note-media">\n' +
                        '                                        <a href="" class="from l">'+jsonObj.class_no[i]+'&nbsp&nbsp'+jsonObj.class_title[i]+'</a>\n' +
                        '                                    </div>\n' +
                        '                                    <div class="js-notelist-content notelist-content">\n' +
                        '                                        <div class="autowrap note-content">'+jsonObj.text[i]+'</div>\n' +
                        '                                    </div>\n' +
                        '                                    <div class="footer clearfix">\n' +
               /*         '                                        <div class="actions l">\n' +
                        '                                            <a href="" target="_blank" class="post-action">查看全文</a>\n' +
                        '                                        </div>\n' +*/
                        '                                        <span class="r timeago">'+jsonObj.time[i]+'</span>\n' +
                        '                                    </div>\n' +
                        '                                </div>\n' +
                        '                            </div>\n' +
                        '                        </li>'
                    )
                }
                setTimeout(function () {
                    if (ask_count===-1) setTimeout(this,500);
                    else add_page('#page_note',page,note_count,'page_note');
                },500);
            }
        });
        note_flag = 1;
    }

    function get_Ask() {
        if (ask_flag===1) return;
        var page = GetQueryString('page_ask');
        if(page == null) page='1';
        $.ajax({
            type: "POST",
            asynch: "false",
            url: PageContext + "/postask",
            data: {
                action: 'get_this_class_ask',
                No: No,
                page:page
            },
            dataType: 'json',
            success: function (jsonObj) {
                for (i=0;i<jsonObj.ask_no.length;i++){
                    $('#ask_ul').append(
                        ' <li>\n' +
                        '                            <div class="ui-box">\n' +
                        '                                <div class="headslider qa-medias l">\n' +
                        '                                    <a class="media" target="_blank" href="" title="'+jsonObj.asker[i]+'">\n' +
                        '                                        <img src="'+"${pageContext.request.contextPath}"+jsonObj.head[i]+'" width="40px" height="40px">\n' +
                        '                                    </a>\n' +
                        '                                </div>\n' +
                        '                                <div class="wendaslider qa-content">\n' +
                        '                                    <h2 class="wendaquetitle qa-header">\n' +
                        '                                        <div class="wendatitlecon qa-header-cnt clearfix">\n' +
                        '                                            <a class="qa-tit" target="_blank" href="questions.jsp?'+jsonObj.ask_no[i]+'">\n' +
                        '                                                <i>'+jsonObj.describe[i]+'</i>\n' +
                        '                                            </a>\n' +
                        '                                        </div>\n' +
                        '                                    </h2>\n' +
                        '                                    <div class="replycont qa-body clearfix">\n' +
                        '                                        <div class="l replydes" id="new_reply'+jsonObj.ask_no[i]+'">\n' +
                        '                                        </div>\n' +
                        '                                    </div>\n' +
                        '                                    <div class="replymegfooter qa-footer clearfix">\n' +
                        '                                        <div class="l-box l">\n' +
                        '                                            <a class="replynumber static-count " target="_blank" href="questions.jsp?'+jsonObj.ask_no[i]+'">\n' +
                        '                                                <span class="static-item answer">'+jsonObj.answer_count[i]+' 回答</span>\n' +
                        '                                                <span class="static-item">'+jsonObj.times[i]+' 浏览</span>\n' +
                        '                                            </a>\n' +
                        '                                            <a href="" target="_blank">'+jsonObj.title_No_list[i]+'&nbsp&nbsp'+jsonObj.title[i]+'</a>\n' +
                        '                                        </div>\n' +
                        '                                        <em class="r">'+jsonObj.time[i]+'</em>\n' +
                        '                                    </div>\n' +
                        '                                </div>\n' +
                        '                            </div>\n' +
                        '                        </li>'
                    );
                    //$('#ask_no'+jsonObj.ask_no[i]).
                    if (jsonObj.new_answer[i]===null){
                        $('#new_reply'+jsonObj.ask_no[i]).append(
                            '<button type="button" class="btn btn-light" onclick="window.open(\'questions.jsp?'+jsonObj.ask_no[i]+'\')">我来回答</button>\n'
                        )
                    } else {
                        $('#new_reply'+jsonObj.ask_no[i]).append(
                            '<span class="replysign">\n' +
                            ' 最新回复 /\n' +
                            '   <a class="nickname" target="_blank" href="">'+jsonObj.new_answer[i]+'</a>\n' +
                            ' </span>\n' +
                            ' <div class="replydet">'+jsonObj.new_answer_text[i]+'</div>\n'
                        )
                    }
                }

                setTimeout(function () {
                    if (ask_count===-1) setTimeout(this,500);
                    else add_page('#page_ask',page,ask_count,'page_ask')
                },500);
            }
        });
        ask_flag = 1;
    }

    $(function () {
        $('#join_class').on('show.bs.modal', function (event) {
            if (get_class_flag!==0)  return;
            $.ajax({
                url: "${pageContext.request.contextPath}/students",
                data: {
                    No:No,
                    action:'get_class'
                },
                type: "POST",
                dataType: "json",
                asynch: "false",
                success: function (jsonObj) {
                    var class_box = $('#class_box');
                    if (jsonObj.id.length===0){
                        class_box.append(
                            '<div class="no_find_join_class">该课程暂未设立班级</div>'
                        );
                        return
                    }
                    for (var i=0;i<jsonObj.id.length;i++){
                        $('#class_table').append(
                            ' <tr>\n' +
                            '     <td>'+jsonObj.name[i]+'</td>\n' +
                            '     <td><button type="button" style="margin-top: 0;float: right" class="btn btn-outline-primary btn-sm" onclick="join_class('+jsonObj.id[i]+')">加入班级</button></td>\n' +
                            '</tr>'
                        )
                    }
                }
            });
            get_class_flag = 1;
        })
    });
</script>

<body onload="ifActive();" style="background-color: #f8fafc;">
<jsp:include page="navigation.jsp"/>
<jsp:include page="LoginPC.jsp" />
<div class="main">
    <div class="inside">
        <div class="first" id="Bread_crumb_navigation">
        </div>
        <div class="second">
            <h2 id="title" class="left"></h2>
        </div>
        <div class="third">
            <div class="t1">
                <div class="t11"><a href="" target="_blank"><img id="head" src="" width="48px" height="48px" alt=""></a></div>
            </div>
            <div class="fouth">
                <span class="f1">教师</span>
                <span id="teacher" class="f1"></span>
            </div>

            <div class="fouth">
                <span class="f1">学习人数</span>
                <span id="student_number" class="f1"></span>
            </div>
            <div class="fouth">
                <span class="f1">课程类型</span>
                <span id="class_type" class="f1"></span>
            </div>

        </div>
    </div>
</div>
<!-- 课程菜单 -->
<div class="under">
    <div class="w">
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a id="unit-nav" class="nav-link " data-toggle="pill" href="#one">章节</a>
            </li>
            <li class="nav-item">
                <span></span>
                <a id="ask_nav" class="nav-link" data-toggle="pill" href="#two" onclick="get_Ask();">问答</a>
            </li>
            <li class="nav-item">
                <span></span>
                <a id="note_nav" class="nav-link" data-toggle="pill" href="#three" onclick="get_Note()">笔记</a>
            </li>
        </ul>
    </div>
</div>

<!-- 课程面板 -->
<div>
    <div class="course">
        <div class="tab-content">
            <div id="one" class="container tab-pane  margin"></div>
            <!-- 问答评论 -->
            <div id="two" class="container tab-pane fade margin">
                <div class="comment-list">
                    <ul id="ask_ul"></ul>
                </div>
                <ul id="page_ask" class="pagination pagination-sm"></ul>
            </div>
            <!-- 同学笔记 -->
            <div id="three" class="container tab-pane fade margin">
                <%--<div class="circle">
                    <ul>
                        <li><a href="#"><div class="col_1">最新</div></a></li>
                        <li><a href="#"><div>点赞</div></a></li>
                    </ul>
                </div>--%>
                <div class="comment-list">
                    <ul id="note_ul"></ul>
                </div>
                <ul id="page_note" class="pagination pagination-sm"></ul>
            </div>
        </div>


        <!-- 侧边栏调整 -->
        <div class="aside right">
            <div class="course-introduction-main">
                <div class="son1">
                    <div class="sno1-1">
                        <div class="learn-btn"></div>
                        <div class="course-info-tip"></div>
                    </div>
                    <%--   <div class="inbelow">
                           <h3 class="fontset-headline">课程须知</h3>
                           <p class="fontbody">适合对React视图工具有一定的实际开发经验，特别是对redux有一定的使用经验，想了解其它类似解决方案的同学</p>
                           <h3 class="fontset-headline">老师告诉你能学到什么？</h3>
                           <p class="fontbody">mobx的使用方法，对React项目的性能优化经验</p>
                       </div>--%>
                </div>
                <%--      <div class="fontset-headline">推荐课程
                          <div class="sno2-allbox">
                              <img src="https://img3.mukewang.com/szimg/58a68f000001262805400300-360-202.jpg" class="imagesize">
                                  <div class="coursecount">
                                      <a href="#" class="coursecount-font">在本章中，将会通过编写一个简单的高阶组件，来加深对高阶组件概念的理解；</a>
                                  </div>
                          </div>
                      </div>--%>
                <div class="son3 fontset-headline">最新公告
                    <div class="hotrecommend">
                        <div >
                            <a href="#" class="hot1">用Query实现一小应用</a>
                            <a href="#" class="hot2">Web前端常用框架</a>
                            <a href="#" class="hot2">防站开发</a>
                            <a href="#" class="hot3">最实用得前端开发框架教程</a>
                            <a href="#" class="hot1">js入门基础</a>
                            <a href="#" class="hot4">全栈开发技能</a>
                        </div>
                    </div>
                </div>
                <div class="sno4 fontset-headline" id="other_class">相关课程</div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="join_class"  style="background-color: transparent; width: 100%; top:90px;">
    <div class="modal-dialog">
        <div class="modal-content" >
            <%-- 头部--%>
            <div class="modal-header">
                <div class="modal-title">请选择你所在的班级</div>
                <a id="join_class_Close" class="close" data-dismiss="modal">&times;</a>
            </div>
            <%--界面--%>
            <div class="modal-body" id="class_box" style="max-height: 440px;overflow-y: scroll;overflow-x: hidden;">
                <table id="class_table" class="table">
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
<%--<body onload="get_Class()">

<div id="list_body">

</div>
</body>--%>

</html>
