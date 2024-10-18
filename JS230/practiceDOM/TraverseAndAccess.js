function walk(node, callback) {
    callback(node);
  
    for (let index = 0; index < node.childNodes.length; index += 1) {
      walk(node.childNodes[index], callback);
    }
  }
let aCount = 0; 
let linkCount = 0; 
walk(document, node => {
    if (node.nodeName === 'A') {
        aCount += 1; 
        if (node.getAttribute('href')) {
            linkCount += 1; 
         
        }
    }
}); 

// document.getElementById('toc').textContent.trim()
// document.querySelector('#toc');
// document.querySelectorAll('.toc')[0];


links.forEach((link, i) => {
    if (i % 2 !== 0) {
        link.style.color = 'cyan'; 
    } else 
    link.style.color = 'green'
})


// get all scientific taxonimical info such as Kingdom, Phylum, Class etc and add it along with it's specific classification onto a new object. 
// keys are taxonomic ranks. Their specific listings are their values. 
let keys = ['Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'];
let classification = {};
let tds = document.querySelectorAll('.infobox td');
let cell;
let link;

for (let index = 0; index < tds.length; index += 1) {
  cell = tds[index];

  keys.forEach(key => {
    if (cell.textContent.indexOf(key) !== -1) {
      link = cell.nextElementSibling.firstElementChild;
      classification[key] = link.textContent;
    }
  });
}

console.log(classification);



document.getElementById('toggle').onclick = e => {
    e.preventDefault();
    let notice = document.getElementById('notice');
    return notice.className === 'hidden' ? notice.className = 'visible' : notice.className = 'hidden';
}


document.getElementById('notice').onclick = e => {
    e.preventDefault(); // for consistency: not needed here
  
    e.currentTarget.setAttribute('class', 'hidden');
  };
  