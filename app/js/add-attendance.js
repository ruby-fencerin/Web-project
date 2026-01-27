
// Функция, която добавя функционалност за ръчно добавяне на студент към събитие
function makeFunctionalAddStudent(eventID) {

    // Вземаме бутона за добавяне на студент
    const btn = document.getElementById("add-student");
    if (!btn) return;


    // При клик върху бутона "Добави"
    btn.addEventListener("click", async () => {
        const successDiv = document.getElementById("add-student-succes");
        const errorDiv   = document.getElementById("add-student-error");
        successDiv.textContent = "";
        errorDiv.textContent = "";

        // Взимаме стойностите от двете полета
        const nameInput = document.getElementById("new-name").value.trim();
        const fnInput   = document.getElementById("new-fn").value.trim();

        // Базова валидация
        if (!fnInput) {
        errorDiv.textContent = "Моля, въведете ФН.";
        return;
        }

        const form = new FormData();
        form.append("eventid", eventID);
        form.append("name", nameInput); // за проверка
        form.append("fn", fnInput);


        // Изпращаме POST заявка към PHP backend-а
         const res = await fetch("../php/add_student_to_event.php", {
            method: "POST",
            body: form
        });

        // Четем суровия отговор
        const text = await res.text();
        let data;

        // Опитваме се да парснем JSON отговора
        try {
            data = JSON.parse(text);
        } catch {
            console.error("Non-JSON response:", text);
            alert("Сървърна грешка при добавяне на студент.");
            return;
        }


        // Грешка (напр. студентът не съществува)
        if (!res.ok) {
            errorDiv.textContent =
                data.error || "Грешка при добавяне на студент.";
            return;
        }

        // Успех
        successDiv.textContent =
            `Добавен студент: ${data.student.name} (${data.student.fn ?? "-"})`;

        // Изчистваме textarea-та
        document.getElementById("new-name").value = "";
        document.getElementById("new-fn").value = "";

        // Презареждаме данните за събитието,
        // за да се обновят списъкът и броят присъствали
        loadEvent();
    });
}
