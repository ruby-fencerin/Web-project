// url параметри на event_page_student_view.html - eventid и studentid
const params = new URLSearchParams(window.location.search);
const eventID = params.get("eventid");
const studentID = params.get("studentid");

if (!eventID || !studentID) {
  alert("Липсват eventid или studentid в URL!");
  throw new Error("Missing params");
}

async function loadEvent() {
    const res = await fetch(`../php/event.php?eventid=${encodeURIComponent(eventID)}&studentid=${encodeURIComponent(studentID)}`);

    
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
    document.getElementById("event-info").textContent = "Информация: " + (ev.info ?? "");

    const list = document.getElementById("attendance-list");
    const count = document.getElementById("count-attendance");

    count.textContent = data.attendance.count;

}

loadEvent();


// при натискане на бутона "Присъстващи" се отваря списък с присъстващите - 
// засега е hardcoded
document.getElementById("show-attending")
    .addEventListener("click", () => {
        list.classList.toggle("hidden");
    });

// функционалност на бутон [<=] - връщане към страницата с всички събития (student_event_page.html)
back = document.getElementById("back");
back.addEventListener("click", () => {
    // искаме да е страницата на този студент => studentid от url
    const studentID = params.get("studentid");
    window.location.href = "student_event_page.php?studentid=" + studentID;

});

// функционалност на опция в менюто "мои събития" - към страницата с всички събития (student_event_page.html)
myEvents = document.getElementById("my-events");
myEvents.addEventListener("click", () => {
    // искаме да е страницата на този студент => studentid от url
    const studentID = params.get("studentid");
    window.location.href = "student_event_page.php?studentid=" + studentID;

});

// функционалност на опция в менюто "за мен" - към страницата с лична информация (student_page.html)
forMe = document.getElementById("for-me");
forMe.addEventListener("click", () => {
    // искаме да е страницата на този студент => studentid от url
    const studentID = params.get("studentid");
    window.location.href = "student_page.php?studentid=" + studentID;

});