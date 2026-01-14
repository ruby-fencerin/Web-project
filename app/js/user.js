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
async function loadStudent() {
  const res = await fetch(`../php/student.php?studentid=${encodeURIComponent(studentID)}`);
  const data = await res.json();

  if (!res.ok) {
    alert(data.error || "Грешка при зареждане на студент!");
    return;
  }

  // попълваме информацията за студента
  document.getElementById("name").textContent = data.name;
  document.getElementById("fn").textContent = data.faculty_number;
  document.getElementById("email").textContent = data.email;
}

loadStudent();

// функционалност на опция в менюто "мои събития" - към страницата с всички събития (student_event_page.html)
myEventsBtn = document.getElementById("my-events");
myEventsBtn.addEventListener("click", () => {
    // искаме да е страницата на този студент => studentid от url
    window.location.href = "student_event_page.html?studentid=" + studentID;
});
