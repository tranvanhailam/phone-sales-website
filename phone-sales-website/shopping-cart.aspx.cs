using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phone_sales_website
{
    public partial class shopping_cart : System.Web.UI.Page
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
        protected void DisplayProductInShoppingCart()
        {
            productList.InnerHtml = "";
            //double totalPriceProduct = 0;
            //int totalProduct = 0;
            int indexLabel = 0;
            List<ShoppingCartOfUser> shoppingCartOfUsersList = (List<ShoppingCartOfUser>)Application["shoppingCartOfUserList"];
            List<Product> productListOnApp = (List<Product>)Application["productList"];
            foreach (ShoppingCartOfUser shoppingCartOfUser in shoppingCartOfUsersList)
            {
                if (shoppingCartOfUser.Account.CompareTo(Session["account"].ToString()) == 0)
                {
                    foreach (Product product in productListOnApp)
                    {
                        if (shoppingCartOfUser.ProductID.CompareTo(product.ProductID) == 0)
                        {
                            productList.InnerHtml += $"<div class=\"product\">" +
                                $"<input id=\"{product.ProductID}{indexLabel}\" name=\"productID\" value=\"{product.ProductID}\" type=\"checkbox\" class=\"checkbox-input\" data-price=\"{product.Price}\" hidden />" +
                                $"<label for=\"{product.ProductID}{indexLabel}\" class=\"checkbox-label\"></label>" +
                                $"<a href=\"/product-detail.aspx?productID={product.ProductID}\"><img src=\"./uploads/{product.ProductImage}\" alt=\"{product.ProductName}\" class=\"product__img\" /></a>" +
                                $"<div class=\"product__info\">" +
                                $"<p class=\"product__name\"><a href=\"/product-detail.aspx?productID={product.ProductID}\" class=\"product__name\">{product.ProductName}</a></p>" +
                                $"<p class=\"product__id\">#{product.ProductID}</p>" +
                                $"</div>" +
                                $"<div class=\"product__counter\">" +
                                $"<img src=\"./assets/icon/icon-shopping-cart/sub.svg\" alt=\"\" class=\"sub-icon\" />" +
                                $"<p class=\"product__number\">1</p>" +
                                $"<img src=\"./assets/icon/icon-shopping-cart/add.svg\" alt=\"\"  class=\"add-icon\" />" +
                                $"</div>" +
                                $"<p class=\"product__price\">${product.Price}</p>" +
                                $"<a href=\"/shopping-cart.aspx?removeProductID={product.ProductID}\">" +
                                $"<img src=\"./assets/icon/icon-shopping-cart/remove.svg\" alt=\"\" class=\"remove-icon\" />" +
                                $"</a>" +
                                $"</div>";
                            indexLabel++;
                            //totalProduct++;
                            //totalPriceProduct += product.Price;
                            break;
                        }
                    }
                }
            }

            //price.InnerText = "$" + totalPriceProduct;
            //tax.InnerText = "$" + (totalProduct * 10);
            //priceShippingHandle.InnerText = "$" + (totalProduct * 3);
            //priceTotal.InnerText = "$" + (totalPriceProduct + (totalProduct * 10) + (totalProduct * 3));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
            {
                helloGuest.InnerHtml = "<p>Hello " + Session["account"] + "</b>, have a nice shopping day !</p>";
                DisplayProductInShoppingCart();
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

            if (Request.QueryString.Get("idProductAddToCart") != null && Request.QueryString.Get("idProductAddToCart").ToString().CompareTo("") != 0)
            {
                List<ShoppingCartOfUser> shoppingCartOfUsersList = (List<ShoppingCartOfUser>)Application["shoppingCartOfUserList"];
                ShoppingCartOfUser shoppingCartOfUser = new ShoppingCartOfUser(Session["account"].ToString(), Request.QueryString.Get("idProductAddToCart").ToString());
                shoppingCartOfUsersList.Add(shoppingCartOfUser);
                Application["shoppingCartOfUserList"] = shoppingCartOfUsersList;

                Session["addToCartStatus"] = "addToCartSuccess";
                Response.Redirect(Request.UrlReferrer.ToString());// Quay lại trang shopping cart
            }

            if (Request.QueryString.Get("removeProductID") != null)
            {
                ShoppingCartOfUser shoppingCartOfUserRemove = new ShoppingCartOfUser();
                List<ShoppingCartOfUser> shoppingCartOfUsersList = (List<ShoppingCartOfUser>)Application["shoppingCartOfUserList"];
                foreach (ShoppingCartOfUser shoppingCartOfUser in shoppingCartOfUsersList)
                {
                    if (shoppingCartOfUser.Account.CompareTo(Session["account"].ToString()) == 0)
                    {
                        if (shoppingCartOfUser.ProductID.CompareTo(Request.QueryString.Get("removeProductID").ToString()) == 0)
                        {
                            shoppingCartOfUserRemove = shoppingCartOfUser;
                            break;
                        }
                    }

                }
                shoppingCartOfUsersList.Remove(shoppingCartOfUserRemove);
                Application["shoppingCartOfUserList"] = shoppingCartOfUsersList;
                Response.Redirect("shopping-cart.aspx");// Quay lại trang shopping cart
            }
        }
    }
}