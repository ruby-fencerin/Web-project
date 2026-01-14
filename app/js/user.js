// url параметри на student_page.html - studentid
const params = new URLSearchParams(window.location.search);
const userID = params.get("userid");

// търсим студентът с id = studentid в базата
student = STUDENTS[userID];
if (!student) 
{
    alert("Студентът не е намерен!");
}

// попълваме информацията за студента
async function loadStudent() {
  const res = await fetch(`../php/student.php?userid=${encodeURIComponent(userID)}`);
  const data = await res.json();
  console.log(res);
  if (!res.ok) {
    alert(data.error || "Грешка при зареждане на студент!");
    return;
  }

  // попълваме информацията за студента
  document.getElementById("name").textContent = data.name;
  document.getElementById("fn").textContent = data.fn;
  document.getElementById("email").textContent = data.email;
}

loadStudent();

// функционалност на опция в менюто "мои събития" - към страницата с всички събития (student_event_page.html)
myEventsBtn = document.getElementById("my-events");
myEventsBtn.addEventListener("click", () => {
    // искаме да е страницата на този студент => studentid от url
    window.location.href = "student_event_page.php?studentid=" + userID;
});
