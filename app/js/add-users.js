const importer = document.querySelector("#users-import");
const editor = document.querySelector("#imported-user-list");
const text = "";

importer.addEventListener("change", async () => {
    importer.disabled = true;
    const file = importer.files[0];
    if (!file){
        editor.value = 'not a valid file';
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
});

document.getElementById("add-one").addEventListener("click", async () =>{
    const first_name = document.getElementById("first-name").value;
    const family_name = document.getElementById("family-name").value;
    const email = document.getElementById("email").value;
    const fn = document.getElementById("fn").value;
    // Подготвяме данните за POST заявката
    const form = new FormData();
    form.append("users", first_name+","+family_name+","+email+","+fn);
    
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
    // Изчистваме полето и презареждаме коментарите
    editor.value = "";
});

const backButton = document.getElementById("back");
backButton.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    window.location.href = "teacher_page_list_students.php";
});