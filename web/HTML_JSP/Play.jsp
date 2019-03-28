
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    <link rel="stylesheet" href="../bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/navigation.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link  rel="stylesheet" href="../video-js-7.4.1/video-js.min.css">

    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="../bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../JS/Myclass.js"></script>
    <script type="text/javascript" src="../JS/drag.js"></script>
    <script type="text/javascript" src="../JS/LoginPC.js"></script>
    <script type="text/javascript" src="../wangEditor-3.1.1/release/wangEditor.min.js"></script>
    <script type="text/javascript" src="../video-js-7.4.1/video.min.js"></script>
</head>

<style type="text/css">
    .video-js .vjs-time-control{display:block;}
    .video-js .vjs-remaining-time{display: none;}

    body.modal-open {
        overflow-y: auto !important;
        padding-right: 0!important;
    }
    a {
        text-decoration: none;
    }
    .course-sidebar-layout{
        height:100%;
        width: 69px;
        float: left;
        background: #1c1f21;
        /*display: flex;*/
        display: -webkit-flex;
        align-items: center;
        position: relative;

    }
    .course-sidebar-layout #back{
        position: absolute;
        color: rgba(255,255,255,.6);
        top: 0;
        transition: all .3s;
        cursor: pointer;
        font-size: 25px;
    }
    .course-sidebar-layout #back:hover{
        color: white;
    }

    .course-sidebar-layout dl {
        flex: 1;
        width: 100%;
    }
    .course-sidebar-layout dd {
        display: flex;
        display: -webkit-flex;
        height: 72px;
        flex-direction: column;
        text-align: center;
        justify-content: center;
        cursor: pointer;
    }
    .course-sidebar-layout .nav-pills .nav-item .fa {
        font-size: 24px;
        color: rgba(255,255,255,.6);
        line-height: 24px;
    }
    dd:hover span {
        color: #fff;
    }
    dd:hover i {
        color: #fff;
    }
    .course-sidebar-layout span {
        font-size: 12px;
        color: rgba(255,255,255,.4);
        line-height: 18px;
    }
    .right_table{
        height: 45px;
        /*background: url(../images/course_learn/toolbar_tab_bg.png?7452938…) repeat-x;*/
        background-color: #1c1f21;;
        font-family: '微软雅黑', serif;
    }
    .table-box{
        position: absolute;
        top: 142px;;
        width: 320px;
        bottom: 0;
        overflow: hidden;
        background: #f5f7fa;
    }
    .right_tabitem{
        float: left;
        height: 44px;
        width: 30%;
        text-align: center;
        line-height: 44px;
        color: rgba(255,255,255,.6);
    }
    .nav-tabs{
        display: flex;
    }
    .nav-item{
        flex:1;
    }
    .nav-item a{
        text-align: center;
    }

    .sec-title{
        padding-top: 20px;
        font-size: 14px;
        /*color: #fff;*/
        line-height: 22px;
        margin-bottom: 8px;
    }
    .sec-li{
        height: 30px;
    }
    .sec-li a{
        padding: 6px 0 6px 12px;
        width: 100%;
        height: 30px;
        box-sizing: border-box;
        overflow: hidden;
        display: block;
        position: relative;
        font-size: 12px;
        color: grey;
        line-height: 20px;
        transition: all .3s;
    }

    a:hover{
        text-decoration:none
    }

    ul{
        list-style: none;
    }
    .sec-li a:hover{
        color: #007bff;
        text-decoration:none
    }
    h6{
        font-weight: 700;
    }
    .box{
        overflow-y: auto;
    }
    .tab-pane{
        height:90%;overflow:auto;
    }
    .tab-pane ::-webkit-scrollbar
    {
        width: 0;
    }

    .w-e-text-container .w-e-panel-container{
        width: 321px;!important;
        margin-left: -162px;!important;
    }

    #right_box{
        background-color:white;
        height: 100%;
        width:23%;
        float: left;
        margin-left: 20px;
        border-radius: 10px;
        padding: 10px;
    }

    .flex-column a{
        color: grey;
        transition: all .3s;
    }

    .flex-column a:hover{
        color: white;
        text-decoration:none
    }

    .author a:hover{
        color: #007bff;
        text-decoration:none
    }

    .author a{
        font-size: 14px;
        color: #1c1f21;
        font-weight: 700;
    }


    #center_box{
        width:71%;
        height:100%;
        float: left
    }

    .center{
        height: 100%;
    }
    .ui-box {
         border-radius: 5px;
         box-shadow: 0 6px 16px 0 rgba(7,17,27,.1);
         /* border: 1px solid #ddddcf;*/
         background-color: white;
         padding: 20px;
         margin-bottom: 15px;
         width: 92%;
         margin-left: auto;
         margin-right: auto;
         max-height: 425px;
     }

    #note_box .post_action{
        float: left;
        margin-left: 20px;
        color: #9199a1;
        font-size: 12px;
        overflow: hidden;
        cursor: pointer;
        line-height: 34px;
    }
    #note_box .post_action:hover{
        text-decoration: none;
        color: #4d555d;
    }
    #note_box .post_action i{
        margin-right: 5px;
    }

    .post span{
        margin-left: 20px;
        color: #9199a1;
        font-size: 12px;
        line-height: 34px;
    }
    button.btn-mini {
        height: 29px;
        padding: 0 15px;
        font-size: 12px;
        width: auto;
    }

    .no_find_video{
        color: white;
        width: 50%;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        height: 50px;
        margin-top: 280px;
        font-size: 33px;
    }
    #chapter ul{
        padding-left: 10px;
    }
    .ui-box1{
        position: absolute;
    }
    .ui-box .fa-play-circle-o{
        position: relative;
        top: 5px;
    }
    .playing{
        color: #007bff !important;
    }
    .course-sidebar-layout .nav-pills .nav-item .active{
        color: white;
    }
