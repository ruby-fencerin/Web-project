const importer = document.querySelector("#bbb-import");
const editor = document.querySelector("#imported-user-list");
const text = "";

importer.addEventListener("change", async () => {
    // importer.disabled = true;
    const file = importer.files[0];
    if (!file){
        editor.value = 'not a valid file';
        return;
    }

    const reader = new FileReader();
    reader.readAsText(file, 'UTF-8');
    reader.onload = function ({ target }) {
        const search_term = "Sorted by last name:\r\n"
        const index = target.result.indexOf(search_term) + search_term.length;
        editor.value = target.result.slice(index);
    }
    reader.onerror = function () {
        editor.value = 'error reading file';
    }
});

document.getElementById("add").addEventListener("click", async () => {
    const title = document.getElementById("event-title").value;
    const description = document.getElementById("event-description").value;
    const start_time = document.getElementById("event-start-time").value;
    const start_date = document.getElementById("event-start-date").value;
    const end_time = document.getElementById("event-end-time").value;
    const end_date = document.getElementById("event-end-date").value;
    // Подготвяме данните за POST заявката
    const form = new FormData();
    form.append("title", title);
    form.append("description", description);
    form.append("start_at", start_date + " " + start_time + ":00");
    form.append("end_at", end_date + " " + end_time  + ":00");
    
    // Изпращаме заявката към сървъра
    const res = await fetch("../php/event_create.php", {
        method: "POST",
        body: form
    });

    
    const data = await res.json();
    
    // Проверка за грешка
    if (!res.ok) {
        alert(data.error || "Събитието не можа да бъде добавен");
        return;
    }

    const formUsers = new FormData();
    const users = editor.value.trim();

    if (!users) return;
    formUsers.append("users", users);
    console.log(data.eventId[0].id);
    formUsers.append("eventid", data.eventId[0].id);
    const resUsers = await fetch("../php/event_add_users.php", {
        method: "POST",
        body: formUsers
    });

    
    const dataUsers = await resUsers.json();
    
    // Проверка за грешка
    if (!resUsers.ok) {
        alert(dataUsers.error || "Събитието не можа да бъде добавен");
        return;
    }
    // Изчистваме полето и презареждаме коментарите
    importer.value = "";
    editor.value = "";
    window.location.href = "event_list_page.php";
});

const backButton = document.getElementById("back");
backButton.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    window.location.href = "event_list_page.php";
});