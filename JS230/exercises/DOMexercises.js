function walk(node, callback) {
    callback(node); 

    for (let i =  0; i < node.childNodes.length; i += 1) {
        walk(node.childNodes[i], callback); 
    }
}

walk(document.body, node => {
    console.log(node.nodeName);
})