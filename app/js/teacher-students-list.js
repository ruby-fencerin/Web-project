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

      // Сортираме имената
    data.students.sort((s1, s2) => s1.name.localeCompare(s2.name));

    // Обхождаме всички студенти, върнати от базата
    data.students.forEach(st => {

        // Основен контейнер за един студент
        const div = document.createElement("div");
        div.dataset.id = st.id;          // student id като data-атрибут
        div.className = "student-page";

        // Име
        const spanName = document.createElement("span");
        spanName.className = "student-name";
        spanName.textContent = st.name;

        // Факултетен номер
        const spanFN = document.createElement("span");
        spanFN.className = "student-fn";
        spanFN.textContent = (st.fn ?? "-");

        // Специалност
        const divMajor = document.createElement("div");
        divMajor.className = "student-major";
        divMajor.textContent = (st.major ?? "-");

        // Група и курс
        const divGroupYear = document.createElement("div");
        divGroupYear.className = "student-group-year";
        divGroupYear.textContent =
            "Група " + (st.student_group ?? "-") +
            " · " + (st.study_year ?? "-") + " курс";

        // Година на прием
        const divStartYear = document.createElement("div");
        divStartYear.className = "student-start-year";
        divStartYear.textContent =
            "Приет " + (st.start_year ?? "-");

        // Добавяме всички елементи към контейнера на студента
        div.appendChild(spanName);
        div.appendChild(spanFN);
        div.appendChild(divMajor);
        div.appendChild(divGroupYear);
        div.appendChild(divStartYear);

        // При клик – отваряме страницата на студента в нов таб
        div.addEventListener("click", () => {
            window.open(
                `../pages/user_page.php?studentid=${encodeURIComponent(st.id)}`,
                "_blank"
            );
        });

    // Добавяме студента към основния контейнер
    container.appendChild(div);
});

    if (data.students.length === 0) {
        container.innerHTML = "<div>Няма намерени студенти.</div>";
    }
}

loadStudents();

// Студенти → „Добави студенти“
document.getElementById("add-student").addEventListener("click", () => {
  window.location.href = `add_users_page.php`;
});
