// Взимаме референция към формата за вход
const form = document.getElementById("login-form");

// Взимаме елемента, в който ще показваме грешките
const errorDiv = document.getElementById("error");

// Добавяме listener за събитието submit на формата
form.addEventListener("submit", async (e) => {
    
    // Спираме стандартното поведение на формата
    // (иначе браузърът ще прати заявка и ще сложи данните в URL)
    e.preventDefault();              
    
    // Изчистваме предишна грешка
    errorDiv.textContent = "";
    
    // Взимаме въведените от потребителя данни
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;

    // Изпращаме POST заявка към PHP login скрипта
    // Данните се изпращат като JSON
    const res = await fetch("../php/login.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
    });
    
    // Четем суровия отговор от сървъра (като текст)
    const text = await res.text();
    let data;

    // Опитваме да го превърнем от JSON в JavaScript обект
    try { data = JSON.parse(text); }
    catch {
        console.error("Non-JSON:", text);
        errorDiv.textContent = "Сървърна грешка.";
        return;
    }

    if (!res.ok) {
        // Показваме грешката в червено под формата
        errorDiv.textContent = data.error || "Грешка при вход.";
        return;
    }

    // Пренасочваме потребителя към личната му страница
    window.location.href = "user_page.php";
});
