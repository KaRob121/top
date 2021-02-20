function createBoard() {
    // Creates 16 square divs to append to container
    const container = document.getElementById("container");
    for (let i = 0; i < 16; i++) {
        div = document.createElement("div");
        div.setAttribute('class', "square")
        container.appendChild(div);
    }
}

createBoard()