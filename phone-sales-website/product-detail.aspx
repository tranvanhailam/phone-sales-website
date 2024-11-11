<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product-detail.aspx.cs" Inherits="phone_sales_website.product_detail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Product detail | Cyber</title>
    <!-- Reset CSS -->
    <link rel="stylesheet" href="./assets/css/reset.css" />
    <!-- Font Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
        rel="stylesheet" />
    <!-- Style CSS -->
    <link rel="stylesheet" href="./assets/css/product-detail.css" />
    <!-- Responsive -->
    <link
        rel="stylesheet"
        href="./assets/css/responsive-product-detail.css" />
</head>
<body>
    <div id="toast"></div>
    <input type="hidden" id="statusServer" runat="server" />
    <input type="hidden" id="accountLogin" runat="server" />
    <input type="hidden" id="addToCartStatus" runat="server" />
    <div class="hello-guest" id="helloGuest" runat="server"></div>
    <!-- Header PC-->
    <header class="header">
        <div class="container">
            <div class="header-body">
                <div class="logo">
                    <a href="./index.aspx">
                        <img src="./assets/img/logo.svg" alt="" />
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
    <main>
        <section class="main-top">
            <div class="container">
                <div class="main-top__body">
                    <a href="./index.aspx" class="main-top__link">Home</a>
                    <img
                        src="./assets/icon/icon-products-page/arrow-right.svg"
                        alt="Arrow right"
                        class="main-top__img" />
                    <a href="./products-page.aspx" class="main-top__link">Smartphones</a>
                    <img
                        src="./assets/icon/icon-products-page/arrow-right.svg"
                        alt="Arrow right"
                        class="main-top__img" />
                    <a
                        href="./products-page.aspx"
                        class="main-top__link main-top__link-action">Product detail</a>
                </div>
            </div>
        </section>
        <section class="product">
            <div class="container">
                <div class="product__body">
                    <img
                        src="./assets/img/product-01.png"
                        alt=""
                        class="product-img"
                        id="productImage"
                        runat="server" />
                    <section class="product-right">
                        <div class="product-info">
                            <h1 class="product-title" id="productName" runat="server">Apple iPhone 14 Pro Max</h1>
                            <div class="product-price">
                                <p class="product-price__new" id="price" runat="server">$1399</p>
                                <p class="product-price__old" id="priceOld" runat="server">$1499</p>
                            </div>
                            <div class="product-color">
                                <p class="product-color__title">
                                    Select color:
                                </p>
                                <div class="product-color__select-colors" id="color" runat="server">
                                </div>
                            </div>
                            <div class="product-info-grid">
                                <div class="product-info-grid__item">
                                    <img
                                        src="./assets/icon/icon-product-detail/screen-size.svg"
                                        alt=""
                                        class="product-info-grid__icon" />
                                    <div class="product-info-grid__body">
                                        <p class="product-info-grid__title">
                                            Screen size
                                        </p>
                                        <p class="product-info-grid__value" id="screenSize" runat="server">
                                            6.7"
                                        </p>
                                    </div>
                                </div>
                                <div class="product-info-grid__item">
                                    <img
                                        src="./assets/icon/icon-product-detail/cpu.svg"
                                        alt=""
                                        class="product-info-grid__icon" />
                                    <div class="product-info-grid__body">
                                        <p class="product-info-grid__title">
                                            CPU
                                        </p>
                                        <p class="product-info-grid__value" id="cpu" runat="server">
                                            Apple A16 Bionic
                                        </p>
                                    </div>
                                </div>
                                <div class="product-info-grid__item">
                                    <img
                                        src="./assets/icon/icon-product-detail/memory-capacity.svg"
                                        alt=""
                                        class="product-info-grid__icon" />
                                    <div class="product-info-grid__body">
                                        <p class="product-info-grid__title">
                                            Memory Capacity
                                        </p>
                                        <p class="product-info-grid__value" id="memoryCapacity" runat="server">
                                            1000 GB
                                        </p>
                                    </div>
                                </div>
                                <div class="product-info-grid__item">
                                    <img
                                        src="./assets/icon/icon-product-detail/front-camera.svg"
                                        alt=""
                                        class="product-info-grid__icon" />
                                    <div class="product-info-grid__body">
                                        <p class="product-info-grid__title">
                                            Front camera
                                        </p>
                                        <p class="product-info-grid__value" id="frontCamera" runat="server">
                                            12 MP
                                        </p>
                                    </div>
                                </div>
                                <div class="product-info-grid__item">
                                    <img
                                        src="./assets/icon/icon-product-detail/main-camera.svg"
                                        alt=""
                                        class="product-info-grid__icon" />
                                    <div class="product-info-grid__body">
                                        <p class="product-info-grid__title">
                                            Main camera
                                        </p>
                                        <p class="product-info-grid__value" id="mainCamera" runat="server">
                                            48 MP
                                        </p>
                                    </div>
                                </div>
                                <div class="product-info-grid__item">
                                    <img
                                        src="./assets/icon/icon-product-detail/battery-capacity.svg"
                                        alt=""
                                        class="product-info-grid__icon" />
                                    <div class="product-info-grid__body">
                                        <p class="product-info-grid__title">
                                            Battery capacity
                                        </p>
                                        <p class="product-info-grid__value" id="batteryCapacity" runat="server">
                                            4323 mAh
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <p class="product-desc" id="descProduct" runat="server">
                                Enhanced capabilities thanks toan enlarged
                                    display of 6.7 inchesand work without
                                    rechargingthroughout the day. Incredible
                                    photosas in weak, yesand in bright
                                    lightusing the new systemwith two cameras
                                    lorem ipsum dolor sit amet consectetur
                                    adipisicing elit. Eveniet consequatur,
                                    soluta delectus laborum quidem ex numquam
                                    ducimus. Magni tenetur voluptates sapiente
                                    ipsam debitis incidunt ut voluptatum illum!
                                    Amet, odio enim.
                            </p>
                        </div>
                        <div class="action-btn">
                            <button class="btn-add-favorite">
                                Add to Favorites
                            </button>
                            <form id="formAddToCart" class="form-add-to-card" action="shopping-cart.aspx" method="get">
                                <button class="btn-add-cart" type="submit">
                                    Add to Cart
                                </button>
                                <input type="hidden" name="idProductAddToCart" id="idProductAddToCart" runat="server" />
                            </form>
                        </div>
                        <div class="product-info-status">
                            <div class="status-item">
                                <div class="status-item__icon">
                                    <img
                                        src="./assets/icon/icon-product-detail/delivery.svg"
                                        alt="" />
                                </div>
                                <div class="status-item__body">
                                    <p class="status-item__title">
                                        Free Delivery
                                    </p>
                                    <p class="status-item__value">
                                        1-2 day
                                    </p>
                                </div>
                            </div>
                            <div class="status-item">
                                <div class="status-item__icon">
                                    <img
                                        src="./assets/icon/icon-product-detail/stock.svg"
                                        alt="" />
                                </div>
                                <div class="status-item__body">
                                    <p class="status-item__title">
                                        In Stock
                                    </p>
                                    <p class="status-item__value">Today</p>
                                </div>
                            </div>
                            <div class="status-item">
                                <div class="status-item__icon">
                                    <img
                                        src="./assets/icon/icon-product-detail/guaranteed.svg"
                                        alt="" />
                                </div>
                                <div class="status-item__body">
                                    <p class="status-item__title">
                                        Guaranteed
                                    </p>
                                    <p class="status-item__value">1 year</p>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>
        <section class="product-details">
            <div class="container">
                <div class="product-details__inner">
                    <h2 class="product-details__heading">Details</h2>
                    <p class="product-details__desc" id="descProductDetail" runat="server">
                        Just as a book is judged by its cover, the first
                            thing you notice when you pick up a modern
                            smartphone is the display. Nothing surprising,
                            because advanced technologies allow you to
                            practically level the display frames and cutouts for
                            the front camera and speaker, leaving no room for
                            bold design solutions. And how good that in such
                            realities Apple everything is fine with displays.
                            Both critics and mass consumers always praise the
                            quality of the picture provided by the products of
                            the Californian brand. And last year's 6.7-inch
                            Retina panels, which had ProMotion, caused real
                            admiration for many.
                    </p>
                    <div class="product-details__row">
                        <p class="product-details__title">Product ID</p>
                        <p class="product-details__value" id="productIDDetail" runat="server">SP01</p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">Manufacturer</p>
                        <p class="product-details__value" id="manufacturerDetail" runat="server">Apple</p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">
                            Operating system
                        </p>
                        <p class="product-details__value" id="operatingSystemDetail" runat="server">IOS</p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">CPU</p>
                        <p class="product-details__value" id="cpuDetail" runat="server">
                            Apple A16 Bionic
                        </p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">Color</p>
                        <p class="product-details__value" id="colorDetail" runat="server">Violet</p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">Screen size</p>
                        <p class="product-details__value" id="screenSizeDetail" runat="server">6.7"</p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">
                            Battery capacity
                        </p>
                        <p class="product-details__value" id="batteryCapacityDetail" runat="server">4323 mAh</p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">RAM capacity</p>
                        <p class="product-details__value" id="ramCapacityDetail" runat="server">8 GB</p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">
                            Memory capacity
                        </p>
                        <p class="product-details__value" id="memoryCapacityDetail" runat="server">1000 GB</p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">Front camera</p>
                        <p class="product-details__value" id="frontCameraDetail" runat="server">20 MP</p>
                    </div>
                    <div class="product-details__row">
                        <p class="product-details__title">Main camera</p>
                        <p class="product-details__value" id="mainCameraDetail" runat="server">40 MP</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related - Liên quan -->
        <section class="related">
            <div class="container">
                <p class="related__title">Related Products</p>
                <div class="related-list" id="relatedList" runat="server">
                    <div class="related-item">
                        <img
                            src="./assets/icon/tym-product.svg"
                            alt=""
                            class="related-item__icon-tym tym-product" />
                        <img
                            src="./assets/img/discount-01.png"
                            alt="Apple iPhone 14 Pro Max 128GB Deep Purple "
                            class="related-item__img" />
                        <p class="related-item__label">
                            Apple iPhone 14 Pro 512GB Gold (MQ233)
                        </p>
                        <p class="related-item__price">$1437</p>
                        <a href="#!" class="related-item__btn btn-bg-black">Buy Now
                        </a>
                    </div>
                    <div class="related-item">
                        <img
                            src="./assets/icon/tym-product.svg"
                            alt=""
                            class="related-item__icon-tym tym-product" />
                        <img
                            src="./assets/img/discount-02.png"
                            alt="Blackmagic Pocket Cinema Camera 6k"
                            class="related-item__img" />
                        <p class="related-item__label">
                            AirPods Max Silver Starlight Aluminium
                        </p>
                        <p class="related-item__price">$549</p>
                        <a href="#!" class="related-item__btn btn-bg-black">Buy Now
                        </a>
                    </div>
                    <div class="related-item">
                        <img
                            src="./assets/icon/tym-product.svg"
                            alt=""
                            class="related-item__icon-tym tym-product" />
                        <img
                            src="./assets/img/discount-03.png"
                            alt="Apple Watch Series 9 GPS 41mm Starlight Aluminium "
                            class="related-item__img" />
                        <p class="related-item__label">
                            Apple Watch Series 9 GPS 41mm Starlight
                                Aluminium
                        </p>
                        <p class="related-item__price">$399</p>
                        <a href="#!" class="related-item__btn btn-bg-black">Buy Now
                        </a>
                    </div>
                    <div class="related-item">
                        <img
                            src="./assets/icon/tym-product.svg"
                            alt=""
                            class="related-item__icon-tym tym-product" />
                        <img
                            src="./assets/img/discount-04.png"
                            alt="AirPods Max Silver
                        Starlight Aluminium"
                            class="related-item__img" />
                        <p class="related-item__label">
                            Apple iPhone 14 Pro 1TB Gold (MQ2V3)
                        </p>
                        <p class="related-item__price">$1499</p>
                        <a href="#!" class="related-item__btn btn-bg-black">Buy Now
                        </a>
                    </div>
                </div>
            </div>
        </section>
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
    <script src="./assets/js/product-detail.js"></script>
</body>
</html>
