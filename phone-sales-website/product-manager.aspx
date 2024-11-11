<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product-manager.aspx.cs" Inherits="phone_sales_website.product_manager" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Product manage | Cyber</title>
    <!-- Reset CSS -->
    <link rel="stylesheet" href="./assets/css/reset.css" />
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer" />
    <!-- Font Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
        rel="stylesheet" />
    <!-- Style CSS -->
    <link rel="stylesheet" href="./assets/css/product-manager.css" />
</head>
<body id="bodyTag">
    <div id="toast"></div>
    <input type="hidden" id="statusServer" runat="server" />
    <input type="hidden" id="assecsProductManager" runat="server" />
    <div class="hello-guest" id="helloGuest" runat="server"></div>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="header-body">
                <div class="logo">
                    <a href="./index.aspx">
                        <img src="./assets/img/logo.svg " alt="" />
                    </a>
                </div>
                <form id="formSearch" action="products-page.aspx" method="get" class="form-search">
                    <img
                        src="./assets/icon/search.svg"
                        alt="Search"
                        class="form-search__icon" />
                    <input
                        type="text"
                        name="search"
                        id=""
                        class="form-search__input"
                        placeholder="Search" />
                </form>
                <nav class="navbar">
                    <ul class="navbar__list">
                        <li>
                            <a
                                href="./index.aspx"
                                class="navbar__item">Home
                            </a>
                        </li>
                        <li>
                            <a href="./product-manager.aspx" class="navbar__item navbar__item-action">About</a>
                        </li>
                        <li>
                            <a href="#!" class="navbar__item">Contact Us</a>
                        </li>
                        <li>
                            <a href="#!" class="navbar__item">Blog</a>
                        </li>
                    </ul>
                </nav>
                <div class="header-action">
                    <a href="#!" class="header-action__link">
                        <img src="./assets/icon/tym.svg" alt="Tym" />
                    </a>
                    <a href="./shopping-cart.aspx" class="header-action__link">
                        <img
                            src="./assets/icon/cart-item.svg"
                            alt="Cart item" />
                        <span class="counter-product" runat="server" id="counterProduct">NaN</span>
                    </a>
                    <a href="./login.aspx" class="header-action__link">
                        <img src="./assets/icon/user.svg" alt="User" />
                    </a>
                </div>
            </div>
        </div>
    </header>
    <main>
        <section class="main-top">
            <div class="container">
                <div class="main-top__inner">
                    <h1 class="main-top__heading" runat="server" id="headingMain">Product manage</h1>
                </div>
            </div>
        </section>
        <section class="product-info">
            <div class="container">
                <form id="form" method="post" action="" runat="server">
                    <input type="hidden" name="addUpdateRemoveStatus" id="addUpdateRemoveStatus" runat="server" />
                    <input type="hidden" name="nameImageProductWhenUpdate" id="nameImageProductWhenUpdate" runat="server" />
                    <input type="hidden" name="idProductWhenRemove" id="idProductWhenRemove" runat="server" />

                    <div class="product-info__inner">
                        <div class="product-info__left">
                            <div class="choose-img">
                                <label for="" class="choose-img__label">
                                    Product image</label>
                                <p class="choose-img__message">
                                    Click on the image below to select a
                                        photo
                                </p>
                                <input
                                    type="file"
                                    id="productImage"
                                    name="productImage"
                                    runat="server"
                                    hidden />
                                <label
                                    for="productImage"
                                    class="img-product">
                                    <img
                                        src="./assets/img/img-product-manager/img-2.jpg"
                                        alt=""
                                        class="img-product__input"
                                        id="imgProductDisplay" />
                                </label>
                            </div>
                            <div class="desc-product">
                                <label
                                    for="descProduct"
                                    class="desc-product__label">
                                    Description product</label>
                                <textarea
                                    rows="8"
                                    placeholder="Enter description product"
                                    name="descProduct"
                                    id="descProduct"
                                    class="desc-product__input"></textarea>
                            </div>
                            <div class="product-info__control">
                                <button
                                    type="submit"
                                    class="product-info__btn"
                                    id="add">
                                    Add
                                </button>
                                <button
                                    type="submit"
                                    class="product-info__btn"
                                    id="update">
                                    Update
                                </button>
                            </div>
                        </div>
                        <div class="product-info__right">
                            <div class="product-info__item">
                                <label
                                    for="productID"
                                    class="product-info__label">
                                    Product ID
                                </label>
                                <input
                                    placeholder="Enter product ID"
                                    id="productID"
                                    name="productID"
                                    type="text"
                                    class="product-info__input"
                                    runat="server" />
                            </div>
                            <p
                                class="form-message"
                                id="msgErrorProductID"
                                runat="server">
                            </p>
                            <div class="product-info__item">
                                <label
                                    for="productName"
                                    class="product-info__label">
                                    Product name
                                </label>
                                <input
                                    placeholder="Enter product name"
                                    id="productName"
                                    name="productName"
                                    type="text"
                                    class="product-info__input" />
                            </div>
                            <div class="product-info__item">
                                <label
                                    for="manufacturer"
                                    class="product-info__label">
                                    Manufacturer
                                </label>
                                <input
                                    placeholder="Enter manufacturer"
                                    id="manufacturer"
                                    name="manufacturer"
                                    type="text"
                                    class="product-info__input" />
                            </div>
                            <div class="product-info__item">
                                <label
                                    for="price"
                                    class="product-info__label">
                                    Price
                                </label>
                                <input
                                    placeholder="Enter price"
                                    id="price"
                                    name="price"
                                    type="number"
                                    class="product-info__input" />
                            </div>
                            <div class="product-info__item">
                                <label
                                    for="quantity"
                                    class="product-info__label">
                                    Quantity</label>
                                <input
                                    placeholder="Enter quantity"
                                    id="quantity"
                                    name="quantity"
                                    type="number"
                                    min="0"
                                    class="product-info__input" />
                            </div>
                            <div class="product-info__item">
                                <label
                                    for="operatingSystem"
                                    class="product-info__label">
                                    Operating system
                                </label>
                                <input
                                    placeholder="Enter operating system"
                                    id="operatingSystem"
                                    name="operatingSystem"
                                    type="text"
                                    class="product-info__input" />
                            </div>
                            <div class="product-info__item">
                                <label
                                    for="cpu"
                                    class="product-info__label">
                                    CPU
                                </label>
                                <input
                                    placeholder="Enter CPU"
                                    id="cpu"
                                    name="cpu"
                                    type="text"
                                    class="product-info__input" />
                            </div>
                            <div class="product-info__item">
                                <label
                                    for="color"
                                    class="product-info__label">
                                    Color
                                </label>
                                <input
                                    placeholder="Enter color"
                                    id="color"
                                    name="color"
                                    type="text"
                                    class="product-info__input" />
                            </div>
                            <div class="product-info__row">
                                <div class="product-info__item">
                                    <label
                                        for="screenSize"
                                        class="product-info__label">
                                        Screen size
                                    </label>
                                    <input
                                        placeholder="inch"
                                        id="screenSize"
                                        name="screenSize"
                                        type="number"
                                        step="0.1"
                                        min="0"
                                        type="number"
                                        class="product-info__input" />
                                    <span class="product-info__unit">inch</span>
                                </div>
                                <div class="product-info__item">
                                    <label
                                        for="batteryCapacity"
                                        class="product-info__label">
                                        Battery capacity
                                    </label>
                                    <input
                                        placeholder="mAh"
                                        id="batteryCapacity"
                                        name="batteryCapacity"
                                        type="number"
                                        min="0"
                                        type="number"
                                        class="product-info__input" />
                                    <span class="product-info__unit">mAh</span>
                                </div>
                            </div>
                            <div class="product-info__row">
                                <div class="product-info__item">
                                    <label
                                        for="ramCapacity"
                                        class="product-info__label">
                                        RAM capacity
                                    </label>
                                    <input
                                        placeholder="GB"
                                        id="ramCapacity"
                                        name="ramCapacity"
                                        type="number"
                                        min="0"
                                        type="number"
                                        class="product-info__input" />
                                    <span class="product-info__unit">GB</span>
                                </div>
                                <div class="product-info__item">
                                    <label
                                        for="memoryCapacity"
                                        class="product-info__label">
                                        Memory capacity
                                    </label>
                                    <input
                                        placeholder="GB"
                                        id="memoryCapacity"
                                        name="memoryCapacity"
                                        type="number"
                                        min="0"
                                        type="text"
                                        class="product-info__input" />
                                    <span class="product-info__unit">GB</span>
                                </div>
                            </div>
                            <div class="product-info__row">
                                <div class="product-info__item">
                                    <label
                                        for="frontCamera"
                                        class="product-info__label">
                                        Front camera</label>
                                    <input
                                        placeholder="MP"
                                        id="frontCamera"
                                        name="frontCamera"
                                        type="number"
                                        step="0.1"
                                        min="0"
                                        type="text"
                                        class="product-info__input" />
                                    <span class="product-info__unit">MP</span>
                                </div>
                                <div class="product-info__item">
                                    <label
                                        for="mainCamera"
                                        class="product-info__label">
                                        Main camera
                                    </label>
                                    <input
                                        placeholder="MP"
                                        id="mainCamera"
                                        name="mainCamera"
                                        type="number"
                                        step="0.1"
                                        min="0"
                                        type="text"
                                        class="product-info__input" />
                                    <span class="product-info__unit">MP</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <hr />
        <section class="product-display">
            <h2 class="product-display__heading">Product List</h2>
            <div class="product-table">
                <table class="product-table__inner">
                    <thead>
                        <tr>
                            <th class="product-table__head">Remove</th>
                            <th class="product-table__head">Update</th>
                            <th class="product-table__head">Product image</th>
                            <th class="product-table__head">Product ID</th>
                            <th class="product-table__head">Product name</th>
                            <th class="product-table__head">Manufacturer</th>
                            <th class="product-table__head">Price</th>
                            <th class="product-table__head">Quantity</th>
                            <th class="product-table__head">Operating system
                            </th>
                            <th class="product-table__head">CPU</th>
                            <th class="product-table__head">Color</th>
                            <th class="product-table__head">Screen size</th>
                            <th class="product-table__head">Battery capacity
                            </th>
                            <th class="product-table__head">RAM capacity</th>
                            <th class="product-table__head">Memory capacity</th>
                            <th class="product-table__head">Front camera</th>
                            <th class="product-table__head">Main camera</th>
                            <th class="product-table__head">Description product
                            </th>
                        </tr>
                    </thead>
                    <tbody id="tbody" runat="server"></tbody>
                </table>
            </div>
        </section>
    </main>
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer__row">
                <div class="footer__column">
                    <a href="./">
                        <img
                            src="./assets/img/logo-footer.svg"
                            alt=""
                            class="footer__logo" />
                    </a>
                    <p class="footer__desc">
                        We are a residential interior design firm located in
                            Portland. Our boutique-studio offers more than
                    </p>
                </div>
                <div class="footer__column">
                    <h3 class="footer__title">Services</h3>
                    <ul class="footer__list">
                        <li>
                            <a href="#!" class="footer__link">Bonus program</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Gift cards</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Credit and payment</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Service contracts</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Non-cash account</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Payment</a>
                        </li>
                    </ul>
                </div>
                <div class="footer__column">
                    <h3 class="footer__title">Assistance to the buyer</h3>
                    <ul class="footer__list">
                        <li>
                            <a href="#!" class="footer__link">Find an order</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Terms of delivery</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Exchange and return of goods</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Guarantee</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Frequently asked questions</a>
                        </li>
                        <li>
                            <a href="#!" class="footer__link">Terms of use of the site</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="footer-social">
                <a href="#!">
                    <img
                        src="./assets/icon/twitter.svg"
                        alt="Twitter"
                        class="footer-social__img" />
                </a>
                <a href="#!">
                    <img
                        src="./assets/icon/facebook.svg"
                        alt="Facebook"
                        class="footer-social__img" />
                </a>
                <a href="#!">
                    <img
                        src="./assets/icon/tiktok.svg"
                        alt="Tiktok"
                        class="footer-social__img" />
                </a>
                <a href="#!">
                    <img
                        src="./assets/icon/instagram.svg"
                        alt="Instagram"
                        class="footer-social__img" />
                </a>
            </div>
        </div>
    </footer>
    <script src="./assets/js/product-manager.js"></script>
</body>
</html>
