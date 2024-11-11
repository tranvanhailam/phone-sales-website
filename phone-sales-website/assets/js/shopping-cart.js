var checkoutBtn = document.getElementById("checkoutBtn");
var productList = document.getElementById("productList");
var form = document.getElementById("form");
var checkboxInputs = document.querySelectorAll(".checkbox-input");

form.onsubmit = function () {
    if (productList.innerHTML == "") {
        toast({ title: "Error", msg: "Please add product to cart to checkout", type: "error", duration: 8000 });
        return false;
    } else {
        var inputChecked = false;
        checkboxInputs.forEach((checkboxInput, index) => {
            if (checkboxInput.checked)
                inputChecked = checkboxInput.checked;
        });
        if (!inputChecked) {
            toast({ title: "Error", msg: "Please select a product to checkout", type: "error", duration: 8000 });
            return false;
        } else {
            return true;
        }
    }
}

var price = document.getElementById("price");
var tax = document.getElementById("tax");
var priceShippingHandle = document.getElementById("priceShippingHandle");
var priceTotal = document.getElementById("priceTotal");

checkboxInputs.forEach((checkboxInput) => {
    checkboxInput.onchange = function () {
        var priceJS = 0;
        var totalProduct = 0;
        document.querySelectorAll(".checkbox-input:checked").forEach((checkedBox) => {
            priceJS += Number(checkedBox.getAttribute("data-price"));
            totalProduct++;
        });
        price.innerText = "$" + priceJS;
        tax.innerText = "$" + (totalProduct * 6);
        priceShippingHandle.innerText = "$" + (totalProduct * 3);
        priceTotal.innerText = "$" + (priceJS + (totalProduct * 10) + (totalProduct * 3));
    }
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
//var statusRemoveProductInCart = document.getElementById("statusRemoveProductInCart");
window.onload = function () {
    if (String(statusServer.value) === 'loginSuccess') {
        toast({ title: "Login Success", msg: "Login successfully at Cyber", type: "userSuccess", duration: 8000 });
    }
    //if (String(statusRemoveProductInCart.value) == 'removeSuccess') {
    //    toast({ title: "Remove Success", msg: "Removed product from cart successfully", type: "success", duration: 8000 });
    //}
}