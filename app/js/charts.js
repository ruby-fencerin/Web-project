// Функция, която зарежда данните за присъствията на всяко събитие
// и рисува barplot с Chart.js
async function loadStats() {
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

    // Създаваме масиви за имената на събитията (по X оста)
    // и процента присъствали (по Y оста)
    const maxEvents = 10;
    let eventNames = [];
    let percentages = [];

    // Създаваме масиви за цветовете на колоните:
    // използваме 4 цвята, като съответните цветове за рамките 
    // са с по-малка яркост и по-голяма плътност
    let colors = [];
    let borderColors = [];
    let hues = [42, 62, 150, 330];

    hues.forEach(hue => {
        colors.push(`hsla(${hue}, 98%, 75%, 0.4)`);
        borderColors.push(`hsla(${hue}, 98%, 70%, 0.6)`);
    });

    // Добавяме всяко събитие и всяка бройка присъствали в масивите eventNames и percentages
    data.stats.forEach(stat => {
        eventNames.push(stat.event_title);
        const percent = (stat.count_students / data.total) * 100;
        // Закръгляме процентите до цяло число
        percentages.push(percent.toFixed(0));
    });

    // Показваме последните <= 10 събития (т.е. ако има поне 10 събития, показваме 10, 
    // иначе показваме колкото има). Затова при нужда режем първите 10 от масива
    if (eventNames.length > maxEvents) {
        eventNames = eventNames.slice(0, maxEvents);
    }
    if (percentages.length > maxEvents) {
        percentages = percentages.slice(0, maxEvents);
    }

    // Намираме canvas елемента, в който ще сложим графиката
    const canvas = document.getElementById('myChart');

    // Създаваме графиката 
    new Chart(canvas, {
        // Типът е barplot
        type: 'bar',
        data: {
            // По X оста са имената на събитията
            labels: eventNames,
            datasets: [{
                label: 'Процент присъствали студенти',
                // По Y оста са процентите посещаемост за всяко събитие
                data: percentages,
                // Всяка колона е различен цвят от тези, които генерирахме по-горе
                backgroundColor: colors,
                // Всяка колона има рамка от съответния цвят
                borderColor: borderColors,
                borderWidth: 1
        }]
        },
        options: {
            // Махаме анимацията
            animation: false,
            // Y оста е от 0 до 100, защото показва проценти
            scales: {
                y: {
                    beginAtZero: true,
                    max: 100
                }
            },
            //Chart.js по подразбиране слага цветно квадратче до легендата
            // Тъй като генерираме различни цветове за всеки стълб, го махаме, за да не е объркващо
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
                }
            }
        }
    });
}

loadStats();
