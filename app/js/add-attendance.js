// Търсеният израз при обработването на входа от BBB файл.
// Трябва да е последния ред преди да започне последния списък от имена на потребители разделени с нов ред
const search_term = "Sorted by last name:\r\n";


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
        const fnInput = document.getElementById("new-fn").value.trim();

        // Разделяме ФН-тата по запетая
        const fnList = fnInput
        .split(",")
        .map(fn => fn.trim())
        .filter(fn => fn.length > 0);

        if (fnList.length === 0) {
        errorDiv.textContent = "Моля, въведете поне един ФН.";
        return;
        }


        let added = [];
        let failed = [];

        for (const fn of fnList) {
            const form = new FormData();
            form.append("eventid", eventID);
            form.append("name", nameInput); // optional
            form.append("fn", fn);
            
            // Изпращаме POST заявка към PHP backend-а
            try {
                const res = await fetch("../php/add_student_to_event.php", {
                method: "POST",
                body: form
                });

                // Четем суровия отговор
                const text = await res.text();
                // Опитваме се да парснем JSON отговора
                const data = JSON.parse(text);

                if (!res.ok) {
                failed.push(fn);
                } else {
                added.push(fn);
                }

            } catch (e) {
                failed.push(fn);
            }
        }


        // Грешка (напр. студентът не съществува)
        if (failed.length > 0) {
            errorDiv.textContent = `Неуспешно добавяне за ФН: ${failed.join(", ")}`;
        }

        // Успех
        if (added.length > 0) {
            successDiv.textContent = `Добавени ФН: ${added.join(", ")}`;
        }

        // Изчистваме textarea-та
        document.getElementById("new-name").value = "";
        document.getElementById("new-fn").value = "";

        // Презареждаме данните за събитието,
        // за да се обновят списъкът и броят присъствали
        loadEvent();
    });
}

function makeFunctionalAddStudentBBB(eventID){
    const importer = document.querySelector("#bbb-import");
    const editor = document.querySelector("#imported-user-list");

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

    document.getElementById("add-student-bbb").addEventListener("click", async () => {
        const formUsers = new FormData();
        const users = editor.value.trim();

        if (!users) return;
        formUsers.append("users", users);
        formUsers.append("eventid", eventID);
        const resUsers = await fetch("../php/event_add_users.php", {
            method: "POST",
            body: formUsers
        });

        
        const dataUsers = await resUsers.json();
        
        // Проверка за грешка
        if (!resUsers.ok) {
            alert(dataUsers.error || "Събитието не можа да бъде добавен");
            return;
        }
        // Изчистваме полето и презареждаме коментарите
        importer.value = "";
        editor.value = "";

        // Презареждаме данните за събитието,
        // за да се обновят списъкът и броят присъствали
        loadEvent();
    });
}