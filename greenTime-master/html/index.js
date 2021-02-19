var Timer = 60 * 1;
var display;
var timer = Timer, minutes, seconds;
var SetI;
$('#GOn').hide();
$('#OOn').hide();
$('#ROn').hide();
function startTimer(duration, display, Dparent, Should) { 
	if (!Should) {
		$('#GOn').hide();
		$('#OOn').hide();
		$('#ROn').hide();
		clearTimeout(SetI);
	} else {
		timer = duration;
		if (SetI) {
			clearTimeout(SetI);
		}
		Dparent.show();
		// document.getElementById("Atest").volume = 0.9;
		document.getElementById("Atest").play();
		SetI = setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.html(minutes+":"+seconds+" ")

        if (--timer < 0) {
			Dparent.hide();
			clearTimeout(SetI);
        }
    }, 1000);
	}
}
window.addEventListener('message', function(event) {
    var item = event.data;
        if (item.type === "greenon") {
			Timer = 60 * item.min;
            GreenTimeOn(Timer)
        }else if (item.type === "orangeon") {
			Timer = 60 * item.min;
			OrangeTimeOn();	
		}else if (item.type === "redon") {
			Timer = 60 * item.min;
			RedTimeOn();	
		}else if (item.type === "greenoff") {
			StopTimeOn();	
		}
})
function GreenTimeOn(Timer){
$('#Gtimer').html("");
startTimer(Timer, $('#Gtimer'), $('#GOn'), true);
}
function OrangeTimeOn(){
$('#Otimer').html("");
startTimer(Timer, $('#Otimer'), $('#OOn'), true);
}
function RedTimeOn(){
$('#Rtimer').html("");
startTimer(Timer, $('#Rtimer'), $('#ROn'), true);
}
function StopTimeOn(){
$('#Rtimer').html("");
startTimer(null, null, null, false);
}
