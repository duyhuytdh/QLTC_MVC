using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DA_QLTC.Models;
using DA_QLTC.App_Start;
using System.Globalization;

namespace DA_QLTC.Controllers
{
    [Authorize]
    public class GdThuChiController : Controller
    {
        private QLTC_MVCEntities db = new QLTC_MVCEntities();
        decimal money_before_edit;
        //dinh dang ngay thang theo dd/MM/yyyy
        IFormatProvider culture = new System.Globalization.CultureInfo("fr-FR", true);
        public class LoaiGD
        {
            public const decimal Thu = 1;
            public const decimal Chi = 2;
        }
        //
        // GET: /GdThuChi/
        public ActionResult Index()
        {
            UserControl user_control = new UserControl();
            decimal id_user = user_control.get_id_user();
            var gd_thu_chi = db.GD_THU_CHI.Where(g=>g.DM_THU_CHI.ID_USER==id_user).Include(g => g.DM_DVT).Include(g => g.DM_QUY).Include(g => g.DM_THU_CHI);

            return View(gd_thu_chi.ToList());
        }

        //
        // GET: /GdThuChi/Details/5

        public ActionResult Details(decimal id = 0)
        {
            GD_THU_CHI gd_thu_chi = db.GD_THU_CHI.Find(id);
            string Data_format = Convert.ToDateTime(gd_thu_chi.THOI_GIAN).ToString("dd/MM/yyyy"
                                                  , culture);
            ViewData["txt_ngay"] = Data_format;
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
        public ActionResult Create(GD_THU_CHI gd_thu_chi)
        {
            if (ModelState.IsValid)
            {
                string strNgay = Request["txt_ngay"].ToString();
                DateTime dat_ngay = DateTime.Parse(strNgay, culture, System.Globalization.DateTimeStyles.AssumeLocal);
                gd_thu_chi.THOI_GIAN = dat_ngay;

                db.GD_THU_CHI.Add(gd_thu_chi);
                update_tien_quy(gd_thu_chi, "Create");
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
            money_before_edit = gd_thu_chi.SO_TIEN;

            string Data_format = Convert.ToDateTime(gd_thu_chi.THOI_GIAN).ToString("dd/MM/yyyy"
                                                  ,culture);
            ViewData["txt_ngay"] = Data_format;
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
        public ActionResult Edit(GD_THU_CHI gd_thu_chi)
        {
            if (ModelState.IsValid)
            {
                string strNgay = Request["txt_ngay"].ToString();
                DateTime dat_ngay = DateTime.Parse(strNgay, culture, System.Globalization.DateTimeStyles.AssumeLocal);
                gd_thu_chi.THOI_GIAN = dat_ngay;
                db.Entry(gd_thu_chi).State = EntityState.Modified;
                update_tien_quy(gd_thu_chi, "Edit");
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
            string Data_format = Convert.ToDateTime(gd_thu_chi.THOI_GIAN).ToString("dd/MM/yyyy"
                                               , culture);
            ViewData["txt_ngay"] = Data_format;
            if (gd_thu_chi == null)
            {
                return HttpNotFound();
            }
            return View(gd_thu_chi);
        }

        //
        // POST: /GdThuChi/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(decimal id)
        {
            GD_THU_CHI gd_thu_chi = db.GD_THU_CHI.Find(id);
            db.GD_THU_CHI.Remove(gd_thu_chi);
            update_tien_quy(gd_thu_chi, "Delete");
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        private void update_tien_quy(GD_THU_CHI gd_thu_chi, string trang_thai)
        {
                    DM_QUY dm_quy = db.DM_QUY.Find(gd_thu_chi.ID_QUY);
                    DM_THU_CHI dm_thu_chi = db.DM_THU_CHI.Find(gd_thu_chi.ID_THU_CHI);
                    //log lai so tien ban dau
                    dm_quy.LOG_SO_TIEN = dm_quy.SO_TIEN;
                    //xet xem loai id la thu them + them, nguoc lai la chi thi - di.
                    if (trang_thai == "Create")
                    {
                        if (dm_thu_chi.ID_LOAI== 1)
                        {
                            dm_quy.SO_TIEN = dm_quy.SO_TIEN + gd_thu_chi.SO_TIEN;
                        }
                        else if (dm_thu_chi.ID_LOAI == LoaiGD.Chi)
                        {
                            dm_quy.SO_TIEN = dm_quy.SO_TIEN - gd_thu_chi.SO_TIEN;
                        }
                    }
                    if (trang_thai == "Edit")
                    {
                        if (dm_thu_chi.ID_LOAI == LoaiGD.Thu)
                        {
                            dm_quy.SO_TIEN = dm_quy.SO_TIEN + gd_thu_chi.SO_TIEN - money_before_edit;
                        }
                        else if (dm_thu_chi.ID_LOAI == LoaiGD.Chi)
                        {
                            dm_quy.SO_TIEN = dm_quy.SO_TIEN - gd_thu_chi.SO_TIEN + money_before_edit;
                        }
                    }
                    if (trang_thai == "Delete")
                    {
                        if (dm_thu_chi.ID_LOAI == LoaiGD.Thu)
                        {
                            dm_quy.SO_TIEN = dm_quy.SO_TIEN - gd_thu_chi.SO_TIEN;
                        }
                        else if (dm_thu_chi.ID_LOAI == LoaiGD.Chi)
                        {
                            dm_quy.SO_TIEN = dm_quy.SO_TIEN + gd_thu_chi.SO_TIEN;
                        }
                    }
                    //db.DM_QUY.Add(dm_quy);
                    db.Entry(dm_quy).State = EntityState.Modified;
                    //db.SaveChanges();
            }
            protected override void Dispose(bool disposing)
            {
                db.Dispose();
                base.Dispose(disposing);
            }
    }
}