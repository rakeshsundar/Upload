using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;

namespace MvcMySql.Controllers
{
    public class SendMail
    {
        public string send_mail(string message, string[] to, string[] bcc, string subject, byte[] bt_attachment, string attachment_name)
        {


                string isSend = "Email Send";
                try
                {
                    string from = "naresh@softdew.co.in";
                    string from_password = "anil1234";
                    string str_body = message;
                    SmtpClient smtpClient = new SmtpClient();
                    AlternateView avHtml = AlternateView.CreateAlternateViewFromString
                        (str_body, null, MediaTypeNames.Text.Html);


                    //create the mail message
                    MailMessage mail = new MailMessage();
                    //set the FROM address
                    mail.From = new MailAddress(from, "IBS");
                    //set the RECIPIENTS
                    for (int i = 0; i < to.Length; i++)
                    {
                        if (to[i] == "")
                            continue;
                        else if (to[i] == null)
                            continue;

                        mail.To.Add(to[i]);
                    }
                    mail.Bcc.Add("baghel3349@gmail.com");
                    //enter a SUBJECT 
                    mail.Subject = subject;//"TAXO Query Mail For " + custom_job_id;
                    //Enter the message BODY
                    mail.AlternateViews.Add(avHtml);


                    // mail.Body = "v";// "Enter text for the e-mail here.";
                    //set the mail server (default should be auth.smtp.1and1.co.uk)
                    //SmtpClient smtp = new SmtpClient("auth.smtp.1and1.co.uk");
                    //smtpClient.Host = "smtp.gmail.com"; // We use gmail as our smtp client
                    //smtpClient.Port = 587;
                    smtpClient.Host = "relay-hosting.secureserver.net";
                    smtpClient.Port = 25;

                    smtpClient.EnableSsl = false;
                    smtpClient.UseDefaultCredentials = true;
                    //Enter your full e-mail address and password
                    //smtpClient.Credentials = new NetworkCredential(from, from_password);
                    smtpClient.Credentials = new NetworkCredential(from, from_password);
                    //smtpClient.Timeout = 3000;
                    //send the message 
                    smtpClient.Send(mail);

                    

                }
                catch (Exception ex)
                {
                    isSend = ex.ToString();
                }

            return isSend;

        }
    }
}