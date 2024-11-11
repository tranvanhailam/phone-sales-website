using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace phone_sales_website
{
    public class Product
    {
        String productID, productName, manufacturer, operatingSystem, cpu, color, descProduct;
        int quantity, batteryCapacity, ramCapacity, memoryCapacity;
        double price, screenSize, frontCamera, mainCamera;
        String productImage;
        public Product()
        {
        }

        public Product(string productID, string productName, string manufacturer, string operatingSystem, string cpu, string color, String productImage, string descProduct, int quantity, int batteryCapacity, int ramCapacity, int memoryCapacity, double price, double screenSize, double frontCamera, double mainCamera)
        {
            this.ProductID = productID;
            this.ProductName = productName;
            this.Manufacturer = manufacturer;
            this.OperatingSystem = operatingSystem;
            this.Cpu = cpu;
            this.Color = color;
            this.ProductImage = productImage;
            this.DescProduct = descProduct;
            this.Quantity = quantity;
            this.BatteryCapacity = batteryCapacity;
            this.RamCapacity = ramCapacity;
            this.MemoryCapacity = memoryCapacity;
            this.Price = price;
            this.ScreenSize = screenSize;
            this.FrontCamera = frontCamera;
            this.MainCamera = mainCamera;
        }

        public string ProductID { get => productID; set => productID = value; }
        public string ProductName { get => productName; set => productName = value; }
        public string Manufacturer { get => manufacturer; set => manufacturer = value; }
        public string OperatingSystem { get => operatingSystem; set => operatingSystem = value; }
        public string Cpu { get => cpu; set => cpu = value; }
        public string Color { get => color; set => color = value; }
        public String ProductImage { get => productImage; set => productImage = value; }
        public string DescProduct { get => descProduct; set => descProduct = value; }
        public int Quantity { get => quantity; set => quantity = value; }
        public int BatteryCapacity { get => batteryCapacity; set => batteryCapacity = value; }
        public int RamCapacity { get => ramCapacity; set => ramCapacity = value; }
        public int MemoryCapacity { get => memoryCapacity; set => memoryCapacity = value; }
        public double Price { get => price; set => price = value; }
        public double ScreenSize { get => screenSize; set => screenSize = value; }
        public double FrontCamera { get => frontCamera; set => frontCamera = value; }
        public double MainCamera { get => mainCamera; set => mainCamera = value; }
    }
}