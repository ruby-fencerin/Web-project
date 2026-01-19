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

    // Изчистваме стария списък
    list.innerHTML = "";

    // Сортираме имената и ги добавяме в списъка
    data.attendance.students.sort();
    for (const name of data.attendance.students) {
        list.innerHTML += name + "<br>";
    }
}

// Зареждане на коментарите за събитието
async function loadComments() {
    const res = await fetch(
        `../php/event_comments.php?eventid=${encodeURIComponent(eventID)}`
    );

    const text = await res.text();
    let data;

    // Безопасно парсване на JSON
    try {
        data = JSON.parse(text);
    } catch {
        console.error("Non-JSON response (comments):", text);
        alert("Грешка при зареждане на коментарите.");
        return;
    }

    // Проверка за грешка от сървъра
    if (!res.ok) {
        alert(data.error || "Грешка при зареждане на коментарите");
        return;
    }

    // Контейнерът, в който ще показваме коментарите
    const commentsList = document.getElementById("comments-list");
    commentsList.innerHTML = "";

    // Визуализиране на всеки коментар
    data.comments.forEach(c => {
        commentsList.innerHTML += `
            <div class = "comment">
                <div class = "comment-info">
                    <span class = "sender-name">${c.author}</span>
                    <span class = "comment-data">${new Date(c.created_at).toLocaleString()}</span>
                </div>
                <div class = "comment-content">
                    ${c.body}
                </div>
            </div>
        `;
    });
}

// Първоначално зареждане на данните
loadEvent();
loadResources(eventID); // зареждане на ресурси
loadComments();

// Добавяне на нов коментар
document.getElementById("add-comment").addEventListener("click", async () => {
    const text = document.getElementById("comment-text").value.trim();
    if (!text) return;

    // Подготвяме данните за POST заявката
    const form = new FormData();
    form.append("eventid", eventID);
    form.append("text", text);

    // Изпращаме заявката към сървъра
    const res = await fetch("../php/add_comment.php", {
        method: "POST",
        body: form
    });

    const data = await res.json();

    // Проверка за грешка
    if (!res.ok) {
        alert(data.error || "Коментарът не можа да бъде добавен");
        return;
    }

    // Изчистваме полето и презареждаме коментарите
    document.getElementById("comment-text").value = "";
    loadComments();
});

// Показване / скриване на списъка с присъстващи
document.getElementById("show-attending")
    .addEventListener("click", () => {
        list.classList.toggle("hidden");
    });

// Навигация – връщане към списъка със събития
document.getElementById("back").addEventListener("click", () => {
    window.location.href = "student_event_page.php";
});