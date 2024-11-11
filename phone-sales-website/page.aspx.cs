using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phone_sales_website
{
    public partial class page : System.Web.UI.Page
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
        protected void DisplayProductListOnTable()
        {
            tbody.InnerHtml = "";
            List<UserExam> list = (List<UserExam>)Application["userExamList"];
            foreach (UserExam user in list)
            {
                tbody.InnerHtml += $"<tr>" +
                    $"<td>{user.Name}</td>" +
                    $"<td>{user.DateOfBirth}</td>" +
                    $"<td>{user.Like}</td>" +
                    $" </tr>";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayProductListOnTable();

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