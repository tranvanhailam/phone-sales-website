<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shopping-cart.aspx.cs" Inherits="phone_sales_website.shopping_cart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shopping Cart | Cyber</title>
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
    <link rel="stylesheet" href="./assets/css/shopping-cart.css" />
</head>
<body>
    <div id="toast"></div>
    <div class="hello-guest" id="helloGuest" runat="server"></div>
    <input type="hidden" id="statusServer" runat="server" />
    <%--<input type="hidden" id="statusRemoveProductInCart" runat="server" />--%>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="header-body">
                <div class="logo">
                    <a href="./index.aspx">
                        <img src="./assets/img/logo.svg  " alt="" />
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
                            <a href="./product-manager.aspx" class="navbar__item">About</a>
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
        <form action="payment-page.aspx" method="get" id="form">
            <div class="main">
                <div class="container">
                    <div class="main-inner">
                        <section class="main-left">
                            <p class="main-left__title">Shopping Cart</p>
                            <div id="productList" runat="server" class="product-list">
                                <%--<div class="product">
                                <img
                                    src="./assets/img/img-shopping-cart/product-1.png"
                                    alt=""
                                    class="product__img" />
                                <div class="product__info">
                                    <p class="product__name">
                                        Apple iPhone 14 Pro Max 128Gb Deep
                                        Purple
                                    </p>
                                    <p class="product__id">#25139526913984</p>
                                </div>
                                <div class="product__counter">
                                    <img
                                        src="./assets/icon/icon-shopping-cart/sub.svg"
                                        alt=""
                                        class="sub-icon" />
                                    <p class="product__number">1</p>
                                    <img
                                        src="./assets/icon/icon-shopping-cart/add.svg"
                                        alt=""
                                        class="add-icon" />
                                </div>
                                <p class="product__price">$1399</p>
                                <img
                                    src="./assets/icon/icon-shopping-cart/remove.svg"
                                    alt=""
                                    class="remove-icon" />
                            </div>
                            <div class="product">
                                <img
                                    src="./assets/img/img-shopping-cart/product-2.png"
                                    alt=""
                                    class="product__img" />
                                <div class="product__info">
                                    <p class="product__name">
                                        AirPods Max Silver
                                    </p>
                                    <p class="product__id">#53459358345</p>
                                </div>
                                <div class="product__counter">
                                    <img
                                        src="./assets/icon/icon-shopping-cart/sub.svg"
                                        alt=""
                                        class="sub-icon" />
                                    <p class="product__number">1</p>
                                    <img
                                        src="./assets/icon/icon-shopping-cart/add.svg"
                                        alt=""
                                        class="add-icon" />
                                </div>
                                <p class="product__price">$549</p>
                                <img
                                    src="./assets/icon/icon-shopping-cart/remove.svg"
                                    alt=""
                                    class="remove-icon" />
                            </div>
                            <div class="product">
                                <img
                                    src="./assets/img/img-shopping-cart/product-3.png"
                                    alt=""
                                    class="product__img" />
                                <div class="product__info">
                                    <p class="product__name">
                                        Apple Watch Series 9 GPS 41mm Starlight
                                        Aluminium
                                    </p>
                                    <p class="product__id">#63632324</p>
                                </div>
                                <div class="product__counter">
                                    <img
                                        src="./assets/icon/icon-shopping-cart/sub.svg"
                                        alt=""
                                        class="sub-icon" />
                                    <p class="product__number">1</p>
                                    <img
                                        src="./assets/icon/icon-shopping-cart/add.svg"
                                        alt=""
                                        class="add-icon" />
                                </div>
                                <p class="product__price">$399</p>
                                <img
                                    src="./assets/icon/icon-shopping-cart/remove.svg"
                                    alt=""
                                    class="remove-icon" />
                            </div>--%>
                            </div>
                        </section>
                        <section class="main-right">
                            <p class="main-right__title">Order Summary</p>
                            <div class="main-right__body">
                                <div class="main-right__row">
                                    <p class="main-right__text">Subtotal</p>
                                    <p class="main-right__price" runat="server" id="price">$0</p>
                                </div>
                                <div class="main-right__row">
                                    <p class="main-right__text">Estimated Tax</p>
                                    <p class="main-right__price" runat="server" id="tax">$0</p>
                                </div>
                                <div class="main-right__row">
                                    <p class="main-right__text">
                                        Estimated shipping & Handling
                                    </p>
                                    <p class="main-right__price" runat="server" id="priceShippingHandle">$0</p>
                                </div>
                                <div class="main-right__row">
                                    <p class="main-right__text">Total</p>
                                    <p class="main-right__price" runat="server" id="priceTotal">$0</p>
                                </div>
                            </div>
                            <button type="submit" class="main-right__btn btn-bg-black" id="checkoutBtn">Checkout</button>
                        </section>
                    </div>
                </div>
            </div>
        </form>
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
    <script src="./assets/js/shopping-cart.js"></script>
</body>
</html>
