// Взимаме параметрите от URL адреса
const params = new URLSearchParams(window.location.search);
const userID = params.get("userid");

// Проверка дали имаме userid
if (!userID) {
  alert("Липсва userid в URL!");
  throw new Error("Missing userid");
}

// Контейнерът, в който ще показваме събитията
const eventsContainer = document.getElementById("events");

// Помощна функция за форматиране на дата и час
function formatDateTime(dtStr) {
    
  // Превръщаме MySQL datetime във JavaScript Date
  const d = new Date(dtStr.replace(" ", "T"));
      
  // Ако нещо се обърка, връщаме оригиналния стринг
  if (Number.isNaN(d.getTime())) return { date: dtStr, time: "" };

  const date = d.toLocaleDateString("bg-BG");
  const time = d.toLocaleTimeString("bg-BG", { hour: "2-digit", minute: "2-digit" });
  return { date, time };
}

// Основна функция – зарежда събитията от базата
async function loadMyEvents() {
  // Изпращаме заявка към PHP endpoint-а
  const res = await fetch(`../php/event_list.php?userid=${encodeURIComponent(userID)}`);
  
  // Четем суровия отговор (за по-лесно дебъгване)
  const text = await res.text();
  let data;

  // Опитваме да парснем JSON
  try { data = JSON.parse(text); }
  catch {
    console.error("Non-JSON response:", text);
    alert("Server error: endpoint did not return JSON. Check console.");
    return;
  }

  if (!res.ok) {
    alert(data.error || "Грешка при зареждане на събития!");
    return;
  }

  // Изчистваме старото съдържание
  eventsContainer.innerHTML = "";
  
  // За всяко събитие от базата
  data.events.forEach(ev => {
    const div = document.createElement("div");
    div.dataset.id = ev.id;

    div.className = "event lecture";
    
    // Форматираме датата и часа
    const start = formatDateTime(ev.start_at);
    
    // Заглавие на събитието
    const spanTitle = document.createElement("span");
    spanTitle.textContent = ev.title;

    // Дата
    const spanDate = document.createElement("span");
    spanDate.textContent = start.date;

    //Час
    const spanTime = document.createElement("span");
    spanTime.textContent = start.time;

    div.appendChild(spanTitle);
    div.appendChild(spanDate);
    div.appendChild(spanTime);

    // При клик → отиваме на страницата за конкретното събитие
    div.addEventListener("click", () => {
      window.location.href =
        `event_page_student_view.php?eventid=${encodeURIComponent(ev.id)}&userid=${encodeURIComponent(userID)}`;
    });

    eventsContainer.appendChild(div);
  });

  if (data.events.length === 0) {
    eventsContainer.innerHTML = "<div>Няма намерени събития за този студент.</div>";
  }
}

loadMyEvents();

// Меню → „За мен“
document.getElementById("for-me").addEventListener("click", () => {
  window.location.href = `student_page.php?userid=${encodeURIComponent(userID)}`;
});
