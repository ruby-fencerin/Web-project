
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
        loadStudentStats();
    }
    // else {
    //     loadTeacherStats();
    // }
}

// Функция, която зарежда данните за броя събития,
// на които е присъствал студента, и рисува barplot с Chart.js
async function loadStudentStats() {
     // Зареждаме данните от php endpoint-а
    const res = await fetch('../php/stats-student.php');

    // Преобразуваме данните първо в текстов формат за по-лесно дебъгване
    const text = await res.text();

    if (!res.ok) {
        console.error(data.error || 'Грешка при зареждането на статистиките.')
        return;
    }

    // Преобразуваме данните в JSON формат
    try { 
        data = JSON.parse(text); 
    }
    catch {
        console.error("Non-JSON response:", text);
        alert("Сървърна грешка – отговорът не е JSON.");
        return;
    }

    const attendance = (100 * (data.events_count / data.total)).toFixed(0);
    console.log(attendance);

    const hue = 45;
    const color = `hsla(${hue}, 98%, 75%, 0.5)`;
    const borderColor = `hsla(${hue}, 98%, 70%, 0.6)`;

    const canvas = document.getElementById("single-bar-plot");
    new Chart(canvas, {
        type: 'bar',
        data: {
            labels: ['Присъствие'],
            datasets: [{
                label: 'Присъствие на учебни занятия в %',
                data: [attendance],
                backgroundColor: color,
                borderColor: borderColor,
                borderWidth: 1
            }]
        },
        options: {
            indexAxis: 'y',
            maintainAspectRatio: false,
            animation: false,
            scales: {
                x: {
                    beginAtZero: true,
                    max: 100,
                },
                y: {
                    ticks: {
                        display: false
                    }
                }
            },
            plugins: {
                legend: {
                    labels: {
                        usePointStyle: false,
                        boxWidth: 0,
                        boxHeight: 0,
                        color: 'hsl(240, 100%, 5%)',
                        font: {
                            family: 'Cambria',
                            size: 18,
                        }
                    }
                },
                 // Задаваме надписите на етикетите, които се появяват при hover
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return 'Процент на присъствие: ' + context.parsed.x + '%';
                        }
                    }
                }
            }
        }
    });
}

loadUser();


