const container = document.querySelector('#container');

const content = document.createElement('div');
content.classList.add('content');
content.textContent = 'This is the glorious text-content!';

const redText = document.createElement('p');
redText.textContent = 'Hey I\'m red!';
redText.style.color = 'red';

const blueH3 = document.createElement('h3');
blueH3.textContent = 'I\'m a blue h3!';
blueH3.style.color = 'blue';

const div = document.createElement('div');

const divH1 = document.createElement('h1');
divH1.textContent = 'I\'m in a div';

const divP = document.createElement('p');
divP.textContent = 'ME TOO!';

div.appendChild(divH1);
div.appendChild(divP);

container.appendChild(content);
container.appendChild(redText);
container.appendChild(blueH3);
container.appendChild(div);