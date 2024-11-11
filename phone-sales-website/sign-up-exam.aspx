﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign-up-exam.aspx.cs" Inherits="phone_sales_website.sign_up_exam" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0" />
    <title>Sign up | Cyber</title>
    <!--Reset CSS-->
    <link rel="stylesheet" href="./assets/css/reset.css" />
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer" />
    <!-- Font Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link
        rel="preconnect"
        href="https://fonts.gstatic.com"
        crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="./assets/css/sign-up-exam.css" />
</head>
<body>
    <form id="form" action="" method="post" autocomplete="off" runat="server">
        <div class="sign-up">
            <div class="content">
                <h1 class="heading">Sign up for an account</h1>
                <div class="form-item">
                    <label for="nameUser">Name</label>
                    <div class="form-item__body">
                        <div class="form-input">
                            <input
                                type="text"
                                name="nameUser"
                                id="nameUser"
                                placeholder="Enter name"
                                runat="server" />
                        </div>
                        <span
                            class="form-message"
                            id="msgErrorNameUser"
                            runat="server"></span>
                    </div>
                </div>
                <%--<div class="form-item">
                    <label for="phoneNumber">Phone number</label>
                    <div class="form-item__body">
                        <div class="form-input">
                            <input
                                type="text"
                                name="phoneNumber"
                                id="phoneNumber"
                                placeholder="Enter phone number"
                                runat="server" />
                        </div>
                        <span
                            class="form-message"
                            id="msgErrorPhoneNumber"
                            runat="server"></span>
                    </div>
                </div>
                <div class="form-item">
                    <label for="address">Address</label>
                    <div class="form-item__body">
                        <div class="form-input">
                            <input
                                type="text"
                                name="address"
                                id="address"
                                placeholder="Enter address"
                                runat="server" />
                        </div>
                        <span
                            class="form-message"
                            id="msgErrorAddress"
                            runat="server"></span>
                    </div>
                </div>--%>
                <%--<div class="form-item">
                    <label for="sex">Sex</label>
                    <div class="form-item__body">
                        <div class="form-input">
                            <div class="radio-item">
                                <input
                                    type="radio"
                                    name="sex"
                                    value="male"
                                    id="male"
                                    runat="server" />
                                <label for="male">Male</label>
                            </div>
                            <div class="radio-item">
                                <input
                                    type="radio"
                                    name="sex"
                                    value="female"
                                    id="female"
                                    runat="server" />
                                <label for="female">Female</label>
                            </div>
                        </div>
                        <span
                            class="form-message"
                            id="msgErrorSex"
                            runat="server"></span>
                    </div>
                </div>--%>
                <div class="form-item">
                    <label for="dateOfBirth">Date of birth</label>
                    <div class="form-item__body">
                        <div class="form-input">
                            <input
                                type="date"
                                name="dateOfBirth"
                                id="dateOfBirth"
                                runat="server" />
                        </div>
                        <span
                            class="form-message"
                            id="msgErrorDateOfBirth"
                            runat="server"></span>
                    </div>
                </div>
                <%--<div class="form-item">
                    <label for="account">Account</label>
                    <div class="form-item__body">
                        <div class="form-input">
                            <input
                                type="text"
                                name="account"
                                id="account"
                                placeholder="Enter account"
                                runat="server" />
                        </div>
                        <span
                            class="form-message"
                            id="msgErrorAccount"
                            runat="server"></span>
                    </div>
                </div>
                <div class="form-item">
                    <label for="password">Password</label>
                    <div class="form-item__body">
                        <div class="form-input">
                            <input
                                type="password"
                                name="password"
                                id="password"
                                placeholder="Enter password"
                                runat="server" />
                        </div>
                        <span
                            class="form-message"
                            id="msgErrorPassword"
                            runat="server"></span>
                    </div>
                </div>
                <div class="form-item">
                    <label for="reEnterPassword">
                        Re-enter password</label>
                    <div class="form-item__body">
                        <div class="form-input">
                            <input
                                type="password"
                                name="reEnterPassword"
                                id="reEnterPassword"
                                placeholder="Re-enter password"
                                runat="server" />
                        </div>
                        <span
                            class="form-message"
                            id="msgErrorReEnterPassword"
                            runat="server"></span>
                    </div>
                </div>--%>
                <div class="form-item">
                    <label for="className">Like</label>
                    <div class="form-item__body">
                        <div class="form-input">
                            <input type="checkbox" name="like" value="Bong da" class="checkbox-like" />Bong da
                            <input type="checkbox" name="like" value="Co vua" class="checkbox-like" />Co vua
                            <input type="checkbox" name="like" value="Bong ro" class="checkbox-like" />Bong ro
                            <input type="checkbox" name="like" value="Bong ban" class="checkbox-like" />Bong ban
                            <input type="checkbox" name="like" value="Bong chuyen" class="checkbox-like" />Bong chuyen
                        </div>
                        <span
                            class="form-message"
                            id="className"
                            runat="server"></span>
                    </div>
                </div>
                <div class="form-submit">
                    <button
                        type="submit"
                        class="btn-sign-up"
                        id="submitBtn">
                        Sign up
                    </button>
                </div>

                <div class="login">
                    <span>Have an account?</span>
                    <a href="./login-exam.aspx">Login</a>
                </div>
            </div>
        </div>
    </form>
    <script src="assets/js/sign-up-exam.js"></script>
</body>
</html>
</html>
