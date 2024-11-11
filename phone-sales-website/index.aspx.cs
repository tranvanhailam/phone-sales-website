using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace phone_sales_website
{
    public partial class index : System.Web.UI.Page
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
        protected void DisplayProductIntroduce()
        {
            List<Product> productList = (List<Product>)Application["productList"];
            foreach (Product product in productList)
            {
                if (product.ProductID.CompareTo("sp006") == 0)
                {
                    productNameIntroduct.InnerHtml = $"IPhone 14 <strong>Pro</strong>";
                    linkToDetailProductIntroduct.HRef = $"/product-detail.aspx?productID={product.ProductID}";
                }
            }
        }
        protected void DisplayProductList()
        {
            productList.InnerHtml = "";
            discountList.InnerHtml = "";
            List<Product> productListOnApp = (List<Product>)Application["productList"];
            int countProduct = 0;
            foreach (Product product in productListOnApp)
            {
                if (countProduct < 8)
                {
                    productList.InnerHtml += $"<div class=\"product-item\">" +
                        $"<img src=\"./assets/icon/tym-product.svg\" alt=\"\" class=\"product-item__icon-tym tym-product\" />" +
                        $"<img src=\"./uploads/{product.ProductImage}\" alt=\"{product.ProductName}\" class=\"product-item__img\" />" +
                        $"<p class=\"product-item__label\">{product.ProductName}</p>" +
                        $"<p class=\"product-item__price\">${product.Price}</p>" +
                        $"<a href=\"/product-detail.aspx?productID={product.ProductID}\" class=\"product-item__btn btn-bg-black\">Buy Now</a>" +
                        $"</div>";
                    countProduct++;
                }
                else if (countProduct >= 8 && countProduct < 12)
                {
                    discountList.InnerHtml += $"<div class=\"discount-item\">" +
                        $"<img src=\"./assets/icon/tym-product.svg\" alt=\"\" class=\"discount-item__icon-tym tym-product\" />" +
                        $"<img src=\"./uploads/{product.ProductImage}\" alt=\"{product.ProductName}\" class=\"discount-item__img\" />" +
                        $"<p class=\"discount-item__label\">{product.ProductName}</p>" +
                        $"<p class=\"discount-item__price\">${product.Price}</p>" +
                        $"<a href=\"/product-detail.aspx?productID={product.ProductID}\" class=\"discount-item__btn btn-bg-black\">Buy Now</a>" +
                        $"</div>";
                    countProduct++;
                }
                else
                {
                    break;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayProductIntroduce();
            DisplayProductList();
            if (statusServer.Value.ToString().CompareTo("logout") == 0)
            {
                Session.Abandon();
                Response.Redirect("login.aspx");
            }

            if (Session["account"] != null)
            {
                helloGuest.InnerHtml = "<p>Hello " + Session["account"] + "</b>, have a nice shopping day !</p>";
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
        }

    }
}