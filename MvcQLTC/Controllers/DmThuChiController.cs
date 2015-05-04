using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcQLTC.Models;

namespace MvcQLTC.Controllers
{
    public class DmThuChiController : Controller
    {
        private QLTC_MVCEntities db = new QLTC_MVCEntities();

        //
        // GET: /DmThuChi/

        public ActionResult Index()
        {
            var dm_thu_chi = db.DM_THU_CHI.Include(d => d.DM_TU_DIEN).Include(d => d.USER);
            return View(dm_thu_chi.ToList());
        }

        //
        // GET: /DmThuChi/Details/5

        public ActionResult Details(decimal id = 0)
        {
            DM_THU_CHI dm_thu_chi = db.DM_THU_CHI.Find(id);
            if (dm_thu_chi == null)
            {
                return HttpNotFound();
            }
            return View(dm_thu_chi);
        }

        //
        // GET: /DmThuChi/Create

        public ActionResult Create()
        {
            ViewBag.ID_LOAI = new SelectList(db.DM_TU_DIEN, "ID", "TEN");
            ViewBag.ID_USER = new SelectList(db.USERs, "ID", "USER_NAME");
            return View();
        }

        //
        // POST: /DmThuChi/Create

        [HttpPost]
        public ActionResult Create(DM_THU_CHI dm_thu_chi)
        {
            if (ModelState.IsValid)
            {
                db.DM_THU_CHI.Add(dm_thu_chi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_LOAI = new SelectList(db.DM_TU_DIEN, "ID", "TEN", dm_thu_chi.ID_LOAI);
            ViewBag.ID_USER = new SelectList(db.USERs, "ID", "USER_NAME", dm_thu_chi.ID_USER);
            return View(dm_thu_chi);
        }

        //
        // GET: /DmThuChi/Edit/5

        public ActionResult Edit(decimal id = 0)
        {
            DM_THU_CHI dm_thu_chi = db.DM_THU_CHI.Find(id);
            if (dm_thu_chi == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_LOAI = new SelectList(db.DM_TU_DIEN, "ID", "TEN", dm_thu_chi.ID_LOAI);
            ViewBag.ID_USER = new SelectList(db.USERs, "ID", "USER_NAME", dm_thu_chi.ID_USER);
            return View(dm_thu_chi);
        }

        //
        // POST: /DmThuChi/Edit/5

        [HttpPost]
        public ActionResult Edit(DM_THU_CHI dm_thu_chi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dm_thu_chi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_LOAI = new SelectList(db.DM_TU_DIEN, "ID", "TEN", dm_thu_chi.ID_LOAI);
            ViewBag.ID_USER = new SelectList(db.USERs, "ID", "USER_NAME", dm_thu_chi.ID_USER);
            return View(dm_thu_chi);
        }

        //
        // GET: /DmThuChi/Delete/5

        public ActionResult Delete(decimal id = 0)
        {
            DM_THU_CHI dm_thu_chi = db.DM_THU_CHI.Find(id);
            if (dm_thu_chi == null)
            {
                return HttpNotFound();
            }
            return View(dm_thu_chi);
        }

        //
        // POST: /DmThuChi/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(decimal id)
        {
            DM_THU_CHI dm_thu_chi = db.DM_THU_CHI.Find(id);
            db.DM_THU_CHI.Remove(dm_thu_chi);
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