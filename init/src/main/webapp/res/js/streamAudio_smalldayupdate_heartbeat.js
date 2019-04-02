var noListen = true;
var top_iframe_id;
var audioplaytime = {};
var audioplaytime = {};
var playStatusRecord = false;

//设置变量
$(function(){
    //获取到音频的标签
    var audio = document.getElementById("audio");
    var t;
    //获取播放器中的一个长横线
    var linew = $(".audioLine").width();
    //获取上面的小圆点
    var sw = $("#drag").width();
    $(".playBtn").click(function() {
        if($(this).hasClass("play")) {
            $(this).addClass("pause").removeClass("play");
            //play(audio);
            audio.play();
            addListenTouch();
            dragMove();
            playStatusRecord = true;
        }
        else {
            $(this).addClass("play").removeClass("pause");
            clearInterval(t);
            audio.pause();
            pause(audio);
        }
    })

    function addListenTouch() {
        document.getElementById("drag").addEventListener("touchstart", touchStart, false);
        document.getElementById("drag").addEventListener("touchmove", touchMove, false);
        document.getElementById("drag").addEventListener("touchend", touchEnd, false);
    }

    var aboveX;
    function touchStart(e) {
        e.preventDefault();
        var touch = e.touches[0];
        startX = touch.pageX;
        aboveX = parseInt(drag.style.left);
    }
    function touchMove(e) {
        e.preventDefault();
        var touch = e.touches[0];
        x = touch.pageX - startX;
        if(aboveX+x+sw<linew && aboveX+x>0){
            audio.pause();
            clearInterval(t);
            drag.style.left = aboveX + x + "px";
            $(".audioLine .lineaft").width((aboveX + x));
            var ctime = parseInt((aboveX + x) / (linew-sw) * audio.duration);
            var m = Math.floor(ctime / 60);
            var s = ctime % 60;
            if(m<=9){
                m = "0"+m;
            }
            if(s<=9){
                s = "0"+s;
            }
            $(".audioCont .txt").text(m+":"+s);
        }
    }
    function touchEnd(e) {
        e.preventDefault();
        aboveX = parseInt(drag.style.left);
        var touch = e.touches[0];
        var dragPaddingLeft = drag.style.left;
        var change = dragPaddingLeft.replace("px", "");
        numDragpaddingLeft = parseInt(change);
        var currentTime = (numDragpaddingLeft / (linew - sw)) * audio.duration;
        audio.currentTime = currentTime;
        audio.play();
        dragMove();
    }
    function dragMove(){
        t = setInterval(function() {
            //已經点击播放按鈕(一次),播放状态,音频加完毕,网络传输事件隔离
            if(playStatusRecord && !audio.paused && audio.readyState == 4){
                play(audio);
                playStatusRecord = false;
            }

            drag.style.left = (audio.currentTime / audio.duration) * (linew - sw) + "px";
            $(".audioLine .lineaft").width((audio.currentTime / audio.duration) * (linew - sw));
            var currnetTime = parseInt(audio.currentTime);
            var m = Math.floor(currnetTime / 60);
            var s = currnetTime % 60;
            if(m<=9){
                m = "0"+m;
            }
            if(s<=9){
                s = "0"+s;
            }
            $(".audioCont .txt").text(m+":"+s);
            //播放結束
            if(audio.currentTime==audio.duration){
                $(".playBtn").addClass("play").removeClass("pause");
                drag.style.left = "0px";
                $(".audioLine .lineaft").width("0px");
                $(".audioCont .txt").text("00:00");
                clearInterval(t);
                audio.currentTime = 0;
                audio.pause();
                if($(".useable").hasClass("useable-active")|| $(".unuseable").hasClass("unuseable-active")){
                    //两个点赞或者踩有一个被点击都不出点赞弹框
                }else{
                    $(".courseScore").show();
                }
                pause(audio);
            }
        }, 500);
    }

    //更正播放时长
    function uploadPlayTime(audio) {
    	console.log('courseId:'+topicCid+" timeLen:"+timeLen +" duration:"+parseInt(audio.duration));
    	if(timeLen!=parseInt(audio.duration)){
    		HH.ajax({
    			waiting : false,
    			url : "/yzmm/account/smallDayUpdate/updatePlayTime",
    			data : {
    				courseId :topicCid,
    				timeLen : parseInt(audio.duration),
    			},
    		});
    	}
    }
    function play(audio){
    	make();//
    	uploadPlayTime(audio);//播放时长
        $(".playBtn").addClass("pause").removeClass("play");
        //上传音频长度
        if($(".topaudioBox .txt2").data("sec")==0){
        }
        //记录播放开始时长
        audioplaytime["currentTime"+topicCid] = audio.currentTime;
        //记录播放时间
        var starttime = audioplaytime["start"+topicCid];
        if (!starttime) {
            audioplaytime["start"+topicCid] = new Date()
                .getTime();
        }

    }
    /**
     * make 课程足迹
     * @returns
     */
    function make(){
    	HH.ajax({
            waiting : false,
            url : "/yzmm/account/smallDayUpdate/checkAndMark",
            data : {
            	courseId :topicCid,
            },
        });
    }

    function pause(audio){
        try{
            $(".playBtn").addClass("ui-play").removeClass("ui-pause");
            if (audio.currentTime == audio.duration) {
                audio.currentTime = 0;
                $(".playBtn").addClass("play").removeClass("pause");
            }
        }catch(e){}
    }
})

