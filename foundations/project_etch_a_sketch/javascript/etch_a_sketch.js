function createBoard() {
    // Creates 16 square divs to append to container
    const container = document.getElementById('container');
    for (let i = 0; i < 16; i++) {
        square = document.createElement('div');
        square.setAttribute('class','square')
        squareContent = document.createElement('div');
        squareContent.setAttribute('class', 'content');
        square.appendChild(squareContent);
        container.appendChild(square);
    }
}

function changeBackgroundColor(squareContent) {
    console.log('mouseover')
    const randomColor = Math.floor(Math.random()*16777215).toString(16);
    squareContent.style.backgroundColor = "#" + randomColor;
}

createBoard();

const squareContents = document.querySelectorAll('.content');

squareContents.forEach(squareContent => {
    squareContent.addEventListener('mouseover', (e) => changeBackgroundColor(squareContent));
})