</style>


<body  onunload="live();">
<jsp:include page="navigation.jsp"/>
<div style="width: 100%;height: 100%;background-color: #1c1f21;padding: 10px;margin-top: 5px">
    <div class='course-sidebar-layout ' id='courseSidebar' >
        <a href="Learn_list.jsp" id="back" onclick="live()">
            <i class="fa fa-arrow-left"></i>
        </a>
        <ul class="nav nav-pills flex-column" role="tablist" style="height: 40%">
            <li class='nav-item' id="video_li">
                <i class='fa fa-file-video-o'></i>
                <a class=" active" data-toggle="pill" href="#video">视频</a>
            </li>
            <li class='nav-item' id="text_li" >
                <i class='fa fa-file-code-o'></i>
                <a class="" data-toggle="pill" href="#text">图文</a>
            </li>
            <li class='nav-item'  id="file_li">
                <i class='fa fa-file-archive-o'></i>
                <a class="" data-toggle="pill" href="#file">文件</a>
            </li>

        </ul>
    </div>

      <div id="center_box" class="tab-content">
          <div id="video" class="center tab-pane active"   >
              <video id="video1" class="video-js vjs-default-skin"  style="width:100% ;height:100%" controls preload="none">
                     data-setup='{ "html5" : { "nativeTextTracks" : false } }'>
                  <source src="" type="video/mp4">
              </video>
          </div>
          <div id="text" class="center tab-pane fade" style="background-color: white;padding: 20px;"></div>
          <div id="file" class="center tab-pane fade" style="background-color: white;padding: 20px;">
              <div id="file_group" class="list-group"></div>
          </div>
      </div>


    <div id="right_box" >

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#chapter" onclick="sub_width()">章节</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#note" onclick="add_width();get_note()">笔记</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#ask" onclick="add_width();get_ask()">问答</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content box">
                <div id="chapter" class=" tab-pane active"></div>
                <div id="note" class=" tab-pane fade" ><br>
                    <h6>笔记</h6>
                    <div id="note_editor" style="width: 100%"></div>
                    <div style="margin-top: 5px;margin-bottom: 45px;">
                        <button type="button" class="btn btn-outline-success btn-mini" style="float: right" onclick="post_note()">提交</button>
                    </div>
                    <h6>我的笔记</h6>
                    <div id="note_box">

                    </div>
               <%--     <div style=" margin-left: auto; margin-right: auto;text-align: center;margin-top: 10px">
                        <a href="https://www.baidu.com/" >
                            <button type="button" class="btn btn-light">查看更多笔记</button>
                        </a>
                    </div>--%>
                </div>
                <div id="ask" class=" tab-pane fade"><br>
                    <h6>提问</h6>
                    <div class="form-group" style="padding: 6px;">
                        <input type="text" class="form-control" id="problem" placeholder="一句话描述问题:" >
                    </div>
                    <div id="ask_editor" style="width: 100%"></div>
                    <div style="margin-top: 5px;margin-bottom: 45px;">
                        <button type="button" class="btn btn-outline-success btn-mini" style="float: right" onclick="post_ask()">提交</button>
                    </div>
                    <h6>我的问答</h6>
                    <div id="ask_box">

                    </div>
                   <%-- <div style=" margin-left: auto; margin-right: auto;text-align: center;margin-top: 10px">
                        <a href="https://www.baidu.com/" >
                            <button type="button" class="btn btn-light">查看本课时更多问答</button>
                        </a>
                    </div>--%>
                </div>
            </div>
        </div>
