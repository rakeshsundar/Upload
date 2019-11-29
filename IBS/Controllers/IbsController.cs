using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcMySql.Models;
using MySql.Data;
namespace MvcMySql.Controllers
{
    public class IbsController : Controller
    {
        //
        // GET: /Ibs/

        private MyDbContext m_db = new MyDbContext();
        public ActionResult Index()
        {
            string myconnStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbContextConnectionString"].ConnectionString;
            MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection();
            conn.Open();
                return View();
        }

        public ActionResult Application()
        {
            var application = m_db.product_details.Where(a => a.m_service_type_id == 1).ToList();
            return View(application);
        }

        public JsonResult getProductdata(int? id)
        {
            var get_details = m_db.product_details.Where(a => a.id == id).FirstOrDefault();
            return new JsonResult { Data = get_details, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }



        public ActionResult Hardware()
        {
            return View(m_db.product_details.Where(a => a.m_service_type_id == 2).ToList());
        }


        public ActionResult Service()
        {
            return View(m_db.product_details.Where(a => a.m_service_type_id == 3).ToList());
        }


        public ActionResult Wireless()
        {
            return View(m_db.product_details.Where(a => a.m_service_type_id == 4).ToList());
        }

    }
}
