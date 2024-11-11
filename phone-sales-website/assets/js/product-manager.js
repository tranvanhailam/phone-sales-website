var productID = document.getElementById("productID");
var productName = document.getElementById("productName");
var manufacturer = document.getElementById("manufacturer");
var price = document.getElementById("price");
var quantity = document.getElementById("quantity");
var operatingSystem = document.getElementById("operatingSystem");
var cpu = document.getElementById("cpu");
var color = document.getElementById("color");
var screenSize = document.getElementById("screenSize");
var batteryCapacity = document.getElementById("batteryCapacity");
var ramCapacity = document.getElementById("ramCapacity");
var memoryCapacity = document.getElementById("memoryCapacity");
var frontCamera = document.getElementById("frontCamera");
var mainCamera = document.getElementById("mainCamera");
var productImage = document.getElementById("productImage");
var descProduct = document.getElementById("descProduct");

var form = document.getElementById("form");
var imgProductDisplay = document.getElementById("imgProductDisplay");
var nameImageProductWhenUpdate = document.getElementById("nameImageProductWhenUpdate");
var tbody = document.getElementById("tbody");
var remove = document.querySelectorAll(".remove");
var update = document.querySelectorAll(".update");
var statusServer = document.getElementById("statusServer");
var assecsProductManager = document.getElementById("assecsProductManager");
var addUpdateRemoveStatus = document.getElementById("addUpdateRemoveStatus");
var idProductWhenRemove = document.getElementById("idProductWhenRemove");
var htmlTbody;

var msgErrorProductID = document.getElementById("msgErrorProductID");

productImage.onchange = function () {
    imgProductDisplay.src = window.URL.createObjectURL(this.files[0]);// tạo ra một URL tạm thời để truy cập và hiển thị tệp (file) mà người dùng đã chọn.
};

//addBtn.onclick = function () {

//    if (String(assecsProductManager.value) === 'allowAssecsProductManager') {
//        htmlTbody = tbody.innerHTML;
//        tbody.innerHTML = `<tr>     
//        <td><img src="./assets/icon/icon-product-manager/remove.svg" alt="" class="remove"></td>
//        <td><img src="./assets/icon/icon-product-manager/update.svg" alt="" class="update"></td>
//        <td><img src="${srcImg}" alt="${productName.value}" class="imgTable"></td>
//        <td>${productID.value}</td>
//        <td>${productName.value}</td>
//        <td>${manufacturer.value}</td>
//        <td>${price.value}</td>
//        <td>${quantity.value}</td>
//        <td>${operatingSystem.value}</td>
//        <td>${cpu.value}</td>
//        <td>${color.value}</td>
//        <td>${screenSize.value} inch</td>
//        <td>${batteryCapacity.value} mAh</td>
//        <td>${ramCapacity.value} GB</td>
//        <td>${memoryCapacity.value} GB</td>
//        <td>${frontCamera.value} MP</td>
//        <td>${mainCamera.value} MP</td>
//        <td>${descProduct.value}</td>
//            </tr>`;
//        tbody.innerHTML += htmlTbody;
//        imgProductDisplay.src = "./assets/img/img-product-manager/img-2.jpg";
//        form.reset();
//        toast({ title: "Success", msg: "Product added successfully", type: "success", duration: 8000 });

//    } else if (String(assecsProductManager.value) === 'disableAssecsProductManager') {
//        toast({ title: 'Error', msg: 'This account is not allowed to add products', type: 'error', duration: 8000 });
//    } else {
//        toast({ title: 'Error', msg: 'Cannot add product because not logged in', type: 'error', duration: 8000 });
//    }

//};


