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
    public class QuyController : Controller
    {
        private QLTC_MVCEntities db = new QLTC_MVCEntities();

        //
        // GET: /Default1/

        public ActionResult Index()
        {
            var dm_quy = db.DM_QUY.Include(d => d.DM_DVT).Include(d => d.USER);
            return View(dm_quy.ToList());
        }

        //
        // GET: /Default1/Details/5

        public ActionResult Details(decimal id = 0)
        {
            DM_QUY dm_quy = db.DM_QUY.Find(id);
            if (dm_quy == null)
            {
                return HttpNotFound();
            }
            return View(dm_quy);
        }

        //
        // GET: /Default1/Create

        public ActionResult Create()
        {
            ViewBag.ID_DVT = new SelectList(db.DM_DVT, "ID", "TEN");
            ViewBag.ID_USER = new SelectList(db.USERs, "ID", "USER_NAME");
            return View();
        }

        //
        // POST: /Default1/Create

        [HttpPost]
        public ActionResult Create(DM_QUY dm_quy)
        {
            if (ModelState.IsValid)
            {
                db.DM_QUY.Add(dm_quy);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_DVT = new SelectList(db.DM_DVT, "ID", "TEN", dm_quy.ID_DVT);
            ViewBag.ID_USER = new SelectList(db.USERs, "ID", "USER_NAME", dm_quy.ID_USER);
            return View(dm_quy);
        }

        //
        // GET: /Default1/Edit/5

        public ActionResult Edit(decimal id = 0)
        {
            DM_QUY dm_quy = db.DM_QUY.Find(id);
            if (dm_quy == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_DVT = new SelectList(db.DM_DVT, "ID", "TEN", dm_quy.ID_DVT);
            ViewBag.ID_USER = new SelectList(db.USERs, "ID", "USER_NAME", dm_quy.ID_USER);
            return View(dm_quy);
        }

        //
        // POST: /Default1/Edit/5

        [HttpPost]
        public ActionResult Edit(DM_QUY dm_quy)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dm_quy).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_DVT = new SelectList(db.DM_DVT, "ID", "TEN", dm_quy.ID_DVT);
            ViewBag.ID_USER = new SelectList(db.USERs, "ID", "USER_NAME", dm_quy.ID_USER);
            return View(dm_quy);
        }

        //
        // GET: /Default1/Delete/5

        public ActionResult Delete(decimal id = 0)
        {
            DM_QUY dm_quy = db.DM_QUY.Find(id);
            if (dm_quy == null)
            {
                return HttpNotFound();
            }
            return View(dm_quy);
        }

        //
        // POST: /Default1/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(decimal id)
        {
            DM_QUY dm_quy = db.DM_QUY.Find(id);
            db.DM_QUY.Remove(dm_quy);
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