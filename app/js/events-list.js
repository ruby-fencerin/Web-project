// url параметри на student_event_page.html - studentid
const params = new URLSearchParams(window.location.search);
const studentID = params.get("studentid");

const currentStudent = STUDENTS[studentID];
if (!currentStudent) {
    //alert("Студентът не е намерен!");
}

// добавяме div за всяко събитие в базата, което е посетено от студента с id = studentid от url
const eventsContainer = document.getElementById("events");

Object.keys(EVENTS).forEach(id => {
    const ev = EVENTS[id];

    if (ev.students.includes(currentStudent.name)) 
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

// функционалност - при клик върху събитие отиваме на неговата страница - event_page_student_view.html
document.querySelectorAll(".event").forEach(event => {
    event.addEventListener("click", () => {
        // за да можем после да се върнем, подаваме и параметър studentid
        const id = event.dataset.id;
        window.location.href = "event_page_student_view.php?eventid=" + id + "&studentid=" + studentID;
    });
});

// функционалност на опция в менюто "за мен" - към страницата с лична информация (student_page.html)
forMe = document.getElementById("for-me");
forMe.addEventListener("click", () => {
    // искаме да е страницата на този студент => studentid от url
    window.location.href = "student_page.php?studentid=" + studentID;
});