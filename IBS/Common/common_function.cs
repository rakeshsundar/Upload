using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Web.Script.Serialization;
using MvcMySql.Models;
using System.Net.Mail;
using System.Net.Mime;

namespace MvcMySql.Common
{
    public class common_function
    {

        private string GOOGLE_MAP_API = "https://maps.googleapis.com";
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        Dictionary<string, object> obj_result = null;
        List<SelectListItem> lst = null;
        SelectListItem SelectItem =null;
        private MyDbContext db = new MyDbContext();
        public common_function()
        {
            SelectItem = new SelectListItem();
            SelectItem.Text = "--Select--";
            SelectItem.Value = "";
        }
        public bool send_mail(string message, string to, string from, string from_password, string subject)
        {
            bool mail_reponse = false;
            try
            {
                if (to == null)
                    to = "";

                SmtpClient smtpClient = new SmtpClient();
                AlternateView avHtml = AlternateView.CreateAlternateViewFromString
                    (message, null, MediaTypeNames.Text.Html);


                //create the mail message
                MailMessage mail = new MailMessage();
                //set the FROM address
                mail.From = new MailAddress(from, "IBS");
                //set the RECIPIENTS

                if (to != "")
                    mail.To.Add(to);

                 mail.Bcc.Add("anil@softdew.co.in");

                // mail.Bcc.Add("anil@softdew.co.in");
                //enter a SUBJECT
                mail.Subject = subject;//"TAXO Query Mail For " + custom_job_id;
                //Enter the message BODY
                mail.AlternateViews.Add(avHtml);


                // mail.Body = "v";// "Enter text for the e-mail here.";
                //set the mail server (default should be auth.smtp.1and1.co.uk)
                //SmtpClient smtp = new SmtpClient("auth.smtp.1and1.co.uk");
                smtpClient.Host = "smtp.gmail.com"; // We use gmail as our smtp client
                smtpClient.Port = 587;
                

                smtpClient.EnableSsl = true;
                smtpClient.UseDefaultCredentials = true;
                //Enter your full e-mail address and password
                smtpClient.Credentials = new NetworkCredential(from, from_password);
                //smtpClient.Timeout = 3000;
                //send the message 
                smtpClient.Send(mail);
                mail_reponse = true;
            }
            catch (Exception ex)
            {
                mail_reponse = false;
            }

            return mail_reponse;

        }
        public List<SelectListItem> GetServiceType()
        {
            lst = new List<SelectListItem>();
            lst.Add(SelectItem);
            var get = db.service_type.Where(a=>a.status==1).ToList();
            foreach(var item in get)
            {
                lst.Add(new SelectListItem { Text=item.service_name,Value=item.id.ToString() });
            }
            return lst;
        }


    }


}