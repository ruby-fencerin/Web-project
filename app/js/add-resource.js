// Тази функция добавя един ресурс (файл / линк) към страницата
function addResourceToPage(resourceName, resourceLink, isFromStudent) {
    // Вземаме съответния контейнер за ресурси
    const div = (isFromStudent) ? document.getElementById("student-resources-list") : document.getElementById("teacher-resources-list");
    
    // Създаваме нов div за конкретния ресурс
    const new_resource = document.createElement("div");
    new_resource.classList.add("resource");

    // Създаваме икона за ресурса
    const img = document.createElement("img");
    img.classList.add("resource-icon");
    img.src = "../images/resource-icon.png";

    // Създаваме текстов елемент с името на ресурса
    const span = document.createElement("span");
    span.classList.add("resource-name");
    span.textContent = resourceName;

    // Добавяме иконата и текста към ресурса
    new_resource.appendChild(img);
    new_resource.appendChild(span);

    // При клик върху ресурса отваряме линка му
    new_resource.addEventListener("click", () => {
       window.open(resourceLink, "_blank");
    });

    // Добавяме ресурса към контейнера на страницата
    div.appendChild(new_resource);
}

// Тази функция зарежда ресурсите за дадено събитие от базата данни
async function loadResources(eventID) {
    
    // Изпращаме заявка към PHP endpoint-а за ресурси
    const res = await fetch(
        `../php/event_resources.php?eventid=${encodeURIComponent(eventID)}`
    );

    // Четем отговора като текст (за по-лесно дебъгване)
    const text = await res.text();
    let data;

    // Опитваме да парснем JSON отговора
    try {
        data = JSON.parse(text);
    } catch {
        // Ако отговорът не е валиден JSON (PHP грешка и т.н.)
        console.error("Resources: Невалиден JSON отговор:", text);
        return;
    }

    // Ако сървърът е върнал грешка
    if (!res.ok) {
        console.error(data.error || "Грешка при зареждане на ресурси!");
        return;
    }

    // Взимаме контейнера, в който ще показваме всички ресурси от преподаватели
    const teacherDiv = document.getElementById("teacher-resources-list");

    // Изчистваме стари ресурси (ако има)
    if (teacherDiv) {
        teacherDiv.innerHTML = "";
    }

    // Добавяме всеки ресурс към страницата
    data.resources.teacher.forEach(resource => {
        addResourceToPage(resource.title, resource.url, false);
    });

    // Взимаме контейнера, в който ще показваме всички ресурси от студенти
    const studentDiv = document.getElementById("student-resources-list");

     // Изчистваме стари ресурси (ако има)
    if (studentDiv) {
        studentDiv.innerHTML = "";
    }

     // Добавяме всеки ресурс към страницата
    data.resources.student.forEach(resource => {
        addResourceToPage(resource.title, resource.url, true);
    });
}

// Добавяне на финкционалност на бутона за добавяне на ресурс
function makeFunctionalAddResource(eventID) {
    document.getElementById("add-resource").addEventListener("click", async () => {
        // Вземаме въведените от потребителя данни
        const resourceTitle = document.getElementById("new-resource-title").value.trim();
        const resourceURL = document.getElementById("new-resource-url").value.trim();
        const resourceType = document.getElementById("new-resource-type").value.trim();

        if (!resourceTitle && !resourceURL && !resourceType) return;

        // Подготвяме данните за POST заявката
        const form = new FormData();
        form.append("eventid", eventID);
        form.append("title", resourceTitle);
        form.append("url", resourceURL);
        form.append("type", resourceType);

        // Изпращаме заявката към сървъра
        const res = await fetch("../php/add_resource.php", {
            method: "POST",
            body: form
        });

        const text = await res.text();

        // Опитваме се да парснем JSON
        try { 
            data = JSON.parse(text); 
        }
        catch {
            console.error("Non-JSON response:", text);
            alert("Сървърна грешка – отговорът не е JSON.");
            return;
        }

        // Проверка за грешка
        if (!res.ok) {
            alert(data.error || "Ресурсът не можа да бъде добавен");
            return;
        }

        // Изчистваме полетата и презареждаме ресурсите
        document.getElementById("new-resource-title").value = '';
        document.getElementById("new-resource-url").value = '';
        document.getElementById("new-resource-type").selectedIndex = 0;
        loadResources(eventID);
    });
}