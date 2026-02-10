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

document.getElementById("add").addEventListener("click", async () => {
    const title = (document.getElementById("event-title")?.value || "").trim();
    const description = (document.getElementById("event-description")?.value || "").trim();
    const start_time = (document.getElementById("event-start-time")?.value || "").trim();
    const start_date = (document.getElementById("event-start-date")?.value || "").trim();
    const end_time = (document.getElementById("event-end-time")?.value || "").trim();
    const end_date = (document.getElementById("event-end-date")?.value || "").trim();
    const major = (document.getElementById("major-select")?.value || "").trim();

    // Debug: виж в конзолата какво реално изпращаш
    console.log({ title, description, start_date, start_time, end_date, end_time, major });

    if (!title) return alert("Моля, въведете заглавие.");
    if (!description) return alert("Моля, въведете описание.");
    if (!start_date || !start_time) return alert("Моля, въведете начало (дата и час).");
    if (!end_date || !end_time) return alert("Моля, въведете край (дата и час).");
    if (!major) return alert("Моля, изберете специалност.");
    
    
    const form = new FormData();
    form.append("title", title);
    form.append("description", description);
    form.append("start_at", `${start_date} ${start_time}:00`);
    form.append("end_at", `${end_date} ${end_time}:00`);
    form.append("major", major);

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
    console.log(data.eventId);
    formUsers.append("eventid", data.eventId);
    
    
    const resUsers = await fetch("../php/event_add_users.php", {
        method: "POST",
        body: formUsers
    });

    
    const dataUsers = await resUsers.json();
    
    // Проверка за грешка
    if (!resUsers.ok) {
        alert(dataUsers.error || "Събитието не можа да бъде добавено");
        return;
    }
    // Изчистваме полето и презареждаме коментарите
    importer.value = "";
    editor.value = "";
    //window.location.href = "event_list_page.php";
});

const backButton = document.getElementById("back");
backButton.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    window.location.href = "event_list_page.php";
});