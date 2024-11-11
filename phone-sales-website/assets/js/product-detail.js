var formAddToCart = document.getElementById("formAddToCart");
var accountLogin = document.getElementById("accountLogin");
formAddToCart.onsubmit = function () {
    if (String(accountLogin.value)==="") {
        toast({ title: "Error", msg: "Please login to add products to cart", type: "error", duration: 8000 });
        return false;
    } else {
        return true;
    }
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
var addToCartStatus = document.getElementById("addToCartStatus");
window.onload = function () {
    if (String(statusServer.value) === 'loginSuccess') {
        toast({ title: "Login Success", msg: "Login successfully at Cyber", type: "userSuccess", duration: 8000 });
    }

    if (String(addToCartStatus.value) === "addToCartSuccess") { //Add product to cart success
        toast({ title: "Success", msg: "Product added to cart successfully", type: "success", duration: 8000 });
    }
};

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
