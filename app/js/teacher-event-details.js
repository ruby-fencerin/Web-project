// url параметри на event_page_teacher_view - eventid и teacherid
const params = new URLSearchParams(window.location.search);
const id = params.get("eventid");

if (!EVENTS[id]) {
    alert("Събитието не съществува");
}

// намираме събитието в базата по eventid
const ev = EVENTS[id];

// вмъкваме информацията за събитието в страницата 
document.getElementById("event-title").textContent = ev.title;
document.getElementById("event-theme").textContent = "Тема: " + ev.theme;
document.getElementById("event-info").textContent = "Информация: " + ev.info;

const list = document.getElementById("attendance-list");
const count = document.getElementById("count-attendance");

// добавяме броя присъстващи
count.textContent = ev.students.length;

// попълваме списъка с присъстващи
ev.students.forEach(s => {
    list.innerHTML += `<div>${s}</div>`;
});


// при натискане на бутона "Присъстващи" се отваря списък с присъстващите - 
// засега е hardcoded
document.getElementById("show-attending")
    .addEventListener("click", () => {
        list.classList.toggle("hidden");
    });

// функционалност на бутон [<=] - връщане към страницата с всички събития (teacher_event_page.html)
back = document.getElementById("back");
back.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    const teacherID = params.get("teacherid");
    window.location.href = "teacher_event_page.php?teacherid=" + teacherID;

});

// функционалност на опция в менюто "мои събития" - към страницата с всички събития (teacher_event_page.html)
myEvents = document.getElementById("my-events");
myEvents.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    const teacherID = params.get("teacherid");
    window.location.href = "teacher_event_page.php?teacherid=" + teacherID;

});

// функционалност на опция в менюто "за мен" - към страницата с лична информация (teacher_page.html)
forMe = document.getElementById("for-me");
forMe.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    window.location.href = "teacher_page.php";

});

// функционалност на опция в менюто "студенти" - към списък със студенти (teacher_page_list_students.html)
studentsListBtn = document.getElementById("list-all-students");
studentsListBtn.addEventListener("click", () => {
    // за всички преподаватели е еднаква страница, но за да можем да се върнем, подаваме teacherid от url
    const teacherID = params.get("teacherid");
    window.location.href = "teacher_page_list_students.php?teacherid=" + teacherID;
});