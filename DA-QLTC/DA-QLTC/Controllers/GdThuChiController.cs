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
    public class GdThuChiController : Controller
    {
        private QLTC_MVCEntities db = new QLTC_MVCEntities();

        //
        // GET: /GdThuChi/

        public ActionResult Index()
        {
            var gd_thu_chi = db.GD_THU_CHI.Include(g => g.DM_DVT).Include(g => g.DM_QUY).Include(g => g.DM_THU_CHI);
            return View(gd_thu_chi.ToList());
        }

        //
        // GET: /GdThuChi/Details/5

        public ActionResult Details(decimal id = 0)
        {
            GD_THU_CHI gd_thu_chi = db.GD_THU_CHI.Find(id);
            if (gd_thu_chi == null)
            {
                return HttpNotFound();
            }
            return View(gd_thu_chi);
        }

        //
        // GET: /GdThuChi/Create

        public ActionResult Create()
        {
            ViewBag.ID_DVT = new SelectList(db.DM_DVT, "ID", "TEN");
            ViewBag.ID_QUY = new SelectList(db.DM_QUY, "ID", "TEN");
            ViewBag.ID_THU_CHI = new SelectList(db.DM_THU_CHI, "ID", "TEN");
            return View();
        }

        //
        // POST: /GdThuChi/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GD_THU_CHI gd_thu_chi)
        {
            if (ModelState.IsValid)
            {
                db.GD_THU_CHI.Add(gd_thu_chi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_DVT = new SelectList(db.DM_DVT, "ID", "TEN", gd_thu_chi.ID_DVT);
            ViewBag.ID_QUY = new SelectList(db.DM_QUY, "ID", "TEN", gd_thu_chi.ID_QUY);
            ViewBag.ID_THU_CHI = new SelectList(db.DM_THU_CHI, "ID", "TEN", gd_thu_chi.ID_THU_CHI);
            return View(gd_thu_chi);
        }

        //
        // GET: /GdThuChi/Edit/5

        public ActionResult Edit(decimal id = 0)
        {
            GD_THU_CHI gd_thu_chi = db.GD_THU_CHI.Find(id);
            if (gd_thu_chi == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_DVT = new SelectList(db.DM_DVT, "ID", "TEN", gd_thu_chi.ID_DVT);
            ViewBag.ID_QUY = new SelectList(db.DM_QUY, "ID", "TEN", gd_thu_chi.ID_QUY);
            ViewBag.ID_THU_CHI = new SelectList(db.DM_THU_CHI, "ID", "TEN", gd_thu_chi.ID_THU_CHI);
            return View(gd_thu_chi);
        }

        //
        // POST: /GdThuChi/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(GD_THU_CHI gd_thu_chi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gd_thu_chi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_DVT = new SelectList(db.DM_DVT, "ID", "TEN", gd_thu_chi.ID_DVT);
            ViewBag.ID_QUY = new SelectList(db.DM_QUY, "ID", "TEN", gd_thu_chi.ID_QUY);
            ViewBag.ID_THU_CHI = new SelectList(db.DM_THU_CHI, "ID", "TEN", gd_thu_chi.ID_THU_CHI);
            return View(gd_thu_chi);
        }

        //
        // GET: /GdThuChi/Delete/5

        public ActionResult Delete(decimal id = 0)
        {
            GD_THU_CHI gd_thu_chi = db.GD_THU_CHI.Find(id);
            if (gd_thu_chi == null)
            {
                return HttpNotFound();
            }
            return View(gd_thu_chi);
        }

        //
        // POST: /GdThuChi/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(decimal id)
        {
            GD_THU_CHI gd_thu_chi = db.GD_THU_CHI.Find(id);
            db.GD_THU_CHI.Remove(gd_thu_chi);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}