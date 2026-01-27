// Помощна функция, която по подаден списък от студенти ги изобразява в div-а с id = "attendance-list"
function loadAttendanceList(attendingStudents, role) {
    // Вземаме div-а с id = "attendance-list"
    const list = document.getElementById("attendance-list")
    const count = document.getElementById("count-attendance");
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

        // Ако студента е премахван, променяме стила
        if(st.present == 0){
            div.classList.add("not-present");
        }

        const spanName = document.createElement("span");
        spanName.textContent = st.name;

        const spanFN = document.createElement("span");
        spanFN.textContent = st.fn ?? "-";

        div.appendChild(spanName);
        div.appendChild(spanFN);

        // При клик отбелязваме, че студентът всъщност не е присъствал
        // Само при преподавателски профил
        if (role === 'teacher') {
            div.addEventListener("click", async () => {
                // Подготвяме данните за POST заявката
                const toggledStudent = new FormData();
                toggledStudent.append("eventid", eventID);     
                toggledStudent.append("studentid", st.id);

                // Изпращаме заявка към backend-а
                const res = await fetch("../php/toggle_attendance.php", {
                    method: "POST",
                    body: toggledStudent
                });

                const data = await res.json();

                if (!res.ok) {
                    alert(data.error || "Грешка при промяна на присъствието");
                    return;
                }

                // Обновяваме локалното състояние
                st.present = data.present;
                
                // Показваме броя на присъствалите, с корекция спрямо промяната
                if (st.present == 0){
                    count.textContent --;
                }else{
                    count.textContent ++;
                }

                // Променяме стила на div-а
                div.classList.toggle("not-present");
            });
        }
            // Добавяме студента към списъка
            list.appendChild(div);
    });
}
