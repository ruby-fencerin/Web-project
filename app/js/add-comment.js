// Функция за зареждане на коментарите за събитието
async function loadComments(eventID) {
    const res = await fetch(
        `../php/event_comments.php?eventid=${encodeURIComponent(eventID)}`
    );

    const text = await res.text();
    let data;

    // Безопасно парсване на JSON
    try {
        data = JSON.parse(text);
    } catch {
        console.error("Non-JSON response (comments):", text);
        alert("Грешка при зареждане на коментарите.");
        return;
    }

    // Проверка за грешка от сървъра
    if (!res.ok) {
        alert(data.error || "Грешка при зареждане на коментарите");
        return;
    }

    // Контейнерът, в който ще показваме коментарите
    const commentsList = document.getElementById("comments-list");
    commentsList.innerHTML = "";

    // Визуализиране на всеки коментар
    data.comments.forEach(c => {
        commentsList.innerHTML += `
            <div class = "comment">
                <div class = "comment-info">
                    <span class = "sender-name">${c.author}</span>
                    <span class = "comment-data">${new Date(c.created_at).toLocaleString()}</span>
                </div>
                <div class = "comment-content">
                    ${c.body}
                </div>
            </div>
        `;
    });
}

// Добавяне функционалност на бутона за добавяне на нов коментар
function makeFunctionalAddComment(eventID) {
    document.getElementById("add-comment").addEventListener("click", async () => {
        const text = document.getElementById("comment-text").value.trim();
        if (!text) return;

        console.log(eventID);

        // Подготвяме данните за POST заявката
        const form = new FormData();
        form.append("eventid", eventID);
        form.append("text", text);

        // Изпращаме заявката към сървъра
        const res = await fetch("../php/add_comment.php", {
            method: "POST",
            body: form
        });

        const data = await res.json();

        // Проверка за грешка
        if (!res.ok) {
            alert(data.error || "Коментарът не можа да бъде добавен");
            return;
        }

        // Изчистваме полето и презареждаме коментарите
        document.getElementById("comment-text").value = "";
        loadComments(eventID);
    });
}
