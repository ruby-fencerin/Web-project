function addResourceToPage(resourceName, resourceLink) {
    div = document.getElementById("resources-div");

    new_resource = document.createElement("div");
    new_resource.classList.add("resource");

    img = document.createElement("img");
    img.classList.add("resource-icon");
    img.src = "../images/resource-icon.png";

    span = document.createElement("span");
    span.classList.add("resource-name");
    span.textContent = resourceName;

    new_resource.appendChild(img);
    new_resource.appendChild(span);

    div.appendChild(new_resource);

    div.addEventListener("click", () => {
        window.location.href = resourceLink;
    });
}

// hardcoded примери
addResourceToPage("lecture.pptx", "https://github.com/ruby-fencerin/Web-project");
addResourceToPage("examples.php", "https://github.com/ruby-fencerin/Web-project");
addResourceToPage("exercise.pdf", "https://github.com/ruby-fencerin/Web-project");