// url параметри на student_page.html - studentid
const params = new URLSearchParams(window.location.search);
const studentID = params.get("studentid");

// търсим студентът с id = studentid в базата
student = STUDENTS[studentID];
if (!student) 
{
    alert("Студентът не е намерен!");
}

// попълваме информацията за студента
spanName = document.getElementById("name");
spanName.textContent = student.name;

spanFN = document.getElementById("fn");
spanFN.textContent = student.fn;

spanEmail = document.getElementById("email");
spanEmail.textContent = student.email;

// функционалност на опция в менюто "мои събития" - към страницата с всички събития (student_event_page.html)
myEventsBtn = document.getElementById("my-events");
myEventsBtn.addEventListener("click", () => {
    // искаме да е страницата на този студент => studentid от url
    window.location.href = "student_event_page.html?studentid=" + studentID;
});
