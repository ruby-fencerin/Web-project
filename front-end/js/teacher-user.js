// намираме id (от базата TEACHERS) на учителя с име = името, което пише в html елемента с id = "name"
const teacherName = document.getElementById("name").textContent.trim();
teacherID = Object.keys(TEACHERS).find(id => TEACHERS[id].name === teacherName);

// функционалност на опция в менюто "мои събития" - към страницата с всички събития (teacher_event_page.html)
myEventsBtn = document.getElementById("my-events");
myEventsBtn.addEventListener("click", () => { 
    if (!teacherID) 
    {
        alert("Преподавателят не е намерен!");
        return;
    }
    
    // искаме да е страницата на този преподавател => teacherID
    window.location.href = "teacher_event_page.html?teacherid=" + teacherID;
});

// функционалност на опция в менюто "студенти" - към списък със студенти (teacher_page_list_students.html)
studentsListBtn = document.getElementById("list-all-students");
studentsListBtn.addEventListener("click", () => {
    if (!teacherID) 
    {
        alert("Преподавателят не е намерен!");
        return;
    }
    
    // за всички преподаватели е еднаква страница, но за да можем да се върнем, подаваме teacherID
    window.location.href = "teacher_page_list_students.html?teacherid=" + teacherID;
});