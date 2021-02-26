function operate(operator, num1, num2) {
    switch (operator) {
        case '+':
            return add(num1, num2);
            break;
        case '-':
            return subtract(num1, num2);
            break;
        case '×':
            return multiply(num1, num2);
            break;
        case '÷':
            return divide(num1, num2);
            break;
    }
}

function add(num1, num2) {
    return num1 + num2;
}

function subtract(num1, num2) {
    return num1 - num2;
}

function multiply(num1, num2) {
    return num1 * num2;
}

function divide(num1, num2) {
    return num1 / num2;
}

function addKeyEventListeners(keys) {
    keys.forEach((key) => {
        if ([...key.classList].includes('num') || document.getElementById('dec') === key) {
            key.addEventListener('click', (e) => {
                appendToDisplay(key.textContent);
            })
        }
        else if ([...key.classList].includes('oper')) {
            key.addEventListener('click', (e) => {
                updateExpression(key.textContent);
            })
        }
        else if (document.getElementById('eq') === key) {
            key.addEventListener('click', (e) => {
                evalExpression();
            })
        }
        else if (document.getElementById('clr') === key) {
            key.addEventListener('click', (e) => {
                const displayTextNode = document
                    .getElementById('display-text');
                clearDisplay();
                displayTextNode.textContent = '0';
                expr.length = 0;
            })
        }
        else if (document.getElementById('del') === key) {
            key.addEventListener('click', (e) => {
                deleteLastChar();
            })
        }
    })
}

// Changes the number in the calculator display
function appendToDisplay(char) {
    const displayTextNode = document
        .getElementById('display-text');
    let displayText = displayTextNode.textContent;
    let textLength = displayText.length;

    // Clears the display if the expression array is not empty, meaning an operator key has been pressed
    if (isNewNum) {
        clearDisplay();
        isNewNum = false;
    }

    if (displayText === '0') {
        // Prevents a number from starting with a decimal
        if (char !== '.') displayTextNode.textContent = char;
        else displayTextNode.textContent += char;
    }
    else {
        // Prevents a decimal from being added more than once
        if (char === '.') {
            console.log(displayText.indexOf('.'))
            if (displayText.indexOf('.') === -1) displayTextNode.textContent += char;
        }
        else displayTextNode.textContent += char;
    }
}

function clearDisplay() {
    const displayTextNode = document
        .getElementById('display-text');
    displayTextNode.textContent = '';
}

// Stores the operator and first operand of an expression for later use
function updateExpression(operator) {    
    if (expr) {
        evalExpression();
    }    
    const displayText = document
        .getElementById('display-text')
        .textContent;
    expr.push(operator);
    expr.push(displayText);

    isNewNum = true;
}

// Evaluate and display the result of an expression
function evalExpression() {
    const displayTextNode = document.getElementById('display-text');
    let displayText = document
        .getElementById('display-text')
        .textContent;

    if (expr.length) {
        const result = operate(expr[0], +expr[1], +displayText)
        displayTextNode.textContent = result;
        expr.length = 0;
    }
}

function deleteLastChar() {
    const displayTextNode = document.getElementById('display-text');
    const length = displayTextNode.textContent.length;

    if (length-1) displayTextNode.textContent = displayTextNode.textContent.slice(0, -1);
    else displayTextNode.textContent = '0';
}

const keys = document.querySelectorAll('.key');
let expr = [];
let isNewNum = true;

addKeyEventListeners(keys)