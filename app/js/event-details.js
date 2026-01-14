// url параметри на event_page_student_view.html - eventid и studentid
const params = new URLSearchParams(window.location.search);
const id = params.get("eventid");

if (!EVENTS[id]) {
    alert("Събитието не съществува");
}

// взимаме събитието, на което съответства подаденото в url eventid
const ev = EVENTS[id];

// търсим преподавателя в TEACHERS по teacherId, което е ключ за обектите "събитие"
teacher = TEACHERS[ev.teacherId];
if (!teacher) {
    alert("Преподавателят не съществува!");
}

// вмъкваме информацията за събитието в страницата 
document.getElementById("event-title").textContent = ev.title;
document.getElementById("event-teacher").textContent = "Преподавател: " + teacher.name;
document.getElementById("event-theme").textContent = "Тема: " + ev.theme;
document.getElementById("event-info").textContent = "Информация: " + ev.info;

const list = document.getElementById("attendance-list");
const count = document.getElementById("count-attendance");

// добавяме брой присъствали
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