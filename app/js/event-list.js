// url параметри на student_event_page.html - userid
const params = new URLSearchParams(window.location.search);
const userID = params.get("userid");

if (!userID) {
  alert("Липсва userid в URL!");
  throw new Error("Missing userid");
}

const eventsContainer = document.getElementById("events");

function formatDateTime(dtStr) {
  const d = new Date(dtStr.replace(" ", "T"));
  if (Number.isNaN(d.getTime())) return { date: dtStr, time: "" };

  const date = d.toLocaleDateString("bg-BG");
  const time = d.toLocaleTimeString("bg-BG", { hour: "2-digit", minute: "2-digit" });
  return { date, time };
}

async function loadMyEvents() {
  const res = await fetch(`../php/event_list.php?userid=${encodeURIComponent(userID)}`);

  const text = await res.text();
  let data;
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

  eventsContainer.innerHTML = "";

  data.events.forEach(ev => {
    const div = document.createElement("div");
    div.dataset.id = ev.id;

    div.className = "event lecture";

    const start = formatDateTime(ev.start_at);

    const spanType = document.createElement("span");
    spanType.textContent = ev.title;

    const spanDate = document.createElement("span");
    spanDate.textContent = start.date;

    const spanTime = document.createElement("span");
    spanTime.textContent = start.time;

    div.appendChild(spanType);
    div.appendChild(spanDate);
    div.appendChild(spanTime);

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

document.getElementById("for-me").addEventListener("click", () => {
  window.location.href = `student_page.php?userid=${encodeURIComponent(userID)}`;
});
