
/* 
let form = document.getElementById('form');

form.addEventListener('submit', event => {
  // prevent the browser from submitting the form
  event.preventDefault();

  let data = new FormData(form);

  let request = new XMLHttpRequest();
  request.open(form.method, `https://lsjs230-book-catalog.herokuapp.com/${form.getAttribute('action')}`);

  request.addEventListener('load', () => {
    if (request.status === 201) {
      console.log(`This book was added to the catalog: ${request.responseText}`);
    }
  });

  request.send(data);
});
*/ 
/* 
let store = document.getElementById('store'); 

store.addEventListener('submit', event => {
    event.preventDefault(); 
    let form = event.target; 
    let data = new FormData(form); 


    let request = new XMLHttpRequest(); 
    request.open(form.method, "https://ls-230-web-store-demo.herokuapp.com" + target.getAttribute("action" )); 
    request.setRequestHeader('Authorization',  'token AUTH_TOKEN');

    request.addEventListener('load', event => {
        store.innerHTML = request.response; 
    })
    request.send(data);
})

*/ 


/* 

let request = new XMLHttpRequest();
request.open('POST', 'https://lsjs230-book-catalog.herokuapp.com/books');

request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');

let data = { title: 'Eloquent JavaScript', author: 'Marijn Haverbeke' };
let json = JSON.stringify(data);

request.send(json);

*/


let request = new XMLHttpRequestEventTarget(); 

request.open('POST', 'https://ls-230-web-store-demo.herokuapp.com/v1/products'); 
request.setRequestHeader('Content-Type', 'application/json; charset=utf-8'); 
request.setRequestHeader('Authorization', 'token AUTH_TOKEN'); 


let data = { name: 'Jim Knowles', sku: 'DUV', price: 40}

let json = JSON.stringify(data); 

request.send(json); 

