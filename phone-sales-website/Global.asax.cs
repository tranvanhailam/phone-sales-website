using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace phone_sales_website
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            Application["userList"] = new List<User>();

            Application["productList"] = new List<Product>();
            List<Product> productList = (List<Product>)Application["productList"];
            productList.Add(new Product("sp001", "Apple iPhone 14 Pro 512GB Gold (MQ233)", "Apple", "IOS",
                        "null", "yellow", "product-01.png", "null", 100, 4000, 8,
                        1000, 200, 6, 12, 12));
            productList.Add(new Product("sp002", "Apple iPhone 11 128GB White (MQ233)", "Apple", "IOS",
            "null", "red", "product-02.png", "null", 100, 4000, 8,
            1000, 150, 6, 12, 12));
            productList.Add(new Product("sp003", "Apple iPhone 11 128GB White (MQ233)", "Apple", "IOS",
            "null", "blue", "product-03.png", "null", 100, 4000, 8,
            1000, 150, 6, 12, 12));
            productList.Add(new Product("sp004", "Apple iPhone 14 Pro 1TB Gold (MQ2V3)", "Apple", "IOS",
            "null", "violet", "product-04.png", "null", 100, 4000, 8,
            1000, 250, 6, 12, 12));
            productList.Add(new Product("sp005", "Apple iPhone 14 Pro 1TB Gold (MQ2V3)", "Apple", "IOS",
            "null", "back", "product-05.png", "null", 100, 4000, 8,
            1000, 250, 6, 12, 12));
            productList.Add(new Product("sp006", "Apple iPhone 14 Pro 128GB Deep Purple (MQ0G3)", "Apple", "IOS",
            "null", "aqua", "product-06.png", "null", 100, 4000, 8,
            1000, 220, 6, 12, 12));
            productList.Add(new Product("sp007", "Apple iPhone 13 mini 128GB Pink (MLK23)", "Apple", "IOS",
            "null", "cadetblue", "product-07.png", "null", 100, 4000, 8,
            1000, 200, 6, 12, 12));
            productList.Add(new Product("sp008", "Apple iPhone 14 Pro 256GB Space Black (MQ0T3)", "Apple", "IOS",
            "null", "yellow", "product-08.png", "null", 100, 4000, 8,
            1000, 240, 6, 12, 12));
            productList.Add(new Product("sp009", "Apple iPhone 14 Pro 256GB Silver (MQ103)", "Apple", "IOS",
            "null", "black", "product-09.png", "null", 100, 4000, 8,
            1000, 230, 6, 12, 12));
            productList.Add(new Product("sp010", "Galaxy Z Fold5 Unlocked | 256GB | Phantom Black", "Samsung", "Android",
            "null", "black", "product-10.png", "null", 100, 4000, 8,
            1000, 290, 6, 12, 12));
            productList.Add(new Product("sp011", "Samsung Galaxy 14 Pro 256GB Silver (MQ103)", "Samsung", "Amdroid",
            "null", "black", "product-11.png", "null", 100, 4000, 8,
            1000, 225, 6, 12, 12));
            productList.Add(new Product("sp012", "Redmi Note 13 (6GB/128GB)", "Realme", "Amdroid",
            "null", "black", "product-12.png", "null", 100, 4000, 8,
            1000, 100, 6, 12, 12));
            productList.Add(new Product("sp013", "POCO X6 5G (8GB/256GB)", "Poco", "Amdroid",
            "null", "black", "product-13.png", "null", 100, 4000, 8,
            1000, 110, 6, 12, 12));
            productList.Add(new Product("sp014", "OPPO A18 4GB/64GB", "OPPO", "Amdroid",
            "null", "black", "product-14.png", "null", 100, 4000, 8,
            1000, 70, 6, 12, 12));
            productList.Add(new Product("sp015", "HONOR X7c -8GB / 256GB", "Honor", "Amdroid",
            "null", "black", "product-15.png", "null", 100, 4000, 8,
            1000, 70, 6, 12, 12));

            Application["shoppingCartOfUserList"] = new List<ShoppingCartOfUser>();

            //Exam
            Application["userExamList"] = new List<UserExam>();

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //Application["accounts"] = new List<User>();
        }

    }
}