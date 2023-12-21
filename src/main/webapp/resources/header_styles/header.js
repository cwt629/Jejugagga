"use strict";

const body = document.body;
const bgColorsBody = ["#ffb457", "#ff96bd", "#9999fb", "#ffe797", "#cffff1"];
const menu = body.querySelector(".menu");
const menuItems = menu.querySelectorAll(".menu__item");
const menuBorder = menu.querySelector(".menu__border");
let activeItem = menu.querySelector(".active");

function hoverItem(item, index) {

    menu.style.removeProperty("--timeOut");

    if (activeItem == item) return;

    if (activeItem) {
        activeItem.classList.remove("active");
    }

    item.classList.add("active");
    activeItem = item;
    offsetMenuBorder(activeItem, menuBorder);

}

function offsetMenuBorder(element, menuBorder) {
	if (!element) return;
    const offsetActiveItem = element.getBoundingClientRect();
    const left = Math.floor(offsetActiveItem.left - menu.offsetLeft - (menuBorder.offsetWidth  - offsetActiveItem.width) / 2) + "px";
    menuBorder.style.transform = `translate3d(${left}, 0 , 0)`;

}

offsetMenuBorder(activeItem, menuBorder);

menuItems.forEach((item, index) => {

    item.addEventListener("mouseenter", () => hoverItem(item, index));

})

window.addEventListener("resize", () => {
    offsetMenuBorder(activeItem, menuBorder);
    menu.style.setProperty("--timeOut", "none");
});

function clearHover() {
    if (activeItem) {
        activeItem.classList.remove("active");
        body.style.backgroundColor = ''; // 또는 기본 배경색으로 설정
        offsetMenuBorder(activeItem, menuBorder); // 필요에 따라서 메뉴 보더를 초기 위치로 이동
        activeItem = null; // 활성 아이템 참조 제거
    }
}

menuItems.forEach((item) => {
    item.addEventListener("mouseleave", clearHover);
});