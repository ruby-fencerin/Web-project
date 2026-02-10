const importer = document.querySelector("#users-import");
const editor = document.querySelector("#imported-user-list");
const text = "";

importer.addEventListener("change", async () => {
    //importer.disabled = true;
    const file = importer.files[0];
    if (!file){
        editor.value = 'not a valid file';
        importer.input = "";
        return;
    }

    const reader = new FileReader();
    reader.readAsText(file, 'UTF-8');
    reader.onload = function ({ target }) {
        editor.value = target.result;
    }
    reader.onerror = function () {
        editor.value = 'error reading file';
    }
    importer.input = "";
});

document.getElementById("add-one").addEventListener("click", async () =>{
    const first_name = document.getElementById("first-name").value.trim();
    const family_name = document.getElementById("family-name").value.trim();
    const email = document.getElementById("email").value.trim();
    const fn = document.getElementById("fn").value.trim();
    const major = document.getElementById("major").value.trim();
    const group = document.getElementById("group").value.trim();
    const start_year = document.getElementById("start-year").value.trim();
    const study_year = document.getElementById("study-year").value.trim();

    // Подготвяме данните за POST заявката
    const line = `${first_name},${family_name},${email},${fn},${major},${group},${start_year},${study_year}`;

    const form = new FormData();
    form.append("users", line);

    
    // Изпращаме заявката към сървъра
    const res = await fetch("../php/add_users.php", {
        method: "POST",
        body: form
    });

    
    const data = await res.json();
    
    // Проверка за грешка
    if (!res.ok) {
        alert(data.error || "Събитието не можа да бъде добавен");
        return;
    }

    document.getElementById("success-one").textContent = "Студентът беше добавен успешно.";

    document.getElementById("first-name").value = "";
    document.getElementById("family-name").value = "";
    document.getElementById("email").value = "";
    document.getElementById("fn").value = "";
    document.getElementById("major").value = "";
    document.getElementById("group").value = "";
    document.getElementById("start-year").value = "";
    document.getElementById("study-year").value = "";


});

document.getElementById("add-multiple").addEventListener("click", async () => {
    const formUsers = new FormData();
    const users = editor.value.trim();

    if (!users) return;
    formUsers.append("users", users);
    
    const resUsers = await fetch("../php/add_users.php", {
        method: "POST",
        body: formUsers
    });

    
    const dataUsers = await resUsers.json();
    
    // Проверка за грешка
    if (!resUsers.ok) {
        alert(dataUsers.error || "Събитието не можа да бъде добавен");
        return;
    }
    // Изчистваме полето и презареждаме
    editor.value = "";
    importer.value = "";


    document.getElementById("success-many").textContent = "Студентите бяха добавени успешно.";
});

const backButton = document.getElementById("back");
backButton.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    window.location.href = "teacher_page_list_students.php";
});