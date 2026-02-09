// Функция, която зарежда данните за броя събития, на които е присъствал студента
async function loadStudentStats() {
     // Зареждаме данните от php endpoint-а
    const res = await fetch('../php/stats_student.php');

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

    // Изчисляваме процента на присъствие на студента
    const attendance = (data.total !== 0)
                        ? (100 * (data.present / data.total)).toFixed(0)
                        : '0';

    // Избираме цвят за правоъгълника и за рамката му (hue-saturation-lightness-alpha)
    const hue = 56;
    const color = `hsla(${hue}, 98%, 75%, 0.5)`;
    const borderColor = `hsla(${hue}, 98%, 70%, 0.6)`;

    // Чертаем графиката с данни - посещаемост на занятията в %
    drawSingleBarplot('single-bar-plot', [attendance], 'Присъствие на учебни занятия в %', color, borderColor);
}

// Функция, която зарежда данните за средната посещаемост на събитията на преподавателя 
async function loadTeacherStats() {
     // Зареждаме данните от php endpoint-а
    const res = await fetch('../php/stats_teacher.php');

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

    // Изчисляваме процент на присъствие за всяко събитие на преподавателя
    let percentages = []

    if (data.total !== 0) {
        data.stats.forEach(stat => {
            const percent = (stat.count_students / data.total) * 100;
            percentages.push(percent);
        });
    }
    else {
        data.stats.forEach(() => {
            percentages.push(0);
        });
    }

    // Изчисляваме среден процент на присъствие
    let average = 0;
    const eventCount = percentages.length;

    for (var i = 0; i < eventCount; i++) {
        average += percentages[i];
    }
    // Ако имаме нула събития, средният процент е 0
    average = (eventCount !== 0) 
                ? (average / eventCount).toFixed(0)
                : '0';   

    // Избираме цвят за правоъгълника и за рамката му (hue-saturation-lightness-alpha)
    const hue = 140;
    const color = `hsla(${hue}, 98%, 70%, 0.5)`;
    const borderColor = `hsla(${hue}, 98%, 65%, 0.6)`;

    // Чертаем графиката с данни - средна посещаемост на занятията
    drawSingleBarplot('single-bar-plot', [average], 'Средно присъствие на мои учебни занятия в %', color, borderColor);
}

async function loadStudentStatsTeacherView(studentid) {
    // Зареждаме данните от php endpoint-а
    const res = await fetch(`../php/view_student_stats.php?studentid=${encodeURIComponent(studentid ?? '')}`);

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
    
    // Процент присъствие = брой present=1 / общ брой записи в attendances
    const attendance = (data.total !== 0)
    ? (100 * (data.present / data.total)).toFixed(0)
    : '0';

    // Изчисляваме процента на присъствие на студента на събития, създадени от текущия преподавател
    const attendanceTeacher = (data.total_teacher !== 0) 
                            ? (100 * (data.present_teacher / data.total_teacher)).toFixed(0)
                            : '0';
    
    // Избираме цвят за правоъгълника и за рамката му (hue-saturation-lightness-alpha)
    const hue_1 = 56;
    const color_1 = `hsla(${hue_1}, 98%, 75%, 0.5)`;
    const borderColor_1 = `hsla(${hue_1}, 98%, 70%, 0.6)`;

     // Избираме цвят за правоъгълника и за рамката му за втората графика (hue-saturation-lightness-alpha)
    const hue_2 = 320;
    const color_2 = `hsla(${hue_2}, 98%, 75%, 0.5)`;
    const borderColor_2 = `hsla(${hue_2}, 98%, 70%, 0.6)`;

    // Чертаем графиката с данни - посещаемост на занятията
    drawSingleBarplot('single-bar-plot', [attendance], 'Присъствие на учебни занятия в %', color_1, borderColor_1);

    // Чертаем втора графика с данни - посещаемост на занятията на текущия преподавател
    drawSingleBarplot('single-bar-plot-view-student', [attendanceTeacher], 'Присъствие на мои учебни занятия в %', color_2, borderColor_2);
}

// Функция, която рисува barplot с Chart.js
function drawSingleBarplot(html_element_id, statsData, legendLabel, color, borderColor) {
    // Взимаме елемента, в който ще нарисуваме графиката
    const canvas = document.getElementById(html_element_id);

    // Създаваме barplot с една хоризонтална колона
    new Chart(canvas, {
        // Типът е barplot
        type: 'bar',
        data: {
            // Трябва да означим етикетите по Y оста (обърнали сме осите), но после ще ги скрием
            labels: ['Присъствие'],
            datasets: [{
                // Задаваме заглавието на графиката
                label: legendLabel,
                // По X оста са данните - среден процент на присъствие за преподавател / процент присъствие за студент
                data: statsData,
                // Задаваме цвят на колоната
                backgroundColor: color,
                // Задаваме цвят на рамката на колоната
                borderColor: borderColor,
                borderWidth: 1
            }]
        },
        options: {
            // Обръщаме осите - хоризонтална графика
            indexAxis: 'y',
            // Премахваме зададеното отношение ширина-височина,
            // за да преоразмеряваме спокойно
            maintainAspectRatio: false,
            // Махаме анимацията
            animation: false,
            scales: {
                 // X оста е от 0 до 100, защото показва проценти
                x: {
                    beginAtZero: true,
                    max: 100,
                },
                // Махаме надписа по Y оста
                y: {
                    ticks: {
                        display: false
                    }
                }
            },
            plugins: {
                legend: {
                    //Chart.js по подразбиране слага цветно квадратче до легендата, което махаме
                    labels: {
                        usePointStyle: false,
                        boxWidth: 0,
                        boxHeight: 0,
                        color: 'hsl(240, 100%, 5%)',
                        // Задаваме шрифт на легендата
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