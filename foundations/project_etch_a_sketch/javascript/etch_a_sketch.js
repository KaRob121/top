// Removes the children of a parent node
function removeChildren(parent) {
    while (parent.lastChild) parent.removeChild(parent.lastChild);
}

// Adds an event listener to each square on the grid to change its background color on mouseover
function addSquareEventListeners() {
    const squareContents = document.querySelectorAll('.content');
    squareContents.forEach(squareContent => {
        squareContent.addEventListener('mouseover', (e) => changeBackgroundColor(squareContent));
    })
}

// Creates grid of squares for the drawing area 
function createBoard(numSquares = 4) {
    const container = document.getElementById('container');

    if (container.children.length) removeChildren(container);

    for (let i = 0; i < numSquares * numSquares; i++) {
        square = document.createElement('div');
        square.setAttribute('class','square')
        squareContent = document.createElement('div');
        squareContent.setAttribute('class', 'content');
        square.appendChild(squareContent);
        container.appendChild(square);
    }

    container.style['grid-template-rows'] = `repeat(${numSquares}, [row-start] 1fr [row-end])`;
    container.style['grid-template-columns'] = `repeat(${numSquares}, [col-start] 1fr [col-end])`;

    addSquareEventListeners()
}

// Changes the background color of a square
function changeBackgroundColor(squareContent) {
    const randomColor = Math.floor(Math.random()*16777215).toString(16);
    squareContent.style.backgroundColor = '#' + randomColor;
}

// Resets the color of each square in the drawing area to white
function clearGrid(squareContent) {
    squareContent.style.backgroundColor = '#FFFFFF';
}

createBoard();

const slider = document.getElementById('slider');
slider.addEventListener('input', (e) => createBoard(slider.value)); 

const reset = document.getElementById('reset-bttn');
reset.addEventListener('click', (e) => {
    const squareContents = document.querySelectorAll('.content');
    squareContents.forEach(squareContent => {
        clearGrid(squareContent);
    })  
});