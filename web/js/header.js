let nav = document.querySelector("#nav");
let head = document.querySelector("#header");
let bodyBox = document.querySelector("#body-box");
// let box = document.querySelector("#box");
let backTop = document.querySelector("#backTop");
window.addEventListener('load', () => {
    window.scrollTo({
        top: 0
    });
})
// 滚动到一个浏览器高度之后导航栏消失
window.addEventListener("scroll", () => {
    if (document.documentElement.scrollTop > head.offsetHeight *0.8) {
        nav.style.cssText = "-webkit-animation: topout 0.6s;position:fixed;opacity:0 ";
        backTop.style.cssText = "position:fixed;top:600px;right:30px"
        box.style.display = "block";
        backTop.style.display = "block"
    } else {
        nav.style.cssText = "position:fixed;top:0px;-webkit-animation: topin 0.6s;";
        box.style.display = "block";
        backTop.style.cssText = "display:none"
    }
})
backTop.addEventListener("click", (event) => {
    window.scrollTo({
        left: 10,
        top: 0,
        behavior: 'smooth'
    });
})