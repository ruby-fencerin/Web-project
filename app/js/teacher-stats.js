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
        // Закръгляме процентите до цяло число и внимаваме да не делим на 0
        const totalInEvent = Number(stat.total_students) || 0;
        const presentInEvent = Number(stat.present_students) || 0;

        const percent = (totalInEvent !== 0)
        ? ((presentInEvent / totalInEvent) * 100).toFixed(0)
        : '0';
        percentages.push(percent);
    });

    // За графиката на последните 10 събития правим също масиви
    let lastEventNames = (eventNames.length > maxEvents) ? eventNames.slice(0, maxEvents) : [...eventNames];
        
    let lastPercentages = (percentages.length > maxEvents) ? percentages.slice(0, maxEvents) : [...percentages];

    // За втората графика искаме данните да са подредени от най-стари към най-нови, 
    // затова обръщаме масивите
    eventNames.reverse();
    percentages.reverse();

    // Обръщаме и масивите с последните събития
    lastEventNames.reverse();
    lastPercentages.reverse();

    // Намираме canvas елемента, в който ще сложим графиката
    const canvasBarplot = document.getElementById('myBarplot');

    // Създаваме графиката за последните 10 събития
    new Chart(canvasBarplot, {
        // Типът е barplot
        type: 'bar',
        data: {
            // По X оста са имената на събитията
            labels: lastEventNames,
            datasets: [{
                label: 'Процент присъствали студенти (последни 10 събития)',
                // По Y оста са процентите посещаемост за всяко събитие
                data: lastPercentages,
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
                },
                // Задаваме надписите на етикетите, които се появяват при hover
                tooltip: {
                    callbacks: {
                        label: function(context) {
                        const i = context.dataIndex;
                        const stat = data.stats[data.stats.length - 1 - i]; // заради reverse()
                        return `Присъствали: ${stat.present_students}/${stat.total_students} (${context.parsed.y}%)`;
                        }
                    }
                }
            }
        }
    });

    // Намираме canvas елемента, в който ще сложим втората графика
    const canvasLineplot = document.getElementById("myLineplot");

    // Създаваме графиката за всички събития
    new Chart(canvasLineplot, {
        // Типът е barplot
        type: 'line',
        data: {
            // По X оста са имената на събитията
            labels: eventNames,
            datasets: [{
                label: 'Обща статистика за присъствие в %',
                // По Y оста са процентите посещаемост за всяко събитие
                data: percentages,
                backgroundColor: 'hsl(270, 100%, 40%)', 
                borderColor: 'hsl(270, 100%, 40%)',
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
                },
                // Тъй като може да имаме много събития, махаме надписите по X оста
                x: {
                    ticks: {
                        display: false
                    }
                }
            },
           
            plugins: {      
                //Chart.js по подразбиране слага цветно квадратче до легендата
                // Тъй като генерираме различни цветове за всеки стълб, го махаме, за да не е объркващо
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
                tooltip: {
                    enabled: false
                }
            }
        }
    });
}

loadStats();
