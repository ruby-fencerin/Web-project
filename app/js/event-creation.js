// Зареждане на спецялности в падащо меню
async function loadMajors() {
  const select = document.getElementById("major-select");
  if (!select) return;

  select.querySelectorAll("option:not(:first-child)").forEach(o => o.remove());

  const res = await fetch("../php/majors.php");
  const text = await res.text();
  let data;

  try { data = JSON.parse(text); }
  catch {
    console.error("Non-JSON response:", text);
    alert("Сървърна грешка при зареждане на специалности.");
    return;
  }

  if (!res.ok) {
    alert(data.error || "Грешка при зареждане на специалности.");
    return;
  }

  data.majors.forEach(m => {
    const opt = document.createElement("option");
    opt.value = m;
    opt.textContent = m;
    select.appendChild(opt);
  });
}

loadMajors();



// Търсеният израз при обработването на входа от BBB файл.
// Трябва да е последния ред преди да започне последния списък от имена на потребители разделени с нов ред
const search_term = "Sorted by last name:\r\n";

async function changeTextarea(importerInput, editorArea, search_term){
    //importerInput.disabled = true;
    const file = importerInput.files[0];
    if (!file){
        editorArea.value = 'not a valid file';
        return;
    }

    const reader = new FileReader();
    reader.readAsText(file, 'UTF-8');
    reader.onload = function ({ target }) {
        const index = target.result.indexOf(search_term) + search_term.length;
        editorArea.value = target.result.slice(index);
    }
    reader.onerror = function () {
        editorArea.value = 'error reading file';
    }
}
const importerBBB = document.querySelector("#bbb-import");
const editorBBB = document.querySelector("#imported-user-list");
importerBBB.addEventListener("change", () => changeTextarea(importerBBB, editorBBB,search_term));

const importerEvents = document.querySelector("#event-import");
const editorEvents = document.querySelector("#imported-event-list");
importerEvents.addEventListener("change", () => changeTextarea(importerEvents, editorEvents, ""));

const importerMaterials = document.querySelector("#material-import");
const editorMaterials = document.querySelector("#imported-material-list");
importerMaterials.addEventListener("change", () => changeTextarea(importerMaterials, editorMaterials, ""));

async function addUsersToEvent(data, users, i){
    let formUsers = new FormData();
    formUsers.append("users", users);
    // console.log(event[event.length - 1].id);
    formUsers.append("eventid", data.eventId[i]);

    let resUsers = await fetch("../php/event_add_users.php", {
        method: "POST",
        body: formUsers
    });

    
    let dataUsers = await resUsers.json();
    
    // Проверка за грешка
    if (!resUsers.ok) {
        alert(dataUsers.error || "В събитие " + data.eventId[i] + " не могат да бъдат добавени потребители.");
        return;
    }
}

async function addResourceToEvent(data, eventIds){
    const eventID = eventIds[data[0] - 1];
    const resourceTitle = data[1].trim();
    const resourceURL = data[2].trim();
    const resourceType = data[3].trim();

    if (!resourceTitle && !resourceURL && !resourceType) return;

    // Подготвяме данните за POST заявката
    const formResource = new FormData();
    formResource.append("eventid", eventID);
    formResource.append("title", resourceTitle);
    formResource.append("url", resourceURL);
    formResource.append("type", resourceType);

    // Изпращаме заявката към сървъра
    const res = await fetch("../php/add_resource.php", {
        method: "POST",
        body: formResource
    });

    const text = await res.text();

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
        alert(data.error || "Ресурсът не можа да бъде добавен");
        return;
    }
}

document.getElementById("add").addEventListener("click", async () => {
    const title = (document.getElementById("event-title")?.value || "").trim();
    const description = (document.getElementById("event-description")?.value || "").trim();
    const start_time = (document.getElementById("event-start-time")?.value || "").trim();
    const start_date = (document.getElementById("event-start-date")?.value || "").trim();
    const end_time = (document.getElementById("event-end-time")?.value || "").trim();
    const end_date = (document.getElementById("event-end-date")?.value || "").trim();
    const major = (document.getElementById("major-select")?.value || "").trim();
    const year  = (document.getElementById("year-select")?.value || "").trim();
    const groupsRaw = (document.getElementById("group-select")?.value || "").trim();



    // Debug: виж в конзолата какво реално изпращаш
    console.log({ title, description, start_date, start_time, end_date, end_time, major, groupsRaw });

    if (!title) return alert("Моля, въведете заглавие.");
    if (!description) return alert("Моля, въведете описание.");
    if (!start_date || !start_time) return alert("Моля, въведете начало (дата и час).");
    if (!end_date || !end_time) return alert("Моля, въведете край (дата и час).");
    if (!year)  return alert("Моля, въведете курс.");
    
    const form = new FormData();
    form.append("title", JSON.stringify([title]));
    form.append("description", JSON.stringify([description]));
    form.append("start_at", JSON.stringify([`${start_date} ${start_time}:00`]));
    form.append("end_at", JSON.stringify([`${end_date} ${end_time}:00`]));
    form.append("major", major);
    form.append("year", year);  
    form.append("groups", groupsRaw); // may be empty

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

    const users = editorBBB.value.trim();
    
    if (!users) return;
    // console.log(data.eventId);
    await addUsersToEvent(data, users, 0);

    // Изчистваме полето и презареждаме коментарите
    importerBBB.value = "";
    editorBBB.value = "";
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
    const events_list = events_list_value.split("\n").map(t => t.split(","));
    //console.log(events_list);
    const events_transpose = transpose(events_list);
    const major = (document.getElementById("major-select")?.value || "").trim();
    const year  = (document.getElementById("year-select")?.value || "").trim();
    const groupsRaw = (document.getElementById("group-select")?.value || "").trim();
    
    // Подготвяме данните за POST заявката
    const form = new FormData();
    form.append("title", JSON.stringify(events_transpose[0]));
    form.append("description", JSON.stringify(events_transpose[1]));
    form.append("start_at", JSON.stringify(mapDayTime(events_transpose[2], events_transpose[3])));
    form.append("end_at", JSON.stringify(mapDayTime(events_transpose[4], events_transpose[5])));
    form.append("major", major);
    form.append("year", year);  
    form.append("groups", groupsRaw);
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

    const users = editorBBB.value.trim();
    
    if (users){
    // console.log(data.eventId);
        for(let i = 0; i < data.eventId.length; i++){
            await addUsersToEvent(data, users, i);
        }
    }

    const resourceValue = editorMaterials.value.trim();
    if(resourceValue){
        const resource_list = resourceValue.split("\n").map(t => t.split(","));

        for(let i = 0; i < resource_list.length; i++){
            await addResourceToEvent(resource_list[i], data.eventId)
        }
    }
    // Изчистваме полето и презареждаме коментарите
    importerBBB.value = "";
    editorBBB.value = "";
    // window.location.href = "event_list_page.php";
});

const backButton = document.getElementById("back");
backButton.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    window.location.href = "event_list_page.php";
});