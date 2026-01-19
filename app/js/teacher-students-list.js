// Контейнерът, в който ще визуализираме списъка със студенти
const container = document.getElementById("students-list");

// Основна функция за зареждане на всички студенти от базата данни
async function loadStudents() {
    // Изпращаме заявка към PHP endpoint-а,който връща всички студенти
    const res = await fetch("../php/student_list.php");

    const text = await res.text();
    let data;

    // Опитваме да парснем отговора като JSON
    try { data = JSON.parse(text); }
    catch {
        console.error("Non-JSON response:", text);
        alert("Server error: endpoint did not return JSON. Check console.");
        return;
    }

    if (!res.ok) {
        alert(data.error || "Грешка при зареждане на студентите!");
        return;
    }
    // Изчистваме контейнера
    container.innerHTML = "";

    // Обхождаме всички студенти, върнати от базата
    data.students.forEach(st => {
        // Създаваме div за един студент
        const div = document.createElement("div");
        div.dataset.id = st.id;
        // Запазваме student id като data-атрибут
        div.className = "student-page";

        const spanName = document.createElement("span");
        spanName.textContent = st.name;

        const spanFN = document.createElement("span");
        spanFN.textContent = st.fn ?? "-";

        div.appendChild(spanName);
        div.appendChild(spanFN);

        // При клик върху студент:
        // отваряме страница за преглед на студента от преподавател в нов таб
        div.addEventListener("click", () => {
        window.open(`../pages/user_page.php?studentid=${encodeURIComponent(st.id)}`, "_blank");
        });

        container.appendChild(div);
    });

    if (data.students.length === 0) {
        container.innerHTML = "<div>Няма намерени студенти.</div>";
    }
}

loadStudents();


