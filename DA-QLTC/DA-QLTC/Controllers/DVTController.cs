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
    public class DVTController : Controller
    {
        private QLTC_MVCEntities db = new QLTC_MVCEntities();

        //
        // GET: /DVT/

        public ActionResult Index()
        {
            return View(db.DM_DVT.ToList());
        }

        //
        // GET: /DVT/Details/5

        public ActionResult Details(decimal id = 0)
        {
            DM_DVT dm_dvt = db.DM_DVT.Find(id);
            if (dm_dvt == null)
            {
                return HttpNotFound();
            }
            return View(dm_dvt);
        }

        //
        // GET: /DVT/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /DVT/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DM_DVT dm_dvt)
        {
            if (ModelState.IsValid)
            {
                db.DM_DVT.Add(dm_dvt);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(dm_dvt);
        }

        //
        // GET: /DVT/Edit/5

        public ActionResult Edit(decimal id = 0)
        {
            DM_DVT dm_dvt = db.DM_DVT.Find(id);
            if (dm_dvt == null)
            {
                return HttpNotFound();
            }
            return View(dm_dvt);
        }

        //
        // POST: /DVT/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DM_DVT dm_dvt)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dm_dvt).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(dm_dvt);
        }

        //
        // GET: /DVT/Delete/5

        public ActionResult Delete(decimal id = 0)
        {
            DM_DVT dm_dvt = db.DM_DVT.Find(id);
            if (dm_dvt == null)
            {
                return HttpNotFound();
            }
            return View(dm_dvt);
        }

        //
        // POST: /DVT/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(decimal id)
        {
            DM_DVT dm_dvt = db.DM_DVT.Find(id);
            db.DM_DVT.Remove(dm_dvt);
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