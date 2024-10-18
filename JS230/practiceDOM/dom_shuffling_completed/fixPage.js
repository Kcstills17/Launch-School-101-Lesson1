

document.addEventListener('DOMContentLoaded', () => {
    moveSecondHeaderUnderArticle();
    moveHeaderToTop();
    let imageOne = document.querySelector('img'); 
    let imageTwo = document.querySelectorAll('img')[1]; 
    swapElements(imageOne, imageTwo)
    insertFiguresIntoArticle()
  
});

// Function to move the <header> to the top of the <body>
function moveHeaderToTop() {
    let header = document.querySelector('header');
    let body = document.body;
    let h1 = document.querySelector('h1'); 

    // Ensure header exists before attempting to move it
    if (header && h1) {
        body.insertBefore(header, body.firstChild);
        header.insertBefore(h1, header.firstChild)
    } else {
        console.log('Header not found!');
    }
}

// Function to move <h1> from <main> to the top of the <header>
function moveSecondHeaderUnderArticle() { 
    let article = document.querySelector('article')
  
    let secondHeader = document.querySelectorAll('header')[1];

    // Ensure both <h1> and <header> exist before moving
    if (article && secondHeader) {
       article.insertBefore(secondHeader, article.firstChild)
    } else {
        console.log('<h1> or <header> not found!');
    }
}

function swapElements(element1, element2) {
    // Create a temporary element to hold one of the elements during the swap
    let temp = document.createElement('div');

    // Replace element1 with the temp element
    element1.replaceWith(temp);

    // Replace element2 with element1
    element2.replaceWith(element1);

    // Replace the temp element with element2
    temp.replaceWith(element2);
}

function insertFiguresIntoArticle() {
    let figures = document.querySelectorAll('figure'); 
    let article = document.querySelector('article'); 
    let figuresArr = Array.prototype.slice.call(figures)

    figuresArr.forEach((figure) => article.appendChild(figure))
}



document.addEventListener('keydown', (event) => {
    let x = document.querySelector('.x');

    // Compare event.key with lowercase letters directly
    if (event.key === 'b') {
        x.style.background = 'blue';
    } else if (event.key === 'r') {
        x.style.background = 'red';
    } else if (event.key === 'g') {
        x.style.background = 'green';  // Corrected assignment with '='
    }
});