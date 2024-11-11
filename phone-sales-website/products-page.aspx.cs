using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace phone_sales_website
{
    public partial class products_page : System.Web.UI.Page
    {
        protected void CountNumberOfProductInCart()
        {
            int numberOfProductInCart = 0;
            List<ShoppingCartOfUser> shoppingCartOfUsersList = (List<ShoppingCartOfUser>)Application["shoppingCartOfUserList"];
            foreach (ShoppingCartOfUser shoppingCartOfUser in shoppingCartOfUsersList)
            {
                if (shoppingCartOfUser.Account.CompareTo(Session["account"].ToString()) == 0)
                {
                    numberOfProductInCart++;
                }
            }
            counterProduct.InnerText = numberOfProductInCart + "";
        }
        protected void SearchProductByName()
        {
            productList.InnerHtml = "";
            List<Product> productListOnApp = (List<Product>)Application["productList"];
            String productNameSearch = Request.QueryString.Get("search").ToString();
            int countProduct = 0;
            foreach (Product product in productListOnApp)
            {
                if (product.ProductName.IndexOf(productNameSearch, StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    countProduct++;
                    productList.InnerHtml += $"<div class=\"product-item\">" +
                    $"<img src=\"./assets/icon/tym-product.svg\" alt=\"\" class=\"product-item__icon-tym tym-product\" />" +
                    $"<img src=\"./uploads/{product.ProductImage}\" alt=\"{product.ProductName}\" class=\"product-item__img\" />" +
                    $"<p class=\"product-item__label\">{product.ProductName}</p>" +
                    $"<p class=\"product-item__price\">${product.Price}</p>" +
                    $"<a href=\"/product-detail.aspx?productID={product.ProductID}\" class=\"product-item__btn btn-bg-black\" id=\"{product.ProductID}\">Buy Now</a>" +
                    $"</div>";
                }
            }
            selectedProduct.InnerText = countProduct.ToString();
            if (countProduct == 0)
            {
                msgNoProduct.InnerText = "No products found";
                msgNoProduct.Style["display"] = "block";
            }
            else
            {
                msgNoProduct.Style["display"] = "none";
            }
        }
        protected void SearchProductByManufacturer(String manufacturer)
        {
            List<Product> productListOnApp = (List<Product>)Application["productList"];
            int countProduct = 0;
            foreach (Product product in productListOnApp)
            {
                if (product.Manufacturer.IndexOf(manufacturer, StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    countProduct++;
                    productList.InnerHtml += $"<div class=\"product-item\">" +
                    $"<img src=\"./assets/icon/tym-product.svg\" alt=\"\" class=\"product-item__icon-tym tym-product\" />" +
                    $"<img src=\"./uploads/{product.ProductImage}\" alt=\"{product.ProductName}\" class=\"product-item__img\" />" +
                    $"<p class=\"product-item__label\">{product.ProductName}</p>" +
                    $"<p class=\"product-item__price\">${product.Price}</p>" +
                    $"<a href=\"/product-detail.aspx?productID={product.ProductID}\" class=\"product-item__btn btn-bg-black\" id=\"{product.ProductID}\">Buy Now</a>" +
                    $"</div>";
                }
            }
            selectedProduct.InnerText = countProduct.ToString() ;
        }
        protected void DisplayProductList()
        {
            productList.InnerHtml = "";
            List<Product> productListOnApp = (List<Product>)Application["productList"];
            selectedProduct.InnerText = productListOnApp.Count.ToString();
            if (productListOnApp.Count == 0)
            {
                msgNoProduct.InnerText = "There are currently no products";
                msgNoProduct.Style["display"] = "block";
            }
            else
            {
                msgNoProduct.Style["display"] = "none";
                foreach (Product product in productListOnApp)
                {
                    productList.InnerHtml += $"<div class=\"product-item\">" +
                        $"<img src=\"./assets/icon/tym-product.svg\" alt=\"\" class=\"product-item__icon-tym tym-product\" />" +
                        $"<img src=\"./uploads/{product.ProductImage}\" alt=\"{product.ProductName}\" class=\"product-item__img\" />" +
                        $"<p class=\"product-item__label\">{product.ProductName}</p>" +
                        $"<p class=\"product-item__price\">${product.Price}</p>" +
                        $"<a href=\"/product-detail.aspx?productID={product.ProductID}\" class=\"product-item__btn btn-bg-black\" id=\"{product.ProductID}\">Buy Now</a>" +
                        $"</div>";
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayProductList();
            if (Session["account"] != null)
            {
                helloGuest.InnerHtml = "<p>Hello " + Session["account"] + "</b>, have a nice shopping day !</p>";
                CountNumberOfProductInCart();
            }
            else
            {
                helloGuest.InnerText = "Please login or register for an account for a better shopping experience !";
            }
            if (Session["signUp"] != null)
            {
                statusServer.Value = Session["signUp"].ToString();
                Session["signUp"] = null;
            }

            //Dữ liệu tìm kiếm gửi từ trang hiện tại và trang khác đến
            if (Request.QueryString.Get("search") != null && Request.QueryString.Get("search").Trim().ToString().CompareTo("") != 0)
            {
                SearchProductByName();
            }
            

            //Tìm kiếm theo brand
            if (Request.QueryString.Get("brand") != null)
            {
                productList.InnerHtml = "";

                if (Request.QueryString.Get("brand").Trim().ToString().CompareTo("") != 0)
                    SearchProductByManufacturer(Request.QueryString.Get("brand").Trim().ToString());

                if (Request.QueryString.Get("Apple") != null)
                {
                    SearchProductByManufacturer("Apple");
                    Apple.Checked = true;
                }
                if (Request.QueryString.Get("Samsung") != null)
                {
                    SearchProductByManufacturer("Samsung");
                    Samsung.Checked = true;
                }
                if (Request.QueryString.Get("Xiaomi") != null)
                {
                    SearchProductByManufacturer("Xiaomi");
                    Xiaomi.Checked = true;
                }
                if (Request.QueryString.Get("Poco") != null)
                {
                    SearchProductByManufacturer("Poco");
                    Poco.Checked = true;
                }
                if (Request.QueryString.Get("OPPO") != null)
                {
                    SearchProductByManufacturer("OPPO");
                    OPPO.Checked = true;
                }
                if (Request.QueryString.Get("Honor") != null)
                {
                    SearchProductByManufacturer("Honor");
                    Honor.Checked = true;
                }
                if (Request.QueryString.Get("Motorola") != null)
                {
                    SearchProductByManufacturer("Motorola");
                    Motorola.Checked = true;
                }
                if (Request.QueryString.Get("Nokia") != null)
                {
                    SearchProductByManufacturer("Nokia");
                    Nokia.Checked = true;
                }
                if (Request.QueryString.Get("Realme") != null)
                {
                    SearchProductByManufacturer("Realme");
                    Realme.Checked = true;
                }
                if (Request.QueryString.Get("Apple") == null &&
                    Request.QueryString.Get("Samsung") == null &&
                    Request.QueryString.Get("Xiaomi") == null &&
                    Request.QueryString.Get("Poco") == null &&
                    Request.QueryString.Get("OPPO") == null &&
                    Request.QueryString.Get("Honor") == null &&
                    Request.QueryString.Get("Motorola") == null &&
                    Request.QueryString.Get("Nokia") == null &&
                    Request.QueryString.Get("Realme") == null)
                {
                    DisplayProductList();
                }
            }

        }
    }
}