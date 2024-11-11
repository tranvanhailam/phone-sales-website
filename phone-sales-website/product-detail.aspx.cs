using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phone_sales_website
{
    public partial class product_detail : System.Web.UI.Page
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
        protected void DisplayProductRelated(String manufacturer)
        {
            relatedList.InnerHtml = "";
            List<Product> productList = (List<Product>)Application["productList"];
            int countProduct = 0;
            foreach (Product product in productList)
            {
                if (countProduct >= 4)
                {
                    break;
                }
                if (product.Manufacturer.IndexOf(manufacturer, StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    countProduct++;
                    relatedList.InnerHtml += $"<div class=\"related-item\">" +
                    $"<img src=\"./assets/icon/tym-product.svg\" alt=\"\" class=\"related-item__icon-tym tym-product\" />" +
                    $"<img src=\"./uploads/{product.ProductImage}\" alt=\"{product.ProductName}\" class=\"related-item__img\" />" +
                    $"<p class=\"related-item__label\">{product.ProductName}</p>" +
                    $"<p class=\"related-item__price\">${product.Price}</p>" +
                    $"<a href=\"/product-detail.aspx?productID={product.ProductID}\" class=\"related-item__btn btn-bg-black\">Buy Now</a>" +
                    $"</div>";
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
            {
                helloGuest.InnerHtml = "<p>Hello " + Session["account"] + "</b>, have a nice shopping day !</p>";
                accountLogin.Value = Session["account"].ToString();
                CountNumberOfProductInCart();
            }
            else
            {
                helloGuest.InnerText = "Please login or register for an account for a better shopping experience !";
            }
            if (Session["login"] != null)
            {
                statusServer.Value = Session["login"].ToString();
                Session["login"] = null;
            }

            if (Session["addToCartStatus"] != null)
            {
                addToCartStatus.Value = Session["addToCartStatus"].ToString();
                Session["addToCartStatus"] = null;
            }

            if (Request.QueryString.Get("productID") != null)
            {
                List<Product> productList = (List<Product>)Application["productList"];
                foreach (Product product in productList)
                {
                    if (product.ProductID.CompareTo(Request.QueryString.Get("productID").ToString()) == 0)
                    {
                        idProductAddToCart.Value = product.ProductID;
                        productImage.Src = $"./uploads/{product.ProductImage}";
                        productImage.Alt = product.ProductName;
                        productName.InnerText = product.ProductName;
                        price.InnerText = "$" + product.Price;
                        priceOld.InnerText = "$" + (product.Price * 1.3);
                        color.Style["background"] = product.Color;
                        screenSize.InnerText = product.ScreenSize + "\"";
                        cpu.InnerText = product.Cpu;
                        memoryCapacity.InnerText = product.MemoryCapacity + " GB";
                        frontCamera.InnerText = product.FrontCamera + " MP";
                        mainCamera.InnerText = product.MainCamera + " MP";
                        batteryCapacity.InnerText = product.BatteryCapacity + " mAh";
                        descProduct.InnerText = product.DescProduct;
                        descProductDetail.InnerText = product.DescProduct;
                        productIDDetail.InnerText = product.ProductID;
                        manufacturerDetail.InnerText = product.Manufacturer;
                        operatingSystemDetail.InnerText = product.OperatingSystem;
                        cpuDetail.InnerText = product.Cpu;
                        colorDetail.InnerText = product.Color;
                        screenSizeDetail.InnerText = product.ScreenSize + "\"";
                        batteryCapacityDetail.InnerText = product.BatteryCapacity + " mAh";
                        ramCapacityDetail.InnerText = product.RamCapacity + " GB";
                        memoryCapacityDetail.InnerText = product.MemoryCapacity + " GB";
                        frontCameraDetail.InnerText = product.FrontCamera + " MP";
                        mainCameraDetail.InnerText = product.MainCamera + " MP";

                        DisplayProductRelated(product.Manufacturer);
                        break;
                    }
                }
            }

        }
    }
}