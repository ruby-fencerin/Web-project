
// попълваме информацията за потребител
async function loadUser() {
    // Изпращаме HTTP GET заявка към PHP 
    const res = await fetch(`../php/user.php`);    
    
    // Преобразуваме отговора от JSON към JavaScript обект
    const data = await res.json();

    if (!res.ok) {
      alert(data.error || "Грешка при зареждане на студент!");
      return;
    }

    console.log(data);

    isStudent = data.role === "student";

    // попълваме информацията за потребител
    document.getElementById("name").textContent = data.name;
    document.getElementById("fn/dep").textContent =  (isStudent) ? "ФН: " + data.fn : "Катедра: " + data.department;
    document.getElementById("email").textContent = data.email;
}

loadUser();

// функционалност на опция в менюто "мои събития" - към страницата с всички събития (student_event_page.html)
myEventsBtn = document.getElementById("my-events");
myEventsBtn.addEventListener("click", () => {
    // искаме да е страницата на този user => userid от url
    window.location.href = "student_event_page.php";
});

// функционалност на опция в менюто "студенти" - към списък със студенти (teacher_page_list_students.html)
studentsListBtn = document.getElementById("list-all-students");
studentsListBtn.addEventListener("click", () => {
    // за всички преподаватели е еднаква страница, но за да можем да се върнем, подаваме teacherID
    window.location.href = "teacher_page_list_students.php";
});
