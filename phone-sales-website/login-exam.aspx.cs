using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phone_sales_website
{
    public partial class login_exam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                List<UserExam> userList = (List<UserExam>)Application["userExamList"];
                bool isAccountExist = false;
                String nameUser = Request.Form.Get("nameUser").ToString();
                String dateOfBirth = Request.Form.Get("dateOfBirth").ToString();
                String likes = Request.Form.Get("like").ToString();
                var like = "";
                foreach (var i in likes)
                {
                    like += i.ToString();
                }

                foreach (UserExam user in userList)
                {
                    if (user.Name.CompareTo(nameUser) == 0 &&  user.DateOfBirth.CompareTo(dateOfBirth) == 0 && user.Like.CompareTo(like) == 0)
                    {
                        Response.Redirect("page.aspx");
                        //account.Style["borderColor"] = "#ff000";
                        //msgErrorAccount.InnerText = "Tài khoản " + accountName + " đã tồn tại, vui lòng nhập tên tài khoản khác";
                        //msgErrorAccount.Style["display"] = "inline-block";
                        isAccountExist = true;
                        break;
                    }
                }

                if (!isAccountExist)
                {
                    //UserExam userNew = new UserExam(nameUser, sex, dateOfBirth, className);
                    //userList.Add(userNew);
                    //Application["userExamList"] = userList;
                    ////Session["signUp"] = "signUpSuccess";
                    ////ClearInput();
                    //Response.Redirect("login-exam.aspx");
                }

            }
        }
    }
}