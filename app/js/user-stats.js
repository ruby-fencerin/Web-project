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