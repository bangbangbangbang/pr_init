$(function() {
	getSong();
	init();
})
function init() {
	tock();
	$(audio).on("play", function() {
		ck();
	});
}
function beginTime() {
	var objTime = window.setInterval(function() {
		$.cookie(time_cookie, audio.currentTime + "," + audio.duration, {
			expires : 1,
			path : '/'
		});
	}, 1000);
}

function ck() {
	var tcarr = getCookieTime();
	if (tcarr[0] > 0) {
		var wit = window.setInterval(function() {
			if (1 <= audio.readyState) {
				audio.currentTime = tcarr[0];
				window.clearInterval(wit);
			}
		}, 10);
	}
	beginTime();
}

function getCookieTime() {
	var tc = $.cookie(time_cookie);
	if (!tc) {
		return new Array(0, 0);
	}
	var tcarr = tc.split(",");
	if (!tcarr || tcarr.length != 2) {
		return new Array(0, 0);
	}
	var currentTime = parseFloat(tcarr[0]);
	var lenTime = parseFloat(tcarr[1]);
	return new Array(currentTime, lenTime);
}

function tock() {
	var tcarr = getCookieTime();
	if (0 == tcarr[0]) {
		return;
	}
	document.getElementById("drag").style.left = (tcarr[0] / tcarr[1])
			* (linew - sw) + "px";
	var currnetTime = parseInt(tcarr[0]);
	var m = Math.floor(currnetTime / 60);
	var s = currnetTime % 60;
	if (m <= 9) {
		m = "0" + m;
	}
	if (s <= 9) {
		s = "0" + s;
	}
	$(".audioCont .txt").text(m + ":" + s);
}

var audio = document.getElementById("audio");
var t;
var linew = $(".audioLine").width();
var sw = $("#drag").width();
function getSong() {
	playCotrol();
	clicks();
}
function clicks() {
	$(".playBtn").click(function() {
		if ($(this).hasClass("play")) {
			$(this).addClass("pause").removeClass("play");
			audio.play();
			dragMove();
		} else {
			$(this).addClass("play").removeClass("pause");
			audio.pause();
			dragMove();
		}
	})
	$(".teach").click(function() {
		audio.currentTime = 0;
		audio.play();
		dragMove();
	})
	$(".answer").click(function() {
		var answer = parseInt($(this).attr("data-answer"));
		audio.currentTime = answer;
		audio.play();
		dragMove();

	})
}

function playCotrol() {
	audio.addEventListener("loadeddata", function() {
		var allTime = audio.duration;
		addListenTouch();
	}, false);
	audio.addEventListener("durationchange", function() {
		addListenTouch();
		var allTime = parseInt(audio.duration);
		var m = Math.floor(allTime / 60);
		var s = allTime % 60;
		if (m <= 9) {
			m = "0" + m;
		}
		if (s <= 9) {
			s = "0" + s;
		}
		$(".audioCont .txt2").text(m + ":" + s);

	}, false);
	audio.addEventListener("pause", function() {
		$(".playBtn").addClass("ui-play").removeClass("ui-pause");
		if (audio.currentTime == audio.duration) {
			audio.pause();
			audio.currentTime = 0;
		}
	}, false);
	audio.addEventListener("play", function() {
		$(".playBtn").addClass("pause").removeClass("play");
		dragMove();
	}, false);
}
function addListenTouch() {
	document.getElementById("drag").addEventListener("touchstart", touchStart,
			false);
	document.getElementById("drag").addEventListener("touchmove", touchMove,
			false);
	document.getElementById("drag").addEventListener("touchend", touchEnd,
			false);
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
	if (aboveX + x + sw < linew && aboveX + x > 0) {
		drag.style.left = aboveX + x + "px";
		var ctime = parseInt((aboveX + x) / (linew - sw) * audio.duration);
		var m = Math.floor(ctime / 60);
		var s = ctime % 60;
		if (m <= 9) {
			m = "0" + m;
		}
		if (s <= 9) {
			s = "0" + s;
		}
		$(".audioCont .txt").text(m + ":" + s);
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
}
function dragMove() {

	t = setInterval(function() {
		drag.style.left = (audio.currentTime / audio.duration) * (linew - sw)
				+ "px";
		var currnetTime = parseInt(audio.currentTime);
		var m = Math.floor(currnetTime / 60);
		var s = currnetTime % 60;
		if (m <= 9) {
			m = "0" + m;
		}
		if (s <= 9) {
			s = "0" + s;
		}
		$(".audioCont .txt").text(m + ":" + s);
	}, 500);

}