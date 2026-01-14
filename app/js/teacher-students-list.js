// url параметри на teacher_page_list_students.html - teacherid
const params = new URLSearchParams(window.location.search);

// за всеки студент в базата добавяме div
const container = document.getElementById("students-list");

Object.keys(STUDENTS).forEach(id => {
    const student = STUDENTS[id];

    const div = document.createElement("div");
    // добавяме атрибут data-id - после търсим по него
    div.dataset.id = id;
    div.className = "student-page";

    spanName = document.createElement("span");
    spanName.textContent = student.name;

    spanFN = document.createElement("span");
    spanFN.textContent = student.fn;

    div.appendChild(spanName);
    div.appendChild(spanFN);

    container.appendChild(div);
});

// при кликане на студент отиваме в неговата страница "за мен" в нов таб 
document.querySelectorAll(".student-page").forEach(student => {
    student.addEventListener("click", () => {
        const id = student.dataset.id;
        window.open("student_page.php?studentid=" + id, "_blank", "noopen");
    });
});

// функционалност на опция в менюто "за мен" - към страницата с лична информация (teacher_page.html)
forMe = document.getElementById("for-me");
forMe.addEventListener("click", () => {
    window.location.href = "teacher_page.php";
});

// функционалност на опция в менюто "мои събития" - към страницата с всички събития (teacher_event_page.html)
myEvents = document.getElementById("my-events");
myEvents.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    const teacherID = params.get("teacherid");
    window.location.href = "teacher_event_page.php?teacherid=" + teacherID;
});