tbody.onclick = function (e) {
    // Kiểm tra xem phần tử được click có class "update" không
    //Click icon update
    if (e.target.classList.contains("updateIcon")) {
        if (String(assecsProductManager.value) === 'allowAssecsProductManager') {
            // Lấy hàng tr tương ứng với nút update được bấm
            var row = e.target.parentNode.parentNode;
            // Đẩy dữ liệu từ hàng đó vào form
            // Cập nhật ảnh từ cột 2
            var srcImgTable = row.cells[2].querySelector("img").src;
            imgProductDisplay.src = srcImgTable;
            productID.value = row.cells[3].innerText;
            productName.value = row.cells[4].innerText;
            manufacturer.value = row.cells[5].innerText;
            price.value = row.cells[6].innerText;
            quantity.value = row.cells[7].innerText;
            operatingSystem.value = row.cells[8].innerText;
            cpu.value = row.cells[9].innerText;
            color.value = row.cells[10].innerText;
            screenSize.value = row.cells[11].innerText;
            batteryCapacity.value = row.cells[12].innerText;
            ramCapacity.value = row.cells[13].innerText;
            memoryCapacity.value = row.cells[14].innerText;
            frontCamera.value = row.cells[15].innerText;
            mainCamera.value = row.cells[16].innerText;
            descProduct.value = row.cells[17].innerText;
            window.scrollTo({ top: 180, left: 0 });
        } else if (String(assecsProductManager.value) === 'disableAssecsProductManager') {
            toast({ title: 'Error', msg: 'This account is not allowed to update products', type: 'error', duration: 8000 });
        } else {
            toast({ title: 'Error', msg: 'Cannot update product because not logged in', type: 'error', duration: 8000 });
        }
    } else if (e.target.classList.contains("removeIcon")) {// Kiểm tra xem phần tử được click có class "remove" không
        if (String(assecsProductManager.value) === 'allowAssecsProductManager') {
            // Lấy hàng tr tương ứng với nút remove được bấm
            var row = e.target.parentNode.parentNode;
            idProductWhenRemove.value = row.cells[3].innerText;
            addUpdateRemoveStatus.value = "remove";
            // Xóa hàng
            row.remove();
            form.submit();
            toast({ title: "Success", msg: "Remove product successfully", type: "success", duration: 8000 });
        } else if (String(assecsProductManager.value) === 'disableAssecsProductManager') {
            toast({ title: 'Error', msg: 'This account is not allowed to remove products', type: 'error', duration: 8000 });
        } else {
            toast({ title: 'Error', msg: 'Cannot remove product because not logged in', type: 'error', duration: 8000 });
        }
    }
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
window.onload = function () {

    if (String(statusServer.value) === 'loginSuccess') {//thông báo khi vừa đăng nhập thành công
        toast({ title: "Login Success", msg: "Login successfully at Cyber", type: "userSuccess", duration: 8000 });
    }
    if (String(assecsProductManager.value) === 'disableAssecsProductManager') {//cảnh báo khi tài khoản không được phép quản lý sản phẩm
        toast({ title: 'Warning', msg: 'This account is not allowed to add, update and remove products', type: 'warning', duration: 8000 });
    }

    if (String(addUpdateRemoveStatus.value) === 'addSuccess') { //thông báo khi thêm sản phẩm thành công
        toast({ title: "Success", msg: "Product added successfully", type: "success", duration: 8000 });
    } else if (String(addUpdateRemoveStatus.value) === 'addFailed') {//thông báo khi trùng ID
        productID.style.borderColor = '#ff0000';
        msgErrorProductID.style.margin = '-20px 0 0 180px';
        msgErrorProductID.innerText = "Sản phẩm có ID đã tồn tại, vui lòng nhập ID khác";
        msgErrorProductID.style.display = "block";
        toast({ title: 'Error', msg: 'Add product failed because product ID already exists', type: 'error', duration: 8000 });
    } else if (String(addUpdateRemoveStatus.value) === 'updateSuccess') {//thông báo khi cập nhật sản phẩm thành công
        toast({ title: "Success", msg: "Product updated successfully", type: "success", duration: 8000 });
    } else if (String(addUpdateRemoveStatus.value) === 'removeSuccess') {//thông báo khi xóa sản phẩm thành công
        toast({ title: "Success", msg: "Product remove successfully", type: "success", duration: 8000 });
    }
};

function getImageNameFromURL(url) {
    const lastSlashIndex = url.lastIndexOf('/');
    // Cắt chuỗi từ vị trí sau dấu / cuối cùng
    return url.substring(lastSlashIndex + 1);
}

form.onsubmit = function () {
    if (document.activeElement.id === "add") {
        if (String(assecsProductManager.value) === 'allowAssecsProductManager') {
            if (productID.value.trim() === "") {
                toast({ title: 'Error', msg: 'Add product failed, product ID cannot be empty', type: 'error', duration: 8000 });
                return false;
            }
            addUpdateRemoveStatus.value = "add";
            return true;
        } else if (String(assecsProductManager.value) === 'disableAssecsProductManager') {
            toast({ title: 'Error', msg: 'This account is not allowed to add products', type: 'error', duration: 8000 });
            return false;
        } else {
            toast({ title: 'Error', msg: 'Cannot add product because this account is not logged in', type: 'error', duration: 8000 });
            return false;
        }
    } else if (document.activeElement.id === "update") {
        if (String(assecsProductManager.value) === 'allowAssecsProductManager') {
            if (productID.value.trim() === "") {
                toast({ title: 'Error', msg: 'Update product failed, product ID cannot be empty', type: 'error', duration: 8000 });
                return false;
            }
            nameImageProductWhenUpdate.value = getImageNameFromURL(imgProductDisplay.src);
            addUpdateRemoveStatus.value = "update";
            return true;
        } else if (String(assecsProductManager.value) === 'disableAssecsProductManager') {
            toast({ title: 'Error', msg: 'This account is not allowed to update products', type: 'error', duration: 8000 });
            return false;
        } else {
            toast({ title: 'Error', msg: 'Cannot update product because this account is not logged in', type: 'error', duration: 8000 });
            return false;
        }
    }
}