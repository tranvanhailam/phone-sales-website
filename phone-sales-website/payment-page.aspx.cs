using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phone_sales_website
{
    public partial class payment_page : System.Web.UI.Page
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
        protected void DisplayProductInProductListPayment()
        {
            productList.InnerHtml = "";
            if (Request.QueryString.Get("productID") != null)
            {
                double totalPriceProduct = 0;
                int totalProduct = 0;
                List<Product> productListOnApp = (List<Product>)Application["productList"];
                var productIDs = Request.QueryString.GetValues("productID");
                foreach (var productID in productIDs)
                {
                    foreach (var product in productListOnApp)
                    {
                        if (productID.ToString().CompareTo(product.ProductID) == 0)
                        {
                            productList.InnerHtml += $"<div class=\"product__row\">" +
                                $"<img src=\"./uploads/{product.ProductImage}\" alt=\"{product.ProductName}\" class=\"product__img\" />" +
                                $"<p class=\"product__name\">{product.ProductName}</p>" +
                                $"<p class=\"product__price\">${product.Price}</p>" +
                                $"</div>";

                            totalProduct++;
                            totalPriceProduct += product.Price;
                            break;
                        }
                    }
                }
                price.InnerText = "$" + totalPriceProduct;
                tax.InnerText = "$" + (totalProduct * 6);
                priceShippingHandle.InnerText = "$" + (totalProduct * 3);
                priceTotal.InnerText = "$" + (totalPriceProduct + (totalProduct * 10) + (totalProduct * 3));
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
            {
                helloGuest.InnerHtml = "<p>Hello " + Session["account"] + "</b>, have a nice shopping day !</p>";
                CountNumberOfProductInCart();
                DisplayProductInProductListPayment();
                List<User> userList = (List<User>)Application["userList"];
                foreach (User user in userList)
                {
                    if (Session["account"].ToString().CompareTo(user.Account) == 0)
                    {
                        address.Value = user.Address;
                        break;
                    }
                }
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