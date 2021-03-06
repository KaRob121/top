// Determines which math operation to complete
function operate(operator, num1, num2) {
    switch (operator) {
        case '+':
            return add(num1, num2);
            break;
        case '-':
            return subtract(num1, num2);
            break;
        case '×':
        case '*':
            return multiply(num1, num2);
            break;
        case '÷':
        case '/':
            return divide(num1, num2);
            break;
    }
}

// Adds two numbers together
function add(num1, num2) {
    return num1 + num2;
}

// Subtracts the second number from the first
function subtract(num1, num2) {
    return num1 - num2;
}

// Multiples two numbers together
function multiply(num1, num2) {
    return num1 * num2;
}

// Divides the first number by the second
function divide(num1, num2) {
    return num1 / num2;
}

// Adds click event listeners to each key in the calculator
function addKeyEventListeners(keys) {
    keys.forEach((key) => {
        // Checks if the key is a number or the decimal key
        if ([...key.classList].includes('num') || document.getElementById('dec') === key) {
            key.addEventListener('click', (e) => {
                appendToDisplay(key.textContent);
            })
        }
        // Checks if the key is an operator
        else if ([...key.classList].includes('oper')) {
            key.addEventListener('click', (e) => {
                updateExpression(key.textContent);
            })
        }
        // Checks if the key is the equals key
        else if (document.getElementById('eq') === key) {
            key.addEventListener('click', (e) => {
                evalExpression();
            })
        }
        // Checks if the key is the clear key
        else if (document.getElementById('clr') === key) {
            key.addEventListener('click', (e) => {
                clearDisplay();
                expr.length = 0;
            })
        }
        // Checks if the key is the delete key
        else if (document.getElementById('del') === key) {
            key.addEventListener('click', (e) => {
                deleteLastChar();
            })
        }
    })
}

// Changes the number in the calculator display
function appendToDisplay(char) {
    // Clears the display if the expression array is not empty, meaning an operator key has already been pressed
    if (isNewNum) {
        clearDisplay();
        isNewNum = false;
    }

    const displayTextNode = document.getElementById('display-text');
    let displayText = displayTextNode.textContent;
    let textLength = displayText.length;

    if (displayText === '0') {
        // Prevents a number from starting with a decimal
        if (char !== '.') displayTextNode.textContent = char;
        else displayTextNode.textContent += char;
    }
    else {
        // Prevents a decimal from being added more than once
        if (char === '.') {
            if (displayText.indexOf('.') === -1) displayTextNode.textContent += char;
        }
        else displayTextNode.textContent += char;
    }
}

// Clears the calculator display and makes it display '0'
function clearDisplay() {
    const displayTextNode = document.getElementById('display-text');
    displayTextNode.textContent = '0';
}

// Stores the operator and first operand of an expression for later use
function updateExpression(operator) {  
    // Ensures only a single pair of numbers are evaluated at a time
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

    // Ensures that there are two operands and an operator before evaluating an expression 
    if (expr.length) {
        const result = operate(expr[0], +expr[1], +displayText)
        // Decimals are rounded to 5 places
        displayTextNode.textContent = String(Number(Math.round(+result+'e5')+'e-5'));
        expr.length = 0;
    }
}

// Remove the last character is the display
function deleteLastChar() {
    const displayTextNode = document.getElementById('display-text');
    const length = displayTextNode.textContent.length;

    // If the last character is being removed, display '0' on the calculator display
    if (length-1) displayTextNode.textContent = displayTextNode.textContent.slice(0, -1);
    else displayTextNode.textContent = '0';
}

const keys = document.querySelectorAll('.key');
let expr = [];
let isNewNum = true;

addKeyEventListeners(keys)

// Adds keyboard support; keys that differ between the keyboard and the onscreen calculator are explained below 
// Keyboard button = calculator button
// *               = × (multiplication)
// /               = ÷ (division)
// Enter           = = (equals)
// Backspace       = Del (delete)
window.addEventListener('keyup', (e) => {
    let key = e.key;
    let numbers = /[0-9]|\./;
    let operators = /\+|\-|\*|\//;

    if (numbers.test(key)) {
        appendToDisplay(key);
    }
    else if (operators.test(key)) {
        updateExpression(key);
    }
    else if (key === 'Enter') {
        evalExpression();
    }
    else if (key === 'Backspace') {
        deleteLastChar();
    }
});