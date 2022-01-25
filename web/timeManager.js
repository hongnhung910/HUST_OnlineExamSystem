//Các hàm quản lý thời gian
function showTime(){
    var date = new Date();
    var h = date.getHours(); // 0 - 23
    var m = date.getMinutes(); // 0 - 59
    var s = date.getSeconds(); // 0 - 59
    var session = "AM";
    
    if(h == 0){
        h = 12;
    }
    
    if(h > 12){
        h = h - 12;
        session = "PM";
    }
    
    h = (h < 10) ? "0" + h : h;
    m = (m < 10) ? "0" + m : m;
    s = (s < 10) ? "0" + s : s;
    
    var time = h + ":" + m + ":" + s + " " + session;
    document.getElementById("MyClockDisplay").innerText = time;
    document.getElementById("MyClockDisplay").textContent = time;
    
    setTimeout(showTime, 1000);
    
}
showTime();

function formatTime(inputTime) {
    var date = new Date(inputTime);
    var h = date.getHours(); // 0 - 23
    var m = date.getMinutes(); // 0 - 59
    var s = date.getSeconds(); // 0 - 59
    var session = "AM";
    
    if(h == 0){
        h = 12;
    }
    
    if(h > 12){
        h = h - 12;
        session = "PM";
    }
    
    h = (h < 10) ? "0" + h : h;
    m = (m < 10) ? "0" + m : m;
    s = (s < 10) ? "0" + s : s;
    
    var time = h + ":" + m + ":" + s + " " + session;
    return time;
}

function formatDate(inputTime) {
    let date = new Date(inputTime);
    let y = date.getFullYear();
    let m = date.getMonth() + 1;
    if(m < 10) {
        m = '0' + m;
    }
    else m = m;
    let d = date.getDate();
    if(d < 10) {
        d = '0' + d;
    }
    else m = m;
    return d + '/' + m + '/' + y;
}

function formatDur(dur) {
    let a = dur / 60000.0;
    let h = parseInt(a / 60);
    let m = Math.round((a/60 - h)*60);
    return h + 'h' +' : '+ m + 'min'
}

function setTime(start, due){
    // <div id="start" class="test-info-start">Start: 02:29:36 PM</div>
    // <div id="due" class="test-info-due">Due: 02:59:36 PM</div>
    // <div id="dur" class="test-info-time">Duration: 45 minutes</div>
    const startDate = new Date(start);
    // console.log(startDate.getMonth());
    const time1 = Date.parse(start);
    // console.log(time1)
    const time2 = Date.parse(due);
    // console.log(time2)
    const dur = time2 - time1;
    // console.log(dur);
    const a = new Date();
    const now = Date.parse(a);
    // console.log(now);
    document.getElementById('start').innerHTML = 'Start: ' + formatTime(start);
    document.getElementById('due').innerHTML = 'Due: ' + formatTime(due);
    document.getElementById('dur').innerHTML = 'Duration: ' + formatDur(dur);
    document.getElementById('exam-date').innerHTML = 'Ngày thi: ' + formatDate(start);
    document.querySelector('#start-btn .submit-link').addEventListener("click", function() {
        
        if(time2 - now < 0) {
            dueExam(due);
        }
        else {
            startExam(start);
        }
    });
    
    document.querySelector('#start-btn .submit-link').addEventListener("click", function() {
        dueExam(due);
    });
    
    

}
setTime('January 26, 2022 09:20:00', 'January 26, 2022 11:45:00');


function startExam(start) {
    const a = new Date();
    console.log(a);
    const now = Date.parse(a);
    console.log(now);
    const time1 = Date.parse(start);
    console.log(time1);
    const delta = time1 - now;
    console.log(delta)
    if(delta >= 1000){
        console.log('chưa đến giờ')
        document.getElementById('waiting-area').style.display = 'flex';
        //<div class="waiting-noti">Làm ơn chờ đợi, bài thi sẽ bắt đầu trong 10 phút nữa</div>
        document.querySelector('#waiting-area .waiting-noti').innerHTML = 'Làm ơn chờ đợi, bài thi sẽ bắt đầu trong ' + formatDur(delta)+' nữa';
    }
    else {
        console.log('den gio roi')
        document.querySelector('#start-btn .submit-link').setAttribute('href', "./takeExam.html");
    }
}
function dueExam(due) {
    const a = new Date();
    console.log(a);
    const now = Date.parse(a);
    console.log(now);
    const time2 = Date.parse(due);
    console.log(time2);
    const delta = time2 - now;
    console.log(delta)
    if(delta >= 1000){
        console.log('van con thoi gian')
    }
    else {
        console.log('Bai thi da ket thuc')
        document.getElementById('expired-area').style.display = 'flex';
        document.querySelector('#expired-area .expired-noti').innerHTML = 'Đã hết giờ làm bài!';
        return false;
    }
}


document.querySelector('.submit-btn .submit-link').addEventListener("click", function() {
    console.log('da click')
});

function submitExam() {
    document.querySelector('.exam-questions').style.display = 'none';
    document.querySelector('#farewell-area').style.display = 'flex';
}

/* <button class="btn submit-btn btn-primary">
                    <a class="" href="./submitedExam.html">Submit</a>
                </button> */