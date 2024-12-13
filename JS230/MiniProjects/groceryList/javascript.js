
document.addEventListener('DOMContentLoaded', () => {
    let nameText = document.querySelector('input[name]');
    let quantityText = document.getElementById('quantity')
    let groceryList = document.getElementById('grocery-list'); 

    let form = document.querySelector('form'); 


    form.addEventListener('submit', e => {
        e.preventDefault();
        let itemName = nameText.value; // 
        let itemQuantity = quantityText.value || 1; 
    
        if (!itemName) {
            let errorMessage = document.createElement('div'); 
            errorMessage.innerHTML = 'Please Provide an item name'; 
            errorMessage.style.backgroundColor = 'black'
            groceryList.appendChild(errorMessage); 
            setTimeout(() => {
                groceryList.removeChild(errorMessage); 
            }, 3000); 
       
        } else if (itemName && itemQuantity) {
            let grocery = document.createElement('li');
            let groceryContents = `${itemQuantity}  ${itemName}`; 
            grocery.textContent = groceryContents;  
            groceryList.appendChild(grocery); 

        }
        form.reset(); 
       
    })


    
})