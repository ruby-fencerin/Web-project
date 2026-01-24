
// попълваме информацията за потребител
async function loadUser() {
    // Четем studentid от URL (може да е null)
    const params = new URLSearchParams(window.location.search);
    const studentid = params.get("studentid");

    // Питаме сървъра какъв е текущият контекст
    const ctxRes = await fetch(
        `../php/user_view_mode.php?studentid=${encodeURIComponent(studentid ?? "")}`
    );
    const ctx = await ctxRes.json();

    if (!ctxRes.ok) {
        alert(ctx.error || "Грешка при определяне на контекста");
        return;
    }

    let dataRes, data;

    // Ако режимът е "student" → преподавател гледа студент
    if (ctx.mode === "student") {
        dataRes = await fetch(
        `../php/view_student.php?studentid=${encodeURIComponent(ctx.studentid)}`
        );
        data = await dataRes.json();
    }
    // Иначе → зареждаме „За мен“ (текущия логнат потребител)
    else {
        dataRes = await fetch(`../php/user.php`);
        data = await dataRes.json();
    }

    if (!dataRes.ok) {
        alert(data.error || "Грешка при зареждане на данните");
        return;
    }

    isStudent = data.role === "student";

    // попълваме информацията за потребител
    document.getElementById("name").textContent = data.name;
    document.getElementById("fn/dep").textContent =  (isStudent) ? "ФН: " + data.fn : "Катедра: " + data.department;
    document.getElementById("email").textContent = data.email;

    if (isStudent) {
        // Функцията е дефинирана в user-stats.js
        loadStudentStats();
    }
    // else {
    //     loadTeacherStats();
    // }
}

loadUser();


