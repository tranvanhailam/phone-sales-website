using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phone_sales_website
{
    public partial class login : System.Web.UI.Page
    {
        protected void ClearInput()
        {
            account.Style["borderColor"] = "#ccc";
            msgErrorAccount.Style["display"] = "none";
            password.Style["borderColor"] = "#ccc";
            msgErrorPassword.Style["display"] = "none";
            account.Value = null;
            password.Value = null;
        }

        protected void CreateAccountDefault()
        {
            List<User> userList = (List<User>)Application["userList"];
            userList.Add(new User("Admin", "0334681298", "11/139 Tan Mai Hoang Mai Ha Noi", "male", "2004-10-26", "admin", "@Lam2004"));
            userList.Add(new User("Hanoi Open University", "0334681298", "96 Dinh Cong Hoang Mai Ha Noi", "male", "2004-10-26", "hou", "@Lam2004"));
            userList.Add(new User("Tran Van Hai Lam", "0334681298", "11/139 Tan Mai Hoang Mai Ha Noi", "male", "2004-10-26", "hailam", "@Lam2004"));
            Application["userList"] = userList;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateAccountDefault();
            if (Session["signUp"] != null)
            {
                statusServer.Value = Session["signUp"].ToString();
                Session["signUp"] = null;
            }
            if (IsPostBack)
            {
                List<User> userList = (List<User>)Application["userList"];
                String accountName = Request.Form.Get("account").ToString();
                bool isAccountExist = false;
                foreach (User user in userList)
                {
                    if (user.Account.CompareTo(accountName) == 0)
                    {
                        isAccountExist = true;
                        String passwordAccount = Request.Form.Get("password").ToString();
                        if (user.Password.CompareTo(passwordAccount) == 0)
                        {
                            if (user.Account.CompareTo("admin") == 0 || user.Account.CompareTo("hou") == 0 || user.Account.CompareTo("hailam") == 0)
                            {
                                Session["account"] = accountName;
                                Session["password"] = passwordAccount;
                                Session["login"] = "loginSuccess";
                                Session["assecsProductManager"] = "allowAssecsProductManager";

                                List<ShoppingCartOfUser> shoppingCartOfUserList = (List<ShoppingCartOfUser>)Application["shoppingCartOfUserList"];
                                shoppingCartOfUserList.Add(new ShoppingCartOfUser("admin", "sp001"));
                                shoppingCartOfUserList.Add(new ShoppingCartOfUser("admin", "sp006"));
                                Application["shoppingCartOfUserList"] = shoppingCartOfUserList;

                                ClearInput();
                                Response.Redirect("index.aspx");
                                break;
                            }
                            else
                            {
                                Session["account"] = accountName;
                                Session["password"] = passwordAccount;
                                Session["login"] = "loginSuccess";
                                Session["assecsProductManager"] = "disableAssecsProductManager";

                                ClearInput();
                                Response.Redirect("index.aspx");
                                break;
                            }

                        }
                        else
                        {
                            password.Style["borderColor"] = "#ff000";
                            msgErrorPassword.InnerText = "Sai mật khẩu, vui lòng nhập lại";
                            msgErrorPassword.Style["display"] = "inline-block";
                            break;
                        }
                    }
                }

                if (!isAccountExist)
                {
                    account.Style["borderColor"] = "#ff000";
                    msgErrorAccount.InnerText = "Tài khoản " + accountName + " không tồn tại, vui lòng nhập đúng tên tài khoản";
                    msgErrorAccount.Style["display"] = "inline-block";
                }
            }

        }
    }
}