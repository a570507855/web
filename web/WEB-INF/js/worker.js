let count = 0;
/*setInterval(function(){

},500)*/
setInterval(function () {
    postMessage(++count);
},1000)