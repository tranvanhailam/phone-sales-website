using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace phone_sales_website
{
    public class ShoppingCartOfUser
    {
        String account, productID;

        public ShoppingCartOfUser()
        {
        }

        public ShoppingCartOfUser(string account, string productID)
        {
            this.account = account;
            this.productID = productID;
        }

        public string Account { get => account; set => account = value; }
        public string ProductID { get => productID; set => productID = value; }
    }
}