<div class="course">

</div>
      <div class="modal fade" id="Delete_Note">
          <div class="modal-dialog">
              <div class="modal-content">
                  <%-- 头部--%>
                  <div class="modal-header">
                      <h5 class="modal-title">确定删除这条笔记吗？</h5>
                      <a id="Delete_Note_Close" class="close" data-dismiss="modal">&times;</a>
                  </div>
                  <%--界面--%>
                  <div class="modal-body">
                      <div>笔记删除将无法恢复</div>
                      <button id="Delete_Note_sure_button" type="button" class="btn btn-primary" onclick="" style="float: right; margin-top: 10px;">确定
                      </button>
                  </div>
              </div>
          </div>
      </div>
</div>
</body>

<script type="text/javascript">
    var note_flag = 0;
    var ask_flag = 0;
    var post_note_flag = 0;
    var post_ask_flag = 0;
    var No = window.location.search.replace("?",'').split("/");
    var Unit_length;
    var Unit;
    var class_no = No[1];
    No = No[0];
    var editor_count = 0;
    var E = window.wangEditor;
    var configure = [
        'head',
        'bold',
        'italic',
        'underline',
        'foreColor',  // 文字颜色
        'fontSize',  // 字号
        'link',
        'quote',
        'list',  // 列表
        'image',
        'justify',  // 对齐方式
        'table',  // 表格
        'code'
    ];
    var edit_configure = [
        'head',
        'bold',
        'italic',
        'underline',
        'justify',  // 对齐方式
        'foreColor',  // 文字颜色
        'fontSize',  // 字号
        'quote',
        'code'];

    $(document).ready(function () {
        get_Class();
        get_Video()
    });



    function get_Class() {
        var note_editor = new E('#note_editor');
        var ask_editor = new E('#ask_editor');

        note_editor.customConfig.menus = configure;
        ask_editor.customConfig.menus = configure;

        note_editor.create();
        ask_editor.create();

        $('#back').attr('href','Learn_list.jsp?class_id='+No);
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
                $("title").text(jsonObject.title);
                $("#teacher").text(jsonObject.teacher);
                /*var class_no = getSrting(window.location.search);*/
                var flag='';var class_count = 0;
                Unit_length = jsonObject.Unit_Name.length;
                Unit = jsonObject.Serial_No;
                for(var i=0;i<jsonObject.Unit_Name.length;i++){
                    if (!flag.match(jsonObject.Unit_Name[i].trim())){
                        flag = flag+','+jsonObject.Unit_Name[i].trim();
                    }
                }
                flag = flag.substring(1).split(",");
                for (i=0;i<flag.length;i++){
                    $("#chapter").append(
                        '<ul id="Unit'+i+'" class="" draggable="true"  >' +
                        '<li class="sec-title">'+
                        '   <span  style="margin-right:20px;color:#999;font-weight:bold;">第'+(i+1)+'章 '+'</span>'+
                        '   <span >'+flag[i]+'</span>'+
                        '</li>'+
                        '</ul>'
                    );
                    var Class_flag='';
                    for (var j=0;j<jsonObject.Serial_No.length;j++)  if (jsonObject.Serial_No[j].match((i+1)+'-'))  Class_flag+=','+jsonObject.Serial_No[j];
                    Class_flag = Class_flag.substring(1).split(",");
                    for (var k=0;k<Class_flag.length;k++){
                        if (jsonObject.State[class_count].trim()==='1'){
                            $("#Unit"+i).append(
                                '<li class="sec-li">' +
                                '    <a  href="Play.jsp'+window.location.search.replace(class_no,'') + Class_flag[k]+'">' +
                                '       <div class="ui-box1">' +
                                '               <i class="fa fa-play-circle-o"></i>'+
                                '               <span style="margin-right: 20px;">课时'+Class_flag[k].charAt(Class_flag[k].length-1) +'</span>'+
                                '               <span >'+jsonObject.Class_Name[class_count]+'</span>'+
                                '       </div>'+
                                '    </a>'+
                                ' </li>'
                            );
                        }
                        class_count++;
                    }
                    //alert(Class_flag);
                }
                $('#Unit'+(class_no.substring(0,class_no.indexOf('-'))-1)).children().eq((class_no.substring(class_no.indexOf('-')+1))).find('.ui-box1').parent().addClass('playing').append(
                    '<i class="fa fa-adjust" style="position: relative;left:370px;top: 5px" id="adjust"></i>'
                )
                //alert(Serial_No+"\n"+Unit_Name+"\n"+Class_Name+"\n"+Video_Src+"\n"+Editor+"\n"+File_Href+"\n"+State);
            }
        });
    }

    function get_ask() {
        if (ask_flag===1) return;
        $.ajax({
            type: "POST",
            asynch: "false",
            url: PageContext+"/postask",
            data: {
                action:'get',
                No:No,
                class_No:class_no,
                author:user
            },
            dataType: 'json',
            success: function (jsonObject){
                for (var i=0;i< jsonObject.title.length;i++){
                    add_ask_box(jsonObject.title[i],jsonObject.time[i],jsonObject.answer[i],jsonObject.browse[i]);
                }
            }
        });
        ask_flag = 1;
    }

    function get_note() {
        if (note_flag===1) return;
        $.ajax({
            type: "POST",
            asynch: "false",
            url: PageContext+"/postnote",
            data: {
                action:'get',
                No:No,
                class_No:class_no,
                author:user
            },
            dataType: 'json',
            success: function (jsonObject){
                for (var i=0;i< jsonObject.text.length;i++){
                    $('#note_box').prepend(' <div class="ui-box">\n' +
                        '                            <div style="float:left;">\n' +
                        '                                <a href="PersonalCenter.jsp">\n' +
                        '                                    <image src="'+"${pageContext.request.contextPath}"+head_image+'" style="width: 40px;height: 40px;border-radius: 20px;"></image>\n' +
                        '                                </a>\n' +
                        '                            </div>\n' +
                        '                            <div style="margin-left: 60px">\n' +
                        '                                <div class="author">\n' +
                        '                                    <a  href="PersonalCenter.jsp" >'+user+'</a>\n' +
                        '                                </div>\n' +
                        '                                <div style="display: block;">\n' +
                        '                                    <div style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;max-height: 63%;min-height=20%">\n' +
                        '                                        '+jsonObject.text[i]+'\n' +
                        '                                    </div>\n' +
                        '                                    <div class="post" style=" margin-left: 12%;">\n' +
                        '                                        <a class="post_action" href="javascript:void(0);" onclick="edit_note(this)"><i class="fa fa-eyedropper"></i>编辑</a>\n' +
                        '                                        <a id="delete_note'+jsonObject.note_no[i]+'" class="post_action" data-toggle="modal"  data-target="#Delete_Note" data-noteno="'+jsonObject.note_no[i]+'"><i class="fa fa-window-close-o" ></i>删除</a>\n' +
                        '                                        <a class="post_action">查看全文</a>\n' +
                        '                                        <span >'+jsonObject.time[i]+'</span>\n' +
                        '                                    </div>\n' +
                        '                                </div>\n' +
                        '                                <div style="display: none;">  <%--修改笔记区--%>\n' +
                        '                                    <div id="edit_editor'+i+'" style="height: 322px;margin-bottom: 14px"></div>\n' +
                        '                                    <div style="height: 30px;">\n' +
                        '                                        <button type="button" class="btn btn-outline-success btn-mini" style="float:right;" onclick="change_note(this)" data-noteno="'+jsonObject.note_no[i]+'">提交</button>\n' +
                        '                                        <button type="button" class="btn btn-outline-secondary btn-mini" style="float:right;margin-right: 10px;" onclick="out_edit_note(this)">取消</button>\n' +
                        '                                    </div>\n' +
                        '                                </div>\n' +
                        '                            </div>\n' +
                        '                        </div>');
                    var edit_editor = new E('#edit_editor'+i);
                    edit_editor.customConfig.menus = edit_configure;
                    edit_editor.create();
                    edit_editor.txt.html(jsonObject.text[i]);
                    editor_count++;
                }
            }
        });
        note_flag=1
    }

    var player;
    var videoID;
    var cookieTime;
    function live() {
        if (post_note_flag ===1||post_ask_flag===1) return;
        var title = $('#adjust').prev().children().eq(2).text();
        cookie.set('class_no_'+user+No,class_no+','+title);
        var done_times = 0;
        for (var a=0;a<Unit_length;a++){
            var ifDone = cookie.get('time_'+user+No+Unit[a]);
            if (ifDone ==='done')  done_times++;
        }
        var percentage = parseInt(done_times/Unit_length*100);
        $.ajax({
            type: "POST",
            asynch: "false",
            url: PageContext+"/students",
            data: {
                action:'save_schedule',
                No:No,
                user:user,
                schedule:percentage,
                last_time:class_no+':'+title
            },
            dataType: 'json'
        });
    }

  /*  function loadHandler() {
        player.addListener('time', timeHandler); //监听播放时间
        player.addListener('ended', endedHandler);
    }

    function timeHandler(t) {
        cookie.set('time_' + videoID, t); //当前视频播放时间写入cookie
    }

    function endedHandler(e) {
        alert('!!');
        player.videoPause();
    }*/


    function get_Video() {
        $.ajax({
            type: "POST",
            asynch: "true",
            url: "${pageContext.request.contextPath}/play",
            data: {
                No:No,
                class_No:class_no
            },
            dataType: 'json',
            success: function (jsonObj) {
                if (jsonObj.sc_user===0) {
                    $('#video').empty().append(
                        '<div class="no_find_video">请先加入本课程学习</div>'
                    );
                    note_flag =1;
                    ask_flag = 1;
                    post_note_flag = post_ask_flag = 1;
                    $('#video_li').hide();
                    $('#text_li').hide();
                    $('#file_li').hide();
                    return;
                }
                if(jsonObj.Video_address===undefined&&jsonObj.text===undefined&&jsonObj.file_address===undefined) {
                    $('#video').empty().append(
                        '<div class="no_find_video">本课时无内容或尚未发布</div>'
                    );
                    note_flag =1;
                    ask_flag = 1;
                    post_note_flag = post_ask_flag = 1;
                    $('#video_li').hide();
                    $('#text_li').hide();
                    $('#file_li').hide();
                    return;
                }
                if (jsonObj.Video_address !== ''){
                    console.log(jsonObj.Video_address);
                    videoID = user+No+class_no; //视频的区分ID，每个视频分配一个唯一的ID
                    cookieTime = cookie.get('time_' + videoID); //调用已记录的time
                    if(!cookieTime  || cookieTime === 'done') { //如果没有记录值，则设置时间0开始播放
                        cookieTime = 0;
                    }
                    /* if(cookieTime > 0) {
                         alert('本视频记录的上次观看时间(秒)为：' + cookieTime);
                     }*/

                    $('#video1').children().attr('src',jsonObj.Video_address);

                    player = videojs('video1', { });

                    player.on('ended', function () {
                        cookie.set('time_' + videoID, 'done');
                    });

                    player.on('timeupdate', function () {
                        cookie.set('time_' + videoID, player.currentTime()); //当前视频播放时间写入cookie
                    });

                    player.on('loadedmetadata', function() {
                        if(cookieTime > 0) { //如果记录时间大于0，则设置视频播放后跳转至上次记录时间
                            player.currentTime(cookieTime)
                        }
                    });
                }else {
                    $('#video').empty().append(
                        '<div class="no_find_video">本课时无视频教案</div>'
                    );
                    $('#video_li').hide();

                }

                //console.log('jsonObj.text'+jsonObj.text);
                if (jsonObj.text==='<p><br></p>'){
                    $('#text_li').hide()
                }else {
                    $('#text').append(
                        jsonObj.text
                    );
                }

                if (jsonObj.file_address===''){
                    $('#file_li').hide();
                }else {
                    var file_address = jsonObj.file_address.split('|');
                    var file_name = jsonObj.file_name.split('|');
                    for (var i=0;i<file_address.length-1;i++) {
                        $('#file_group').append(
                            '<a target="_blank" href="'+file_address[i]+'" class="list-group-item list-group-item-action">'+file_name[i]+'</a>'
                        )
                    }
                }
            }
        });
    }
    function add_width() {
        $("#center_box").css('width','58%');
        $("#right_box").css('width','36%');
    }

    function sub_width() {
        $("#center_box").css('width','71%');
        $("#right_box").css('width','23%');
    }

    $(function () {
        $('#Delete_Note').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var button_id = button.data('noteno'); //获取呼出模态框的按钮ID
            var obj = document.getElementById("Delete_Note_sure_button");
            obj.setAttribute("onclick", "delete_note(" + button_id + ")");
        })
    });

    function change_note(event) {
        var new_note = $(event).parent().prev().children().eq(1).children().html().replace(/(^\s*)|(\s*$)/g, "").replace(/\u200B/g,'');
        var time = new Date().Format("yyyy-MM-dd HH:mm:ss");
        $.ajax({
            type: "POST",
            asynch: "false",
            url: "${pageContext.request.contextPath}/postnote",
            data: {
                action:'change',
                note_no:$(event).data('noteno'),
                note_editor:new_note,
                time:time
            },
            dataType: 'json',
            success: function (jsonObj) {
                if ('1'===jsonObj.msg){
                    $(event).parent().parent().prev().children().eq(0).html(new_note);
                    $(event).next().click();
                }
            }
        });
    }

    function post_note() {
        if (post_note_flag===1) return;
        var note_editor = $('#note_editor');
        var note_text = note_editor.children().eq(1).children().html().replace(/(^\s*)|(\s*$)/g, "").replace(/\u200B/g,'');
        if (note_editor.text().trim().length===0){
            alert('内容不能为空');
        }else {
            var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");
            $.ajax({
                type: "POST",
                asynch: "false",
                url: "${pageContext.request.contextPath}/postnote",
                data: {
                    action:'post',
                    No:No,
                    class_No:class_no,
                    author:user,
                    note_editor:note_text,
                    time:time2
                },
                dataType: 'json',
                success: function (jsonObj) {
                    if (null!==jsonObj.note_id){
                        var note_editor = $('#note_editor');
                        editor_count++;
                        $('#note_box').prepend(' <div class="ui-box">\n' +
                            '                            <div style="float:left;">\n' +
                            '                                <a href="PersonalCenter.jsp">\n' +
                            '                                    <image src="'+"${pageContext.request.contextPath}"+head_image+'" style="width: 40px;height: 40px;border-radius: 20px;"></image>\n' +
                            '                                </a>\n' +
                            '                            </div>\n' +
                            '                            <div style="margin-left: 60px">\n' +
                            '                                <div class="author">\n' +
                            '                                    <a  href="PersonalCenter.jsp" >'+user+'</a>\n' +
                            '                                </div>\n' +
                            '                                <div style="display: block;">\n' +
                            '                                    <div style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;max-height: 63%;min-height=20%">\n' +
                            '                                        '+note_editor.children().eq(1).children().html()+'\n' +
                            '                                    </div>\n' +
                            '                                    <div class="post" style=" margin-left: 12%;">\n' +
                            '                                        <a class="post_action" href="javascript:void(0);" onclick="edit_note(this)"><i class="fa fa-eyedropper"></i>编辑</a>\n' +
                            '                                        <a id="delete_note'+jsonObj.note_id+'" class="post_action" data-toggle="modal"  data-target="#Delete_Note" data-noteno="'+jsonObj.note_id+'"><i class="fa fa-window-close-o"></i>删除</a>\n' +
                            '                                        <a class="post_action">查看全文</a>\n' +
                            '                                        <span >'+time2+'</span>\n' +
                            '                                    </div>\n' +
                            '                                </div>\n' +
                            '                                <div style="display: none;">  <%--修改笔记区--%>\n' +
                            '                                    <div id="edit_editor'+editor_count+'" style="height: 60%;margin-bottom: 14px"></div>\n' +
                            '                                    <div style="height: 30px;">\n' +
                            '                                        <button type="button" class="btn btn-outline-success btn-mini" style="float:right;" onclick="change_note(this) data-noteno="'+jsonObj.note_id+'"">提交</button>\n' +
                            '                                        <button type="button" class="btn btn-outline-secondary btn-mini" style="float:right;margin-right: 10px;" onclick="out_edit_note(this)">取消</button>\n' +
                            '                                    </div>\n' +
                            '                                </div>\n' +
                            '                            </div>\n' +
                            '                        </div>');
                        var edit_editor = new E('#edit_editor'+editor_count);
                        edit_editor.customConfig.menus = edit_configure;
                        edit_editor.create();
                        edit_editor.txt.html(note_editor.children().eq(1).children().html());
                        note_editor.children().eq(1).children().html('<br>');
                    }
                }
            });
        }
    }
    
    function edit_note(event) {
        $(event).parent().parent().css('display','none');
        $(event).parent().parent().next().css('display','block');
    }

    function out_edit_note(event) {
        $(event).parent().parent().css('display','none');
        $(event).parent().parent().prev().css('display','block');
    }

    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "H+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };

    function delete_note(noteno) {
        //alert($(event).parent().prev().html().replace(/(^\s*)|(\s*$)/g, ""));
        $.ajax({
            type: "POST",
            asynch: "false",
            url: "${pageContext.request.contextPath}/postnote",
            data: {
                action:'delete',
                note_no:noteno
            },
            dataType: 'json',
            success: function (jsonObj) {
                if ('1'===jsonObj.msg){
                    $('#delete_note'+noteno).parent().parent().parent().parent().remove();
                    $("#Delete_Note_Close").click();
                }
            }
        });
    }

    function post_ask() {
        if (post_ask_flag===1) return;
        var ask_editor = $('#ask_editor');
        var ask_title = $('#problem').val();
        var ask_text = ask_editor.children().eq(1).children().html().replace(/(^\s*)|(\s*$)/g, "").replace(/\u200B/g,'');
        if (ask_editor.text().trim().length===0 || ask_title.trim().length===0){
            alert('内容不能为空');
        }else {
            var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");
            $.ajax({
                type: "POST",
                asynch: "false",
                url: "${pageContext.request.contextPath}/postask",
                data: {
                    action:'post',
                    No:No,
                    class_No:class_no,
                    author:user,
                    note_editor:ask_text,
                    time:time2,
                    ask_title:ask_title
                },
                dataType: 'json',
                success: function (jsonObj) {
                    if ('1'===jsonObj.msg){
                        add_ask_box(ask_title,time2,0,0);
                        ask_editor.children().eq(1).children().html('<p><br></p>');
                        $('#problem').val('');
                    }
                }
            });
        }
    }

    function add_ask_box(ask_title,time2,answer,browse) {
        $('#ask_box').prepend(' <div class="ui-box">\n' +
            '                            <div style="float:left;">\n' +
            '                                <a href="PersonalCenter.jsp">\n' +
            '                                    <image src="'+"${pageContext.request.contextPath}"+head_image+'" style="width: 40px;height: 40px;border-radius: 20px;"></image>\n' +
            '                                </a>\n' +
            '                            </div>\n' +
            '                            <div style="margin-left: 60px">\n' +
            '                                <div class="author">\n' +
            '                                    <a  href="PersonalCenter.jsp" >'+user+'</a>\n' +
            '                                </div>\n' +
            '                                <div style="display: block;">\n' +
            '                                    <div style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;max-height: 63%;min-height=20%">\n' +
            '                                        '+ask_title+'\n' +
            '                                    </div>\n' +
            '                                    <div class="post" style=" margin-left: 30%;">\n' +
            '                                        <a class="post_action" href="javascript:void(0);"><span>'+answer+'回答</span><span>'+browse+'浏览</span></a>\n' +
            '                                        <span >'+time2+'</span>\n' +
            '                                    </div>\n' +
            '                                </div>\n' +
            '                            </div>\n' +
            '                        </div>');
    }

</script>
</html>
