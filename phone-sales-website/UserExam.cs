using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace phone_sales_website
{
    public class UserExam
    {
        string name, dateOfBirth, like;

        public UserExam()
        {
        }

        public UserExam(string name, string dateOfBirth, string like)
        {
            this.Name = name;
            this.DateOfBirth = dateOfBirth;
            this.like = like;
        }

        public string Name { get => name; set => name = value; }
        public string DateOfBirth { get => dateOfBirth; set => dateOfBirth = value; }
        public string Like { get => like; set => like = value; }
    }
}