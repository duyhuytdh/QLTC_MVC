using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DA_QLTC.Models;

namespace DA_QLTC.Controllers
{
    public class BaoCaoController : Controller
    {
        private QLTC_MVCEntities db = new QLTC_MVCEntities();
        //
        // GET: /BaoCaoTongHop/

        public ActionResult BaoCaoLichSuGD()
        {
            var gd_thu_chi = db.GD_THU_CHI.Include(g => g.DM_DVT).Include(g => g.DM_QUY).Include(g => g.DM_THU_CHI);
            return View(gd_thu_chi.ToList());
        }

    }
}
