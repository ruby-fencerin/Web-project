const backButton = document.getElementById("back");
backButton.addEventListener("click", () => {
    // искаме да е страницата на този преподавател => teacherid от url
    window.location.href = "event_list_page.php";
});