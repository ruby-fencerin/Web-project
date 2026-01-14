// url параметри на teacher_event_page.html - teacherid
const params = new URLSearchParams(window.location.search);
const teacherID = params.get("teacherid");

const currentTeacher = TEACHERS[teacherID];
if (!currentTeacher) {
    alert("Преподавателят не е намерен!");
}

// добавяме div за всяко събитие в базата, което е водено от преподавателя с id = teacherid от url
const eventsContainer = document.getElementById("events");

Object.keys(EVENTS).forEach(id => {
    const ev = EVENTS[id];

    if (ev.teacherId == teacherID) 
    {
        const div = document.createElement("div");
        div.dataset.id = id;
        div.className = `event ${ev.type}`;

        spanType = document.createElement("span");
        spanType.textContent = ev.type === "lecture" ? "Лекция" : "Упражнение";

        spanDate = document.createElement("span");
        spanDate.textContent = ev.date;

        spanTime = document.createElement("span");
        spanTime.textContent = ev.time;

        div.appendChild(spanType);
        div.appendChild(spanDate);
        div.appendChild(spanTime);

        eventsContainer.appendChild(div);
    }
});

// функционалност - при клик върху събитие отиваме на неговата страница - event_page_teacher_view.html
document.querySelectorAll(".event").forEach(event => {
    event.addEventListener("click", () => {
        // за да можем после да се върнем, подаваме и параметър teacherid
        const id = event.dataset.id;
        window.location.href = "event_page_teacher_view.html?eventid=" + id + "&teacherid=" + teacherID;
    });
});

// функционалност на опция в менюто "за мен" - към страницата с лична информация (teacher_page.html)
forMe = document.getElementById("for-me");
forMe.addEventListener("click", () => {
    window.location.href = "teacher_page.html";

});

// функционалност на опция в менюто "студенти" - към списък със студенти (teacher_page_list_students.html)
studentsListBtn = document.getElementById("list-all-students");
studentsListBtn.addEventListener("click", () => {
    // за всички преподаватели е еднаква страница, но за да можем да се върнем, подаваме teacherid от url
    window.location.href = "teacher_page_list_students.html?teacherid=" + teacherID;
});