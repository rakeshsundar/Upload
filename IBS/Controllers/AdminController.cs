using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcMySql.Models;
using System.IO;
using System.Data;
using System.Data.Entity;
using MvcMySql.Common;

namespace MvcMySql.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Ibs/

        private MyDbContext m_db = new MyDbContext();
        common_function cf = null;
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(admin_details admin)
        {
            var getd = m_db.admin_details.ToList();
            
            if(ModelState.IsValid)
            {
                var get = m_db.admin_details.Where(a => a.username == admin.username).Where(a => admin.password == admin.password).Where(a => a.m_status_id == 1).FirstOrDefault();
                if(get!=null)
                {
                    Session["UserID"] = get.id;
                    return RedirectToAction("PruductDetails","Admin");
                }
                else
                    ModelState.AddModelError("", "User Id and Password is incorrect");

            }
            return View(admin);
        }
        [HttpGet]
        public ActionResult PruductDetails(int?id)
        {
            var get = m_db.product_details.Where(a => a.id == id).FirstOrDefault();
            if(get!=null)
            {
                return View(get);
            }
            return View();
        }
        [HttpPost]
        public ActionResult PruductDetails(product_details ob_Product, HttpPostedFileBase product_image)
        { 
            if (ModelState.IsValid)
            {
                var path = "";
                if (product_image != null)
                {
                    
                    var fileName = "";

                    if ((product_image.ContentLength > 0))
                    {
                        fileName = DateTime.Now.ToString("ddMMyyyyhhmmss") + Path.GetFileName(product_image.FileName);
                        path = Path.Combine(Server.MapPath("~/Upload_Product"), fileName);
                        product_image.SaveAs(path);
                        path = Url.Content(Path.Combine("~/Upload_Product", fileName));
                    }
                    ob_Product.product_image = path;
                }
                else if(ob_Product.product_image!="" && ob_Product.product_image!=null)
                {
                     path=ob_Product.product_image;
                }
                else
                {
                    ModelState.AddModelError("", "Choose product image");
                    return View(ob_Product);
                }
                var get = m_db.product_details.Where(a => a.id == ob_Product.id).FirstOrDefault();
                if (get != null)
                {
                    get.m_service_type_id = ob_Product.m_service_type_id;
                    get.price = ob_Product.price;
                    get.product_description = ob_Product.product_description;
                    get.product_image = path;
                    get.product_name = ob_Product.product_name;
                    get.product_title = ob_Product.product_title;
                    m_db.Entry(get).State = EntityState.Modified;
                    m_db.SaveChanges();
                    return RedirectToAction("ViewProduct", "Admin");
                }
                else
                {
                    m_db.product_details.Add(ob_Product);
                    m_db.SaveChanges();
                }
                ViewData["Message"] = "Product Details is Saved Successfully";
                return RedirectToAction("PruductDetails", "Admin");
                
            }
            else
                 return View(ob_Product);
        }
        public ActionResult ViewProduct()
        {
            List<view_product_details> lst = new List<view_product_details>();

            var query = (from obj_product in m_db.product_details
                         join obj_service in m_db.service_type on obj_product.m_service_type_id equals obj_service.id
                         select new
                         {
                             obj_product = obj_product,
                             obj_service = obj_service
                         });
            foreach (var item in query)
            {
                view_product_details product = new view_product_details();
                product.id = Convert.ToInt32(item.obj_product.id);
                product.product_title = item.obj_product.product_title;
                product.product_name = item.obj_product.product_name;
                product.product_description = item.obj_product.product_description;
                product.product_image = item.obj_product.product_image;
                product.service_type = item.obj_service.service_name;
                product.price = item.obj_product.price;
                lst.Add(product);
            }
            return View(lst);
        }
        public ActionResult DeletePruduct(int id)
        {
            var get = m_db.product_details.Where(a => a.id == id).FirstOrDefault();
            if(get!=null)
            {
                m_db.product_details.Remove(get);
                m_db.SaveChanges();
            }
            return RedirectToAction("ViewProduct", "Admin");
        }
        public ActionResult ChangePassword()
        {
            return View();
        }
        public JsonResult UpdatePassword(string old, string newp)
        {
            string message = "0";
            var get = m_db.admin_details.Where(a => a.password == old).FirstOrDefault();
            if(get!=null)
            {
                get.password = newp;
                m_db.Entry(get).State = EntityState.Modified;
                m_db.SaveChanges();
                message = "1";
            }
            return Json(message,JsonRequestBehavior.AllowGet);
        }
        public ActionResult ViewContact()
        {
            var get = m_db.contact_us.OrderByDescending(m => m.id).ToList();
            return View(get);
        }
        public JsonResult SaveContactDetails( string name, string email, string mobile, string message)
        {
            string result = "Your request can not process!";
            contact_us contact = new contact_us();
            contact.name = name;
            contact.email = email;
            contact.mobile = mobile;
            contact.message = message;
            m_db.contact_us.Add(contact);
            contact.date_of_creation = DateTime.Now;
            m_db.SaveChanges();
            SendMail cf = new SendMail();
            string mail = "Dear " + name + ",<br/><br/>Thanks for writting to us.We will contact you as soon as possible.<br/><br/><br/> With Regards, <br/> Team IBS";
            string[] send_to = new string[] { email };
            string[] bcc_to = new string[] { "" };
            string subject = "Regarding IBS Query";
            byte[] bytes = null;
            result+= cf.send_mail(mail, send_to, bcc_to, subject, bytes, "");
            result = "Thanks for contacting us.";
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        #region Case Study
        public ActionResult AddCaseStudy(int?id)
        {
            cf = new common_function();
            ViewData["ServiceList"] = cf.GetServiceType();
            var Get = m_db.case_details.Where(a => a.id == id).Where(a=>a.m_status_id==1).FirstOrDefault();
            if(Get!=null)
            {
                return View(Get);
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddCaseStudy(case_details caseD, HttpPostedFileBase image, HttpPostedFileBase white_paper)
        {
            if (ModelState.IsValid)
            {
                var image_name = "";
                if (image != null)
                {
                    if ((image.ContentLength > 0))
                    {
                        image_name = "img_"+DateTime.Now.ToString("ddMMyyyyhhmmss") + Path.GetExtension(image.FileName);
                        string path = Path.Combine(Server.MapPath("~/Case-Images"), image_name);
                        image.SaveAs(path);
                    }
                    caseD.image = image_name;
                }
                else if (caseD.image != "" && caseD.image != null)
                {
                    image_name = caseD.image;
                }
                else
                {
                    cf = new common_function();
                    ViewData["ServiceList"] = cf.GetServiceType();
                    ModelState.AddModelError("", "Choose image");
                    return View(caseD);
                }
                var wp_name = "";
                if (white_paper != null)
                {
                    if ((white_paper.ContentLength > 0))
                    {
                        wp_name = "wp_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + Path.GetExtension(white_paper.FileName);
                        string path = Path.Combine(Server.MapPath("~/White-Papers"), wp_name);
                        white_paper.SaveAs(path);
                    }
                    caseD.white_paper = wp_name;
                }
                else if (caseD.white_paper != "" && caseD.white_paper != null)
                {
                    wp_name = caseD.white_paper;
                }
                else
                {
                    cf = new common_function();
                    ViewData["ServiceList"] = cf.GetServiceType();
                    ModelState.AddModelError("", "Choose white paper");
                    return View(caseD);
                }
                
                var Get = m_db.case_details.Where(a => a.id ==caseD.id).FirstOrDefault();
                if(Get!=null)
                {

                }
                else
                {
                    caseD.date_of_creation = DateTime.Now;
                    caseD.m_status_id = 1;
                    m_db.case_details.Add(caseD);
                    m_db.SaveChanges();
                }
                return RedirectToAction("AddCaseStudy/0", "Admin");
            }
            else
            {
                cf = new common_function();
                ViewData["ServiceList"] = cf.GetServiceType();
                return View(caseD);
            }
        }
        public ActionResult ViewCaseStudy()
        {
            List<View_case_details> lst = new List<View_case_details>();
            var CaseDetails =(from obj_case in m_db.case_details.Where(a => a.m_status_id == 1)
                              join obj_service in m_db.service_type on obj_case.m_service_type_id equals obj_service.id
                              select new
                              {
                                  obj_case = obj_case,
                                  obj_service=obj_service
                              }
                             ).ToList();
            foreach(var item in CaseDetails)
            {
                View_case_details cased = new View_case_details();
                cased.id = item.obj_case.id;
                cased.case_name = item.obj_case.case_name;
                cased.service_type = item.obj_service.service_name;
                cased.image = item.obj_case.image;
                cased.white_paper = item.obj_case.white_paper;
                lst.Add(cased);
            }
            return View(lst);
        }
        public ActionResult DeleteCaseStudy(int id)
        {
            var Get = m_db.case_details.Where(a => a.id == id).FirstOrDefault();
            if (Get != null)
            {
                Get.m_status_id = 0;
                m_db.Entry(Get).State = EntityState.Modified;
                m_db.SaveChanges();
            }
            return RedirectToAction("ViewCaseStudy", "Admin");
        }
        public ActionResult DownloadWPaper(int id)
        {
            var Get = m_db.case_details.Where(a => a.id == id).FirstOrDefault();
            if (Get != null)
            {
                var filepath = System.IO.Path.Combine(Server.MapPath("~/White-Papers"), Get.white_paper);
                return File(filepath, "multipart/form-data", Get.white_paper);
            }
            return RedirectToAction("ViewCaseStudy", "Admin");
           
           
        }
        #endregion
    }
}
