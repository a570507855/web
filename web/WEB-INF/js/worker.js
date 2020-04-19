let count = 0;

/*
setInterval(function () {
    postMessage(++count);
},1000)*/

while (count !== 100000){
    postMessage(++count);
}
