const counter = document.querySelector(".counter-num");
async function updateCounter() {
    let response = await fetch("https://vn5uuvvlw6i4yjpgk5x5pg45oe0qhlis.lambda-url.eu-central-1.on.aws/")
    let data = await response.json();
    counter.innerHTML = ` Views: ${data}`;
}

updateCounter();
