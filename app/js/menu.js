async function buildMenu() {
  // Взимаме текущия логнат потребител (по сесия)
  const res = await fetch("../php/user.php");
  const data = await res.json();

  if (!res.ok) {
    console.error(data.error || "Грешка при зареждане на меню");
    return;
  }

  const isStudent = data.role === "student";

  // Намираме навигационното меню
  const nav = document.getElementById("menu");
  if (!nav) return;

  // Помощна функция за добавяне на елемент в менюто
  function addMenuOption(id, text, href) {

    // Ако вече съществува – не го добавяме втори път, но му задаваме функционалност
    if (document.getElementById(id)) {
        const div = document.getElementById(id)

        div.addEventListener("click", () => {
          window.location.href = href;
        });
    } 
    else {
        const div = document.createElement("div");
        div.classList.add("menu-option");
        div.id = id;
        div.textContent = text;

        div.addEventListener("click", () => {
          window.location.href = href;
        });
        
        nav.appendChild(div);
    }
  }

  // Общи опции
  const header = document.querySelector("header");
  const headerOpt = document.querySelector(".header-option");
  if (headerOpt) headerOpt.textContent = isStudent ? "Студент" : "Преподавател";

  document.getElementById("for-me")?.addEventListener("click", () => {
    window.location.href = "user_page.php";
  });

  document.getElementById("my-events")?.addEventListener("click", () => {
    window.location.href = "event_list_page.php";
  });

  // Опции само за преподаватели
  if (!isStudent) {
    addMenuOption(
      "list-all-students",
      "Студенти",
      "teacher_page_list_students.php"
    );

    addMenuOption(
      "statistics",
      "Статистика",
      "teacher_statistics_page.php" 
    );
  }

  if (nav.style.visibility === 'hidden') {
      nav.style.visibility = 'visible';
  }

  if (header.style.visibility === 'hidden') {
      header.style.visibility = 'visible';
  }
}

buildMenu(); 