// Помощна функция, която по подаден списък от студенти ги изобразява в div-а с id = "attendance-list"
function loadAttendanceList(attendingStudents) {
    // Вземаме div-а с id = "attendance-list"
    const list = document.getElementById("attendance-list")
    // Изчистваме стария списък
    list.innerHTML = "";

    // Сортираме имената
    attendingStudents.sort((s1, s2) => s1.name.localeCompare(s2.name));

    // Създаваме div за всеки студент
    attendingStudents.forEach(st => {
        const div = document.createElement("div");

        // Слагаме id на студента от базата данни като dataset.id атрибут
        div.dataset.id = st.id;
        div.classList.add("student-in-attendance-list");

        const spanName = document.createElement("span");
        spanName.textContent = st.name;

        const spanFN = document.createElement("span");
        spanFN.textContent = st.fn ?? "-";

        div.appendChild(spanName);
        div.appendChild(spanFN);

        // При клик отбелязваме, че студентът всъщност не е присъствал
        div.addEventListener("click", () => {
            // Тук слагаме логиката за премахването на присъствието от БД -> връзка с backend

            // Променяме стила на div-а
            div.classList.toggle("not-present");
        });

        // Добавяме студента към списъка
        list.appendChild(div);
    });
}
