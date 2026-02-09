// Взимаме параметрите от URL 
const params = new URLSearchParams(window.location.search);
const eventID = params.get("eventid");

// Проверка дали има подадено eventid
if (!eventID) {
  alert("Липсва eventid в URL!");
  throw new Error("Missing params");
}

// HTML елементи за списъка с присъстващи и броя им
const list = document.getElementById("attendance-list");
const count = document.getElementById("count-attendance");

// Зареждане на информацията за събитието
async function loadEvent() {
    // Изпращаме GET заявка към PHP endpoint-а за събитието
    const res = await fetch(`../php/event.php?eventid=${encodeURIComponent(eventID)}`);

    // Четем суровия отговор (за да хванем PHP грешки)
    const text = await res.text();
    let data;

    // Опитваме се да парснем JSON
    try { 
        data = JSON.parse(text); 
    }
    catch {
        console.error("Non-JSON response:", text);
        alert("Сървърна грешка – отговорът не е JSON.");
        return;
    }

    // Проверка за грешка
    if (!res.ok) {
        alert(data.error || "Грешка при зареждане на събитието!");
        return;
    }

    // Данните за събитието
    const ev = data.event;

    // Попълване на информацията в HTML
    document.getElementById("event-title").textContent = ev.title;
    document.getElementById("event-teacher").textContent =
        "Преподавател: " + ev.teacher_name;
    document.getElementById("event-info").textContent =
        "Информация: " + ev.info;

    // Показваме броя на присъствалите
    count.textContent = data.attendance.count;

    // Изобразяваме списъка със студенти (функцията е дефинирана в attendance-list.js)
    loadAttendanceList(data.attendance.students, data.role);

    makeFunctionalShowAttending(data.role);
}
    
// Първоначално зареждане на данните
loadEvent();
makeFunctionalAddStudent(eventID);
makeFunctionalAddStudentBBB(eventID);

// Зареждаме ресурсите и добавяме функционалност на бутона за
// добавяне на ресурси - функциите са дефинирани в add-resource.js
loadResources(eventID);
makeFunctionalAddResource(eventID);

// Зареждаме коментарите и добавяме функционалност на бутона за
// добавяне на коментари - функциите са дефинирани в add-comment.js
loadComments(eventID);
makeFunctionalAddComment(eventID);


function makeFunctionalShowAttending(userRole) {
    // Показване / скриване на списъка с присъстващи
    document.getElementById("show-attending")
        .addEventListener("click", () => {
            list.classList.toggle("hidden");
            
            if (userRole == 'teacher') {
                // Показване / скриване на инструкцията 
                // за премахване / повторно добавяне на студент
                const instruction = document.getElementById("remove-student-instruction");
                instruction.classList.toggle("hidden");

                // Показване / скриване на формата за записване на студент към събитието
                // Засега е скрита с бутона "Присъствали", може да се промени
                const addStudentDiv = document.getElementById("add-student-div");
                addStudentDiv.classList.toggle("hidden");
            }
        });
}

// Навигация – връщане към списъка със събития
document.getElementById("back").addEventListener("click", () => {
    window.location.href = "event_list_page.php";
});
