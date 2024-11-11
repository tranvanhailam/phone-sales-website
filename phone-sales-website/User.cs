using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace phone_sales_website
{
    public class User
    {
        string name, phoneNumber, address, sex, dateOfBirth, account, password;

        public User()
        {
        }

        public User(string name, string phoneNumber, string address, string sex, string dateOfBirth, string account, string password)
        {
            this.name = name;
            this.phoneNumber = phoneNumber;
            this.address = address;
            this.sex = sex;
            this.dateOfBirth = dateOfBirth;
            this.account = account;
            this.password = password;
        }

        public string Name { get => name; set => name = value; }
        public string PhoneNumber { get => phoneNumber; set => phoneNumber = value; }
        public string Address { get => address; set => address = value; }
        public string Sex { get => sex; set => sex = value; }
        public string DateOfBirth { get => dateOfBirth; set => dateOfBirth = value; }
        public string Account { get => account; set => account = value; }
        public string Password { get => password; set => password = value; }
    }
}