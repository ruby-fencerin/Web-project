// намираме id (от базата TEACHERS) на учителя с име = името, което пише в html елемента с id = "name"
//const teacherName = document.getElementById("name").textContent.trim();
//teacherID = Object.keys(TEACHERS).find(id => TEACHERS[id].name === teacherName);
const params = new URLSearchParams(window.location.search);
const userID = params.get("userid");

async function loadTeacher() {
    // Изпращаме HTTP GET заявка към PHP API-то,
    // като подаваме userid като URL параметър
    const res = await fetch(`../php/teacher.php?userid=${encodeURIComponent(userID)}`);
    
    // Преобразуваме отговора от JSON към JavaScript обект
    const data = await res.json();

    if (!res.ok) {
        alert(data.error || "Грешка при зареждане на преподавател!");
        return;
    }

    //Попълваме данните на страницата
    document.getElementById("name").textContent = data.name;
    document.getElementById("department").textContent = data.department;
    document.getElementById("email").textContent = data.email;
}

loadTeacher();


// функционалност на опция в менюто "студенти" - към списък със студенти (teacher_page_list_students.html)
studentsListBtn = document.getElementById("list-all-students");
studentsListBtn.addEventListener("click", () => {
    if (!userID) 
    {
        alert("Преподавателят не е намерен!");
        return;
    }
    
    // за всички преподаватели е еднаква страница, но за да можем да се върнем, подаваме teacherID
    window.location.href = "teacher_page_list_students.php?userid=" + userID;
});