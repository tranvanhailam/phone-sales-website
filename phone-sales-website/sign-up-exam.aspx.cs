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
    public partial class sign_up_exam : System.Web.UI.Page
    {
        //protected User NewUser()
        //{
        //    String nameUser = Request.Form.Get("nameUser").ToString();
        //    String phoneNumber = Request.Form.Get("phoneNumber").ToString();
        //    String address = Request.Form.Get("address").ToString();
        //    String sex = Request.Form.Get("sex").ToString();
        //    String dateOfBirth = Request.Form.Get("dateOfBirth").ToString();
        //    String account = Request.Form.Get("account").ToString();
        //    String password = Request.Form.Get("password").ToString();
        //    User newUser = new User(nameUser, phoneNumber, address, sex, dateOfBirth, account, password);
        //    return newUser;
        //}
        //protected void ClearInput()
        //{
        //    account.Style["borderColor"] = "#ccc";
        //    msgErrorAccount.Style["display"] = "none";
        //    nameUser.Value = null;
        //    phoneNumber.Value = null;
        //    address.Value = null;
        //    male.Checked = false;
        //    female.Checked = false;
        //    dateOfBirth.Value = null;
        //    account.Value = null;
        //    password.Value = null;
        //    reEnterPassword.Value = null;
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                List<UserExam> userList = (List<UserExam>)Application["userExamList"];
                bool isAccountExist = false;
                String nameUser = Request.Form.Get("nameUser").ToString();
                String dateOfBirth = Request.Form.Get("dateOfBirth").ToString();
                String likes = Request.Form.Get("like");
                if (userList.Count > 0)
                {
                    foreach (UserExam user in userList)
                    {
                        if (user.Name.CompareTo(nameUser) == 0)
                        {

                            //account.Style["borderColor"] = "#ff000";
                            //msgErrorAccount.InnerText = "Tài khoản " + accountName + " đã tồn tại, vui lòng nhập tên tài khoản khác";
                            //msgErrorAccount.Style["display"] = "inline-block";
                            isAccountExist = true;
                            break;
                        }
                    }

                    if (!isAccountExist)
                    {
                        String like = "";
                        foreach (var i in likes)
                        {
                            like += i.ToString();
                        }
                        UserExam userNew = new UserExam(nameUser, dateOfBirth, like);
                        userList.Add(userNew);
                        Application["userExamList"] = userList;
                        //Session["signUp"] = "signUpSuccess";
                        //ClearInput();
                        Response.Redirect("login-exam.aspx");
                    }
                }
                else //chưa có tài khoản nào được tạo.
                {
                    String like = "";
                    foreach (var i in likes)
                    {
                        like += i.ToString();
                    }
                    UserExam userNew = new UserExam(nameUser, dateOfBirth, like);
                    userList.Add(userNew);
                    Application["userExamList"] = userList;
                    //Session["signUp"] = "signUpSuccess";
                    //ClearInput();
                    Response.Redirect("login-exam.aspx");
                }
            }
        }
    }
}