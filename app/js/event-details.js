// url параметри на event_page_student_view.html - eventid и studentid
const params = new URLSearchParams(window.location.search);
const eventID = params.get("eventid");
const userID = params.get("userid");

if (!eventID || !userID) {
  alert("Липсват eventid или userid в URL!");
  throw new Error("Missing params");
}

const list = document.getElementById("attendance-list");
const count = document.getElementById("count-attendance");

async function loadEvent() {
    const res = await fetch(`../php/event.php?eventid=${encodeURIComponent(eventID)}&userid=${encodeURIComponent(userID)}`);

    
    const text = await res.text();
    let data;
    try { data = JSON.parse(text); }
    catch {
        console.error("Non-JSON response:", text);
        alert("Server error: endpoint did not return JSON. Check console.");
        return;
    }

    if (!res.ok) {
        alert(data.error || "Грешка при зареждане на събитието!");
        return;
    }

    const ev = data.event;

    document.getElementById("event-title").textContent = ev.title;
    document.getElementById("event-teacher").textContent = "Преподавател: " + ev.teacher_name;
    document.getElementById("event-info").textContent = "Информация: " + ev.info;

    count.textContent = data.attendance.count;
    data.attendance.students.sort();
    for (var name of data.attendance.students){
        list.innerHTML += name + "<br>";
    }
}


loadEvent();


// при натискане на бутона "Присъстващи" се отваря списък с присъстващите - 
document.getElementById("show-attending")
    .addEventListener("click", () => {
        list.classList.toggle("hidden");
    });

// функционалност на бутон [<=] - връщане към страницата с всички събития (student_event_page.html)
back = document.getElementById("back");
back.addEventListener("click", () => {
    // искаме да е страницата на този user => userid от url
    window.location.href = "student_event_page.php?userid=" + userID;

});

// функционалност на опция в менюто "мои събития" - към страницата с всички събития (student_event_page.html)
myEvents = document.getElementById("my-events");
myEvents.addEventListener("click", () => {
    // искаме да е страницата на този user => userid от url
    window.location.href = "student_event_page.php?userid=" + userID;

});

// функционалност на опция в менюто "за мен" - към страницата с лична информация (student_page.html)
forMe = document.getElementById("for-me");
forMe.addEventListener("click", () => {
    // искаме да е страницата на този user => userid от url
    window.location.href = "student_page.php?userid=" + userID;

});