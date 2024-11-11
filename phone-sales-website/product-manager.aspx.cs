using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phone_sales_website
{
    public partial class product_manager : System.Web.UI.Page
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
            List<Product> productList = (List<Product>)Application["productList"];
            foreach (Product product in productList)
            {
                tbody.InnerHtml += $"<tr>" +
                    $"<td><img src=\"./assets/icon/icon-product-manager/remove-icon.svg\" class=\"removeIcon\" /></td>" +
                    $"<td><img src=\"./assets/icon/icon-product-manager/update-icon.svg\" class=\"updateIcon\" /></td>" +
                    $"<td><a href=\"/product-detail.aspx?productID={product.ProductID}\"><img src= \"./uploads/{product.ProductImage}\" alt=\"{product.ProductName}\" class=\"imgTable\"></a></td>" +
                    $"<td>{product.ProductID}</td>" +
                    $"<td>{product.ProductName}</td>" +
                    $"<td>{product.Manufacturer}</td>" +
                    $"<td>{product.Price}</td>" +
                    $"<td>{product.Quantity}</td>" +
                    $"<td>{product.OperatingSystem}</td>" +
                    $"<td>{product.Cpu}</td>" +
                    $"<td>{product.Color}</td>" +
                    $"<td>{product.ScreenSize} inch</td>" +
                    $"<td>{product.BatteryCapacity} mAh</td>" +
                    $"<td>{product.RamCapacity} GB</td>" +
                    $"<td>{product.MemoryCapacity} GB</td>" +
                    $"<td>{product.FrontCamera} MP</td>" +
                    $"<td>{product.MainCamera} MP</td>" +
                    $"<td>{product.DescProduct}</td>" +
                    $" </tr>";
            }
        }

        protected void ReplaceProduct(String productID, Product updatedProduct)
        {
            List<Product> productList = (List<Product>)Application["productList"];
            foreach (Product product in productList)
            {
                if (product.ProductID.CompareTo(productID) == 0)
                {
                    product.ProductImage = updatedProduct.ProductImage;
                    product.DescProduct = updatedProduct.DescProduct;
                    product.ProductName = updatedProduct.ProductName;
                    product.Manufacturer = updatedProduct.Manufacturer;
                    product.Price = updatedProduct.Price;
                    product.Quantity = updatedProduct.Quantity;
                    product.OperatingSystem = updatedProduct.OperatingSystem;
                    product.Cpu = updatedProduct.Cpu;
                    product.Color = updatedProduct.Color;
                    product.ScreenSize = updatedProduct.ScreenSize;
                    product.BatteryCapacity = updatedProduct.BatteryCapacity;
                    product.RamCapacity = updatedProduct.RamCapacity;
                    product.MemoryCapacity = updatedProduct.MemoryCapacity;
                    product.FrontCamera = updatedProduct.FrontCamera;
                    product.MainCamera = updatedProduct.MainCamera;
                    break;
                }
            }
            Application["productList"] = productList;
        }

        protected void RemoveProduct(String productID)
        {
            List<Product> productList = (List<Product>)Application["productList"];
            List<Product> productListRemove = new List<Product>();// Danh sách sản phẩm cần xóa

            foreach (Product product in productList)
            {
                if (product.ProductID.CompareTo(productID) == 0)
                {
                    productListRemove.Add(product);
                    break;
                }
            }
            foreach (Product product in productListRemove)
            {
                // Đường dẫn lưu file ảnh
                string savePath = Server.MapPath("~/uploads/" + product.ProductImage);

                // Xóa tệp khi đã lưu 
                if (File.Exists(savePath))
                {
                    File.Delete(savePath);
                }
                productList.Remove(product);
            }
            productListRemove.Clear();
            Application["productList"] = productList;
        }
        protected String SaveImgAndGetNameWhenPostBack()
        {
            var productImage = Request.Files.Get("productImage");
            String productImageName = "";
            if (productImage != null && productImage.ContentLength > 0)
            {
                // Lấy tên file ảnh
                productImageName = Path.GetFileName(productImage.FileName);
                // Đường dẫn lưu file ảnh
                string savePath = Server.MapPath("~/uploads/" + productImageName);

                // Kiểm tra và tạo thư mục nếu cần
                string directoryPath = Path.GetDirectoryName(savePath);
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }
                // Lưu file ảnh vào thư mục uploads
                productImage.SaveAs(savePath);// Gọi SaveAs trên đối tượng file
            }
            return productImageName;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayProductListOnTable();
            if (Session["account"] != null)
            {
                helloGuest.InnerHtml = "<p>Hello " + Session["account"] + "</b>,this is the product management page !</p>";
                CountNumberOfProductInCart();

            }
            else
            {
                helloGuest.InnerText = "Please login to manage products !";
            }
            if (Session["login"] != null)
            {
                statusServer.Value = Session["login"].ToString();
                Session["login"] = null;
            }
            if (Session["assecsProductManager"] != null)
            {
                assecsProductManager.Value = Session["assecsProductManager"].ToString();
            }
            if (Session["addUpdateRemoveStatus"] != null)
            {
                addUpdateRemoveStatus.Value = Session["addUpdateRemoveStatus"].ToString();
                Session["addUpdateRemoveStatus"] = null;
            }


            if (IsPostBack)
            {
                List<Product> productList = (List<Product>)Application["productList"];
                String productID = Request.Form.Get("productID").ToString();
                String productName = Request.Form.Get("productName").ToString();
                String manufacturer = Request.Form.Get("manufacturer").ToString();
                String operatingSystem = Request.Form.Get("operatingSystem").ToString();
                String cpu = Request.Form.Get("cpu").ToString();
                String color = Request.Form.Get("color").ToString();


                String productImageName = SaveImgAndGetNameWhenPostBack();

                String descProduct = Request.Form.Get("descProduct").ToString();
                int quantity = default;
                if (Request.Form.Get("quantity").ToString().Trim().CompareTo("") != 0)
                {
                    quantity = int.Parse(Request.Form.Get("quantity").ToString());
                }
                int batteryCapacity = default;
                if (Request.Form.Get("batteryCapacity").ToString().Trim().CompareTo("") != 0)
                {
                    batteryCapacity = int.Parse(Request.Form.Get("batteryCapacity").ToString());
                }
                int ramCapacity = default;
                if (Request.Form.Get("ramCapacity").ToString().Trim().CompareTo("") != 0)
                {
                    ramCapacity = int.Parse(Request.Form.Get("ramCapacity").ToString());
                }
                int memoryCapacity = default;
                if (Request.Form.Get("memoryCapacity").ToString().Trim().CompareTo("") != 0)
                {
                    memoryCapacity = int.Parse(Request.Form.Get("memoryCapacity").ToString());
                }
                double price = default;
                if (Request.Form.Get("price").ToString().Trim().CompareTo("") != 0)
                {
                    price = double.Parse(Request.Form.Get("price").ToString());
                }
                double screenSize = default;
                if (Request.Form.Get("screenSize").ToString().Trim().CompareTo("") != 0)
                {
                    screenSize = double.Parse(Request.Form.Get("screenSize").ToString());
                }
                double frontCamera = default;
                if (Request.Form.Get("frontCamera").ToString().Trim().CompareTo("") != 0)
                {
                    frontCamera = double.Parse(Request.Form.Get("frontCamera").ToString());
                }
                double mainCamera = default;
                if (Request.Form.Get("mainCamera").ToString().Trim().CompareTo("") != 0)
                {
                    mainCamera = double.Parse(Request.Form.Get("mainCamera").ToString());
                }

                string addUpdateRemoveStatus = Request.Form.Get("addUpdateRemoveStatus").ToString();



                if (addUpdateRemoveStatus.CompareTo("add") == 0)//Add
                {
                    bool isProductIDExist = false;
                    foreach (Product product in productList)
                    {
                        if (product.ProductID.CompareTo(productID) == 0)
                        {
                            isProductIDExist = true;
                            Session["addUpdateRemoveStatus"] = "addFailed";
                            break;
                        }
                    }
                    if (!isProductIDExist)
                    {
                        Product productNew = new Product(productID, productName, manufacturer, operatingSystem,
                        cpu, color, productImageName, descProduct, quantity, batteryCapacity, ramCapacity,
                        memoryCapacity, price, screenSize, frontCamera, mainCamera);
                        productList.Insert(0, productNew);
                        Application["productList"] = productList;
                        Session["addUpdateRemoveStatus"] = "addSuccess";
                    }
                    Response.Redirect("product-manager.aspx");

                }
                else if (addUpdateRemoveStatus.CompareTo("update") == 0)//Update
                {
                    //headingMain.InnerText = (Request.Files.Get("productImage") != null) + "";
                    if (Request.Files.Get("productImage") != null && Request.Files.Get("productImage").ContentLength > 0)//Trường hợp thay ảnh
                    {
                        Product updatedProduct = new Product(productID, productName, manufacturer, operatingSystem,
                            cpu, color, productImageName, descProduct, quantity, batteryCapacity, ramCapacity,
                            memoryCapacity, price, screenSize, frontCamera, mainCamera);
                        ReplaceProduct(productID, updatedProduct);
                        Session["addUpdateRemoveStatus"] = "updateSuccess";
                        Response.Redirect("product-manager.aspx");
                    }
                    else //Trường hợp không thay ảnh
                    {
                        productImageName = Request.Form.Get("nameImageProductWhenUpdate").ToString();
                        Product updatedProduct = new Product(productID, productName, manufacturer, operatingSystem,
                            cpu, color, productImageName, descProduct, quantity, batteryCapacity, ramCapacity,
                            memoryCapacity, price, screenSize, frontCamera, mainCamera);
                        ReplaceProduct(productID, updatedProduct);
                        Session["addUpdateRemoveStatus"] = "updateSuccess";
                        Response.Redirect("product-manager.aspx");
                    }
                }
                else if (addUpdateRemoveStatus.CompareTo("remove") == 0)
                {
                    String idProductWhenRemove = Request.Form.Get("idProductWhenRemove").ToString();
                    RemoveProduct(idProductWhenRemove);
                    Session["addUpdateRemoveStatus"] = "removeSuccess";
                    Response.Redirect("product-manager.aspx");
                }
            }
        }
    }
}