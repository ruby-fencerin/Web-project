// url параметри на student_page.html - studentid
const params = new URLSearchParams(window.location.search);
const userID = params.get("userid");

// попълваме информацията за студента
async function loadStudent() {
    // Изпращаме HTTP GET заявка към PHP API-то,
    // като подаваме userid като URL параметър
    const res = await fetch(`../php/user.php?userid=${encodeURIComponent(userID)}`);
    
    // Преобразуваме отговора от JSON към JavaScript обект
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
    // искаме да е страницата на този user => userid от url
    window.location.href = "student_event_page.php?userid=" + userID;
});
