// 封装左右动画函数
let animate = function (obj, target, callback) {
    clearInterval(obj.time);
    obj.time = setInterval(() => {
        let step = (target - obj.offsetLeft) / 10;
        step = step > 0 ? Math.ceil(step) : Math.floor(step);
        if (obj.offsetLeft === target) {
            clearInterval(obj.time);
            if (callback) {
                callback();
            }
        }
        obj.style.left = obj.offsetLeft + step + "px";
    }, 15);
}

let lunboInner = document.querySelector(".lunbo-inner");
let lunboNumsBox = document.querySelector(".lunbo-numsBox");
let nums = lunboNumsBox.getElementsByTagName("li");
let lunboUl = document.querySelector(".lunbo-ul"),
    lis = lunboUl.getElementsByTagName("li");
let arrowL = document.querySelector(".left-arrow");
let arrowR = document.querySelector(".right-arrow"),
    temp = 0, cir = 0;;

//克隆第一张图片
let firstPic = lis[0].cloneNode(true);
lunboUl.appendChild(firstPic);
// 左右箭头的出现与消失
window.addEventListener("load", () => {
    lunboInner.addEventListener("mouseenter", () => {
        arrowL.style.display = "block";
        arrowR.style.display = "block";
        clearInterval(timer);
        timer = null;
    });
    lunboInner.addEventListener("mouseleave", () => {
        arrowL.style.display = "none";
        arrowR.style.display = "none";
        timer = setInterval(() => {
            arrowR.click();
        }, 2000)
    })
    lunboNumsBox.addEventListener("mouseenter", () => {
        arrowL.style.display = "block";
        arrowR.style.display = "block";
        clearInterval(timer);
        timer = null;
    });
    lunboNumsBox.addEventListener("mouseleave", () => {
        arrowL.style.display = "none";
        arrowR.style.display = "none";
        timer = setInterval(() => {
            arrowR.click();
        }, 2000)
    })
})
// 下面的小方块的鼠标进入显示和离开消失效果 和 点击后通过动画滑动到对应的图片
nums[0].className = "current";
for (let i = 0; i < nums.length; i++) {
    nums[i].setAttribute("index", i);

    // nums[i].addEventListener("mouseover", (event) => {
    // });
    let index = nums[i].getAttribute("index");


    nums[i].addEventListener("click", () => {
        for (let j = 0; j < nums.length; j++) {
            nums[j].className = "";
        }
        nums[i].className = "current";
        animate(lunboUl, -index * lunboInner.offsetWidth);
        console.log(index);
        //**为了使下面的小方块和左右箭头同步
        cir = index;
        temp = index;
    });


}
// 右侧按钮点击滑动图片


arrowR.addEventListener("click", () => {
    if (temp === lunboUl.children.length - 1) {
        lunboUl.style.left = 0;
        temp = 0;

    }
    temp++;
    animate(lunboUl, -temp * lunboInner.offsetWidth);

    cir++;
    if (cir === lunboUl.children.length - 1) {
        cir = 0;

    }
    for (let j = 0; j < nums.length; j++) {
        nums[j].className = "";
    }
    nums[cir].className = "current";
})



arrowL.addEventListener("click", () => {
    console.log(temp);
    if (temp == 0) {
        lunboUl.style.left = -(lunboUl.children.length - 1) * lunboInner.offsetWidth + "px";
        temp = lunboUl.children.length - 1;
    }
    temp--;
    animate(lunboUl, -temp * lunboInner.offsetWidth);

    console.log(cir);
    if (cir == 0) {
        cir = lunboUl.children.length - 1;
    }
    for (let j = 0; j < nums.length; j++) {
        nums[j].className = "";
    }
    cir--;
    nums[cir].className = "current";
})
//自动播放 相当于点击了右箭头
let timer = setInterval(() => {
    arrowR.click();
}, 2000)

