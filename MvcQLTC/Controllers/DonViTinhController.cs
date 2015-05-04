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
    public class DonViTinhController : Controller
    {
        private QLTC_MVCEntities db = new QLTC_MVCEntities();

        //
        // GET: /DonViTinh/

        public ActionResult Index()
        {
            return View(db.DM_DVT.ToList());
        }

        //
        // GET: /DonViTinh/Details/5

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
        // GET: /DonViTinh/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /DonViTinh/Create

        [HttpPost]
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
        // GET: /DonViTinh/Edit/5

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
        // POST: /DonViTinh/Edit/5

        [HttpPost]
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
        // GET: /DonViTinh/Delete/5

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
        // POST: /DonViTinh/Delete/5

        [HttpPost, ActionName("Delete")]
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