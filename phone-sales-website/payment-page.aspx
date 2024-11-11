<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment-page.aspx.cs" Inherits="phone_sales_website.payment_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Payment | Cyber</title>
    <!-- Reset CSS -->
    <link rel="stylesheet" href="./assets/css/reset.css" />
    <!-- Font Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
        rel="stylesheet" />
    <!-- Style CSS -->
    <link rel="stylesheet" href="./assets/css/payment-page.css" />
    <!-- Responsive -->
    <link
        rel="stylesheet"
        href="./assets/css/responsive-payment-page.css" />
</head>
<body>
    <div id="toast"></div>
    <input type="hidden" id="statusServer" runat="server" />
    <div class="hello-guest" id="helloGuest" runat="server"></div>
    <!-- Header PC-->
    <header class="header">
        <div class="container">
            <div class="header-body">
                <div class="logo">
                    <a href="./index.aspx">
                        <img src="./assets/img/logo.svg  " alt="" />
                    </a>
                </div>
                <form
                    id="formSearch"
                    action="products-page.aspx"
                    method="get"
                    class="form-search">
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
                <nav class="navbar" id="pcNav">
                    <ul class="navbar__list">
                        <li>
                            <a
                                href="./index.aspx"
                                class="navbar__item navbar__item-action">Home</a>
                        </li>
                        <li>
                            <a
                                href="./product-manager.aspx"
                                class="navbar__item">About</a>
                        </li>
                        <li>
                            <a href="#!" class="navbar__item">Contact Us</a>
                        </li>
                        <li>
                            <a
                                href="#!"
                                class="navbar__item"
                                id="logout"
                                runat="server">Blog</a>
                        </li>
                        <!-- Show on mobile tablet -->
                        <li class="show-on-mobile-tablet">
                            <a
                                href="#!"
                                class="navbar__item separate"
                                id="A1"
                                runat="server">
                                <label>Favorite products</label>
                                <!-- <img
                                            src="./assets/icon/tym.svg"
                                            alt="Tym"
                                        /> -->
                            </a>
                        </li>
                        <li class="show-on-mobile-tablet">
                            <a
                                href="./shopping-cart.aspx"
                                class="navbar__item separate"
                                id="A2"
                                runat="server">
                                <label>Shopping cart</label>
                                <!-- <img
                                            src="./assets/icon/cart-item.svg"
                                            alt="Cart item"
                                        /> -->
                            </a>
                        </li>
                        <li class="show-on-mobile-tablet">
                            <a
                                href="./login.aspx"
                                class="navbar__item separate"
                                id="A3"
                                runat="server">
                                <label>Login</label>
                                <!-- <img
                                            src="./assets/icon/user.svg"
                                            alt="User"
                                        /> -->
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="header-action">
                    <a href="#!" class="header-action__link">
                        <img src="./assets/icon/tym.svg" alt="Tym" />
                    </a>
                    <a
                        href="./shopping-cart.aspx"
                        class="header-action__link">
                        <img
                            src="./assets/icon/cart-item.svg"
                            alt="Cart item" />
                        <span class="counter-product" runat="server" id="counterProduct">NaN</span>
                    </a>
                    <a href="./login.aspx" class="header-action__link">
                        <img src="./assets/icon/user.svg" alt="User" />
                    </a>
                </div>

                <!-- Toggle menu on mobile -->
                <div
                    class="toggle-menu show-on-mobile-tablet"
                    id="toggleMenu">
                    <img src="./assets/icon/menu-mobile.svg" alt="" />
                </div>
            </div>
        </div>
    </header>
    <!-- Header Mobile -->
    <header class="mobile-header">
        <!-- Overlay -->
        <div class="menu-overlay" id="menuOverlay"></div>
        <div class="menu-drawer" id="menuDrawer">
            <a href="">
                <img src="./assets/img/logo.svg" alt="Cyber" />
            </a>

            <!-- Form search -->

            <form
                id="mobileFormSearch"
                action="products-page.aspx"
                method="get"
                class="form-search">
            </form>

            <!-- Navigation -->
            <nav id="mobileNav"></nav>
        </div>
    </header>
    <!-- Main -->
    <main>
        <form id="form" method="get" action="">
            <div class="main">
                <div class="container">
                    <div class="main__inner">
                        <section class="summary">
                            <label class="summary__title">Summary</label>
                            <div class="summary__product" id="productList" runat="server">
                                <%--<div class="product__row">
                                    <img
                                        src="./assets/img/discount-01.png"
                                        alt=""
                                        class="product__img" />
                                    <p class="product__name">
                                        Apple iPhone 14 Pro Max 128Gb
                                    </p>
                                    <p class="product__price">$1399</p>
                                </div>
                                <div class="product__row">
                                    <img
                                        src="./assets/img/discount-02.png"
                                        alt=""
                                        class="product__img" />
                                    <p class="product__name">
                                        AirPods Max Silver
                                    </p>
                                    <p class="product__price">$549</p>
                                </div>
                                <div class="product__row">
                                    <img
                                        src="./assets/img/discount-03.png"
                                        alt=""
                                        class="product__img" />
                                    <p class="product__name">
                                        Apple Watch Series 9 GPS 41mm
                                    </p>
                                    <p class="product__price">$399</p>
                                </div>--%>
                            </div>
                            <div class="summary__detail">
                                <div class="detail-row">
                                    <p class="detail__title">Address</p>
                                    <input
                                        name="address"
                                        placeholder="Address"
                                        id="address"
                                        type="text"
                                        class="address__input"
                                        runat="server" />
                                </div>
                                <div class="detail-row">
                                    <p class="detail__title">Shipment method</p>
                                    <p class="detail__value">Free</p>
                                </div>
                            </div>
                            <div class="price">
                                <div class="price-subtotal">
                                    <p class="price-subtotal__title">
                                        Subtotal
                                    </p>
                                    <p class="price-subtotal__value" runat="server" id="price">$0</p>
                                </div>
                                <div class="price-detail">
                                    <div class="price-detail__row">
                                        <p class="price-detail__title">
                                            Estimated Tax
                                        </p>
                                        <p class="price-detail__value" runat="server" id="tax">$0</p>
                                    </div>
                                    <div class="price-detail__row">
                                        <p class="price-detail__title">
                                            Estimated shipping & Handling
                                        </p>
                                        <p class="price-detail__value" runat="server" id="priceShippingHandle">$0</p>
                                    </div>
                                </div>
                                <div class="price-total">
                                    <p class="price-total__title">Total</p>
                                    <p class="price-total__value" runat="server" id="priceTotal">$0</p>
                                </div>
                            </div>
                        </section>
                        <div class="payment">
                            <h2 class="payment__title">Payment</h2>
                            <img
                                src="./assets/img/bank-card.png"
                                alt="Bank card"
                                class="payment__img" />
                            <div class="payment__inputs">
                                <input
                                    name=""
                                    placeholder="Cardholder Name"
                                    id="cardholderName"
                                    type="text"
                                    class="payment__input" />
                                <input
                                    name=""
                                    placeholder="Card Number"
                                    id="cardNumber"
                                    type="text"
                                    class="payment__input" />
                                <div class="input-row">
                                    <input
                                        name=""
                                        placeholder="Exp.Date"
                                        id="cardDate"
                                        type="text"
                                        class="payment__input" />
                                    <input
                                        name=""
                                        placeholder="CVV"
                                        id="cardCVV"
                                        type="text"
                                        class="payment__input" />
                                </div>
                                <p class="msg-error-card" id="msgErrorCard"></p>
                            </div>
                            <div class="checkbox">
                                <input
                                    id="confirmAddress"
                                    name="confirmAddress"
                                    value="Confirm Address"
                                    type="checkbox"
                                    class="checkbox-input"
                                    hidden />
                                <label
                                    for="confirmAddress"
                                    class="checkbox-label">
                                    Same as billing address
                                </label>
                                <p class="msg-error-confirmAddress" id="msgConfirmAddress"></p>
                            </div>
                            <button type="button" class="payment__btn" id="paymentBtn">
                                Pay
                            </button>
                        </div>
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
                    <a href="./index.aspx">
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
    <script src="./assets/js/payment-page.js"></script>
</body>
</html>
