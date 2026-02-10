// Търсеният израз при обработването на входа от BBB файл.
// Трябва да е последния ред преди да започне последния списък от имена на потребители разделени с нов ред
const search_term = "Sorted by last name:\r\n";

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
        const index = target.result.indexOf(search_term) + search_term.length;
        editor.value = target.result.slice(index);
    }
    reader.onerror = function () {
        editor.value = 'error reading file';
    }
});

async function addUsersToEvent(data, users, i){
    let formUsers = new FormData();
    formUsers.append("users", users);
    let event = JSON.parse(data.eventId[i]);
    // console.log(event[event.length - 1].id);
    formUsers.append("eventid", event[event.length - 1].id);

    let resUsers = await fetch("../php/event_add_users.php", {
        method: "POST",
        body: formUsers
    });

    
    let dataUsers = await resUsers.json();
    
    // Проверка за грешка
    if (!resUsers.ok) {
        alert(dataUsers.error || "В събитие " + event[event.length - 1].id + " не могат да бъдат добавени потребители.");
        return;
    }
}

document.getElementById("add").addEventListener("click", async () => {
    const title = document.getElementById("event-title").value;
    const description = document.getElementById("event-description").value;
    const start_time = document.getElementById("event-start-time").value;
    const start_date = document.getElementById("event-start-date").value;
    const end_time = document.getElementById("event-end-time").value;
    const end_date = document.getElementById("event-end-date").value;
    // Подготвяме данните за POST заявката
    const form = new FormData();
    form.append("title", JSON.stringify([title]));
    form.append("description", JSON.stringify([description]));
    form.append("start_at", JSON.stringify([start_date + " " + start_time + ":00"]));
    form.append("end_at", JSON.stringify([end_date + " " + end_time  + ":00"]));
    
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

    const users = editor.value.trim();
    
    if (!users) return;
    // console.log(data.eventId);
    addUsersToEvent(data, users, 0);

    // Изчистваме полето и презареждаме коментарите
    importer.value = "";
    editor.value = "";
    // window.location.href = "event_list_page.php";
});

function transpose(matrix) {
  return matrix[0].map((col, i) => matrix.map(row => row[i]));
}

function mapDayTime(datearr, timearr){
    return datearr.map((date, ind) => {return date + " " + timearr[ind] + ":00"});
}

document.getElementById("add-multiple").addEventListener("click", async () => {
    const events_list_value = document.querySelector("#imported-event-list").value;
    events_list = events_list_value.split("\n").map(t => t.split(","));
    console.log(events_list);
    events_transpose = transpose(events_list);
    // Подготвяме данните за POST заявката
    const form = new FormData();
    form.append("title", JSON.stringify(events_transpose[0]));
    form.append("description", JSON.stringify(events_transpose[1]));
    form.append("start_at", JSON.stringify(mapDayTime(events_transpose[2], events_transpose[3])));
    form.append("end_at", JSON.stringify(mapDayTime(events_transpose[4], events_transpose[5])));
    
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

    const users = editor.value.trim();
    
    if (!users) return;
    // console.log(data.eventId);
    for(let i = 0; i < data.eventId.length; i++){
        addUsersToEvent(data, users, i);
    }

    // Изчистваме полето и презареждаме коментарите
    importer.value = "";
    editor.value = "";
    // window.location.href = "event_list_page.php";
});

const backButton = document.getElementById("back");
backButton.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    window.location.href = "event_list_page.php";
});