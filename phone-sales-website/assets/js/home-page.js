

// Category - Danh mmục
const elmCategoryControlRight = document.getElementById(
    "category-control__icon-right"
);
const elmCategoryControlLeft = document.getElementById(
    "category-control__icon-left"
);
const categoryItems = document.querySelectorAll(".category-item");

let countClickControl = 0;
const widthItem = 120;

elmCategoryControlRight.onclick = function () {
    countClickControl++;
    if (countClickControl <= 6) {
        updateTranslate();
    } else {
        countClickControl = 6;
    }
};

elmCategoryControlLeft.onclick = function () {
    countClickControl--;
    if (countClickControl >= 0) {
        updateTranslate();
    } else {
        countClickControl = 0;
    }
};

function updateTranslate() {
    const translateValue = -countClickControl * widthItem;
    categoryItems.forEach((item) => {
        item.setAttribute("style", `transform:translateX(${translateValue}%)`);
    });
}

// Tym product
const elmTymProducts = document.querySelectorAll(".tym-product");
const protocol = window.location.protocol; //Giao thuc
const hostname = window.location.hostname; //Ten mien
const port = window.location.port; //Cong

var srcTymProduct = `${protocol}//${hostname}:${port}/assets/icon/tym-product.svg`;
var srcTymProductAction = `${protocol}//${hostname}:${port}/assets/icon/tym-product-action.svg`;

elmTymProducts.forEach((elm) => {
    elm.onclick = function () {
        if (elm.src.includes(srcTymProduct)) {
            elm.setAttribute("src", srcTymProductAction);
        } else {
            elm.setAttribute("src", srcTymProduct);
        }
    };
});

// category-item
var elmCategoryItem = document.querySelector(".category-item:first-child");
elmCategoryItem.onclick = function () {
    //window.location.href = `${protocol}//${hostname}:${port}/products-page.aspx`;
    window.location.href = `/products-page.aspx`;
};


//Toast
function toast({ title = "", msg = "", type = "success", duration = 3000 }) {
    var main = document.getElementById("toast");
    if (main) {
        var toast = document.createElement("div");

        //Auto remove toast
        var autoRemoveToastID = setTimeout(function () {
            main.removeChild(toast);
        }, duration + 1000);

        //Remove toast when click
        toast.onclick = function (e) {
            if (e.target.closest(".toast__close")) {
                main.removeChild(toast);
                clearTimeout(autoRemoveToastID);
            }
        };

        toast.classList.add("toast", `toast-${type}`);
        var delayTime = (duration / 1000).toFixed(2);
        toast.style.animation = `slideInLeft ease 0.5s, fadeOut linear 1s ${delayTime}s forwards`;
        toast.innerHTML = `
            <div class="toast__icon">
                <img src="./assets/icon/${type}-icon.svg"/>
            </div>
            <div class="toast__body">
                <h3 class="toast__title">${title}</h3>
                <p class="toast__msg">${msg}</p>
            </div>
            <div class="toast__close">
                <img src="./assets/icon/close-toast.svg"/>
            </div>`;
        main.appendChild(toast);
    }
}
var statusServer = document.getElementById("statusServer");
window.onload = function () {
    if (String(statusServer.value) === 'loginSuccess') {
        toast({ title: "Login Success", msg: "Login successfully at Cyber", type: "userSuccess", duration: 8000 });
    }
};

//Logout 
var logout = document.getElementById("logout");
logout.onclick = function () {
    statusServer.value = "logout";
}

//Featured list
var featuredList = document.querySelector(".featured-list");
var featuredDots = document.querySelectorAll(".featured-dot");
var featuredItems = document.querySelectorAll(".featured-item");
var featuredCurrentIndex = 0;
featuredDots.forEach((featuredDot, index) => {
    featuredDot.onclick = function () {
        featuredDots[featuredCurrentIndex].classList.remove("active");
        featuredCurrentIndex = index;
        featuredDot.classList.add("active");
        var widthTranslate =
            -featuredItems[index].clientWidth * featuredCurrentIndex;
        featuredItems.forEach((featured) => {
            featured.style.transform = `translateX(${widthTranslate}px)`;
        });
    };
});

// Responsive
var menuOverlay = document.getElementById("menuOverlay");
var menuDrawer = document.getElementById("menuDrawer");
var toggleMenu = document.getElementById("toggleMenu");
var mobileNav = document.getElementById("mobileNav");
var pcNav = document.getElementById("pcNav");
var mobileFormSearch = document.getElementById("mobileFormSearch");
var formSearch = document.getElementById("formSearch");
toggleMenu.onclick = function () {
    menuOverlay.style.opacity = "1";
    menuOverlay.style.visibility = "visible";
    menuDrawer.style.transform = "translateX(0%)";
};

menuOverlay.onclick = function () {
    menuOverlay.style.opacity = "0";
    menuOverlay.style.visibility = "hidden";
    menuDrawer.style.transform = "translateX(-100%)";
};
mobileNav.innerHTML = pcNav.innerHTML;
mobileFormSearch.innerHTML = formSearch.innerHTML;