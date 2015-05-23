using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DA_QLTC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Hệ thống quản lý tài chính cá nhân";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Liên hệ";

            return View();
        }
    }
}
