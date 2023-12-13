function timer(){
    var sec = 29;
    var timer = setInterval(function(){
        document.getElementById('safeTimerDisplay').innerHTML=''+sec;
        sec--;
        if (sec < 0) {
            clearInterval(timer);
        }
    }, 1000);
}
