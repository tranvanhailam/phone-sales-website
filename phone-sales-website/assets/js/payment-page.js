var paymentBtn = document.getElementById("paymentBtn");
var cardholderName = document.getElementById("cardholderName");
var cardNumber = document.getElementById("cardNumber");
var cardDate = document.getElementById("cardDate");
var cardCVV = document.getElementById("cardCVV");
var msgErrorCard = document.getElementById("msgErrorCard");
var address = document.getElementById("address");
var confirmAddress = document.getElementById("confirmAddress");
var msgConfirmAddress = document.getElementById("msgConfirmAddress");
var productList = document.getElementById("productList");
var form = document.getElementById("form");

paymentBtn.onclick = function () {
    if (cardholderName.value == "" || cardNumber.value == "" || cardDate.value == "" || cardCVV.value == "") {
        msgErrorCard.innerText = "Please enter full card information";
        msgErrorCard.style.display = "block";
        return;
    } else {
        msgErrorCard.style.display = "none";
    }
    if (!confirmAddress.checked) {
        msgConfirmAddress.innerText = "Please check your address and confirm";
        msgConfirmAddress.style.display = "block";
        address.style.borderColor = "#ff0000";
        return;
    } else {
        address.style.borderColor = "#cecece";
        msgConfirmAddress.style.display = "none";
    }
    productList.innerHTML = "";
    form.reset();
    toast({ title: "Information", msg: "Thank you for your purchase ^^", type: "info", duration: 8000 });
}


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
