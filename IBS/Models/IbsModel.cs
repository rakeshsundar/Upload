using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcMySql.Models
{
    public class product_details
    {
        public int? id { get; set; }
        [Required(ErrorMessage = "Select service type!")]
        public int m_service_type_id { get; set; }
        [Required(ErrorMessage = "Enter product name!")]
        public string product_name { get; set; }
         [Required(ErrorMessage = "Enter product title!")]
        public string product_title { get; set; }
        [AllowHtml]
        [Required(ErrorMessage = "Enter product descrption!")]
        public string product_description { get; set; }
        public string product_image { get; set; }
        [Required(ErrorMessage = "Enter product price!")]
        public string price { get; set; }
        public short status { get; set; }
    }
    public class view_product_details
    {
        public int id { get; set; }
        public string service_type { get; set; }
        public string product_title { get; set; }
        public string product_name { get; set; }
        public string product_description { get; set; }
        public string product_image { get; set; }
        public string price { get; set; }
        public short status { get; set; }
    }
    public class contact_us
    {
        public int id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string mobile { get; set; }
        public string message { get; set; }
        public DateTime date_of_creation { get; set; }
    }
    public class admin_details
    {
        public int? id { get; set; }
        public string name { get; set; }
        [Required(ErrorMessage = "Enter User Name.")]
        public string username { get; set; }
        [Required(ErrorMessage = "Enter Password.")]
        public string password { get; set; }
        public int? m_status_id { get; set; }
    }
    public class service_type
    {
        public int id { get; set; }
        public string service_name { get; set; }
        public short status { get; set; }
    }
    public class case_details
    {
        public int? id { get; set; }
        [Required(ErrorMessage = "Select service type.")]
        public short m_service_type_id { get; set; }
        [Required(ErrorMessage = "Enter company name.")]
        public string company_name { get; set; }
        [Required(ErrorMessage = "Enter case name.")]
        public string case_name { get; set; }
        [AllowHtml]
        [Required(ErrorMessage = "Enter case descrption.")]
        public string description { get; set; }
        public string image { get; set; }
        public string white_paper { get; set; }
        [Required(ErrorMessage = "Enter product price.")]
        public short m_status_id { get; set; }
        public DateTime? date_of_creation { get; set; }
    }
    public class View_case_details
    {
        public int? id { get; set; }
        public string service_type { get; set; }
        public string company_name { get; set; }
        public string case_name { get; set; }
        public string description { get; set; }
        public string image { get; set; }
        public string white_paper { get; set; }
        public short m_status_id { get; set; }
        public DateTime? date_of_creation { get; set; }
    }
}