using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DA_QLTC.Models;
using DA_QLTC.App_Start;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI;
using System.Data.SqlClient;

namespace DA_QLTC.Controllers
{
    [Authorize]
    public class BaoCaoController : Controller
    {
        //
        // GET: /BaoCaoTongHop/

        #region Data structure
        public class BCQuy
        {
            public string TEN_QUY;
            public decimal TONG_THU;
            public decimal TONG_CHI;
            public decimal TONG_QUY;
        }
        public class ten_cbo_quy
        {
            public string TEN_QUY;
            public decimal ID_QUY;
        }
        public class ten_danh_muc
        {
            public string TEN_DANH_MUC;
            public decimal ID_DANH_MUC;
        }
        #endregion

        #region Data Member
        List<string> list_ten_quy;
        List<GD_THU_CHI> list_thu_chi;
        List<BCQuy> list_bc_quy;
        List<ten_cbo_quy> list_cbo_quy;
        List<ten_danh_muc> list_cbo_danh_muc;
        DA_QLTC.App_Start.UserControl user_control = new DA_QLTC.App_Start.UserControl();
        private QLTC_MVCEntities db = new QLTC_MVCEntities();
        IFormatProvider culture = new System.Globalization.CultureInfo("fr-FR", true);
        #endregion

        #region ActionResult
        public ActionResult BaoCaoLichSuGD()
        {
            decimal v_id_user = user_control.get_id_user();
            list_thu_chi = db.GD_THU_CHI.Where(x => x.DM_THU_CHI.ID_USER == v_id_user)
                                          .Include(g => g.DM_DVT)
                                          .Include(g => g.DM_QUY)
                                          .Include(g => g.DM_THU_CHI)
                                          .ToList();

            load_cbo_loai();
            load_cbo_quy();
            load_cbo_danh_muc();

                //DateTime datTuNgay = Convert.ToDateTime(Request["txt_tu_ngay"].ToString(), culture);
                //DateTime datDenNgay = Convert.ToDateTime(Request["txt_den_ngay"].ToString(), culture);
                //decimal IdLoai = Convert.ToDecimal(Request["cbo_loai"].ToString());
                //decimal IdQuy = Convert.ToDecimal(Request["cbo_quy"].ToString());
                //decimal IdDanhMuc = Convert.ToDecimal(Request["cbo_danh_muc"].ToString());
                //list_thu_chi.Where(x => x.THOI_GIAN >= datTuNgay
                //                 && x.THOI_GIAN <= datDenNgay
                //                 && (x.ID_QUY == IdQuy || IdQuy == -1)
                //                 && (x.ID_THU_CHI == IdDanhMuc || IdDanhMuc == -1)
                //                 && (x.DM_THU_CHI.ID_LOAI == IdLoai || IdLoai == -1)).ToList();
           

            return View(list_thu_chi.ToList());

        }

        public ActionResult BaoCaoTheoQuy()
        {
            decimal v_id_user = user_control.get_id_user();
            list_ten_quy = db.DM_QUY.Where(x => x.ID_USER == v_id_user).Select(x=>x.TEN).ToList();
            list_thu_chi= db.GD_THU_CHI.Include(g => g.DM_DVT).Include(g => g.DM_QUY).Include(g => g.DM_THU_CHI).ToList();
            //ViewBag.list_quy = list_quy;
            //ViewBag.list_thu_chi = list_thu_chi;
           
            list_bc_quy = new List<BCQuy>();
            foreach (var ten_quy in list_ten_quy)
            {
                BCQuy i_bc_quy = new BCQuy();
                i_bc_quy.TEN_QUY = ten_quy;
                i_bc_quy.TONG_THU = list_thu_chi.Where(x => x.DM_QUY.TEN == ten_quy 
                                                         && x.DM_THU_CHI.DM_TU_DIEN.TEN == "Thu nhập")
                                                .Select(x => x.SO_TIEN).Sum();
                i_bc_quy.TONG_CHI = list_thu_chi.Where(x => x.DM_QUY.TEN == ten_quy
                                                       && x.DM_THU_CHI.DM_TU_DIEN.TEN == "Chi tiêu")
                                              .Select(x => x.SO_TIEN).Sum();
                i_bc_quy.TONG_QUY = list_thu_chi.Where(x => x.DM_QUY.TEN == ten_quy).Select(x => x.DM_QUY.SO_TIEN).Sum();
                list_bc_quy.Add(i_bc_quy);
            }
            //tinh tong
            BCQuy i_bc_quy_tong = new BCQuy();
            i_bc_quy_tong.TEN_QUY = "Tổng";
            i_bc_quy_tong.TONG_THU = list_thu_chi.Where(x => x.DM_THU_CHI.DM_TU_DIEN.TEN == "Thu nhập")
                                            .Select(x => x.SO_TIEN).Sum();
            i_bc_quy_tong.TONG_CHI = list_thu_chi.Where(x => x.DM_THU_CHI.DM_TU_DIEN.TEN == "Chi tiêu")
                                           .Select(x => x.SO_TIEN).Sum();
            i_bc_quy_tong.TONG_QUY = list_thu_chi.Where(x => x.DM_QUY.ID_USER == v_id_user).Select(x => x.DM_QUY.SO_TIEN).Sum();
            list_bc_quy.Add(i_bc_quy_tong);
            ViewBag.list_bc = list_bc_quy;
            return View(list_bc_quy);
        }

        public ActionResult ExportData(string command)
        {
            if (command == "Xuất Excel")
            {
                decimal v_id_user = user_control.get_id_user();
                DateTime datTuNgay = Convert.ToDateTime(Request["txt_tu_ngay"].ToString(), culture);
                DateTime datDenNgay = Convert.ToDateTime(Request["txt_den_ngay"].ToString(), culture);
                decimal IdLoai = Convert.ToDecimal(Request["cbo_loai"].ToString());
                decimal IdQuy = Convert.ToDecimal(Request["cbo_quy"].ToString());
                decimal IdDanhMuc = Convert.ToDecimal(Request["cbo_danh_muc"].ToString());

                var affectedRows = db.Database.ExecuteSqlCommand("exec bc_lich_su_gd @id_user, @tu_ngay, @den_ngay, @id_loai_giao_dich, @id_quy_gd, @id_dm_thu_chi",
                                                                    new SqlParameter("@id_user", v_id_user)
                                                                    , new SqlParameter("@tu_ngay", datTuNgay)
                                                                    , new SqlParameter("@den_ngay", datDenNgay)
                                                                    , new SqlParameter("@id_loai_giao_dich", IdLoai)
                                                                    , new SqlParameter("@id_quy_gd", IdQuy)
                                                                    , new SqlParameter("@id_dm_thu_chi", IdDanhMuc)
                                                                    );
                GridView gv = new GridView();
                gv.DataSource = db.RPT_BAO_CAO_LICH_SU_GD.ToList();
                gv.DataBind();
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment; filename=Marklist.xlsx");
                Response.ContentType = "application/ms-excel";
                Response.Charset = "";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                gv.RenderControl(htw);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();

                return RedirectToAction("BaoCao");
            }
            else if (command == "Lọc dữ liệu")
            {
                decimal v_id_user = user_control.get_id_user();
                list_thu_chi = db.GD_THU_CHI.Where(x => x.DM_THU_CHI.ID_USER == v_id_user)
                                              .Include(g => g.DM_DVT)
                                              .Include(g => g.DM_QUY)
                                              .Include(g => g.DM_THU_CHI)
                                              .ToList();
                DateTime datTuNgay = Convert.ToDateTime(Request["txt_tu_ngay"].ToString(), culture);
                DateTime datDenNgay = Convert.ToDateTime(Request["txt_den_ngay"].ToString(), culture);
                decimal IdLoai = Convert.ToDecimal(Request["cbo_loai"].ToString());
                decimal IdQuy = Convert.ToDecimal(Request["cbo_quy"].ToString());
                decimal IdDanhMuc = Convert.ToDecimal(Request["cbo_danh_muc"].ToString());
                list_thu_chi.Where(x => x.THOI_GIAN >= datTuNgay
                                 && x.THOI_GIAN <= datDenNgay
                                 && (x.ID_QUY == IdQuy || IdQuy == -1)
                                 && (x.ID_THU_CHI == IdDanhMuc || IdDanhMuc == -1)
                                 && (x.DM_THU_CHI.ID_LOAI == IdLoai || IdLoai == -1)).ToList();

                return RedirectToAction("BaoCaoLichSuGD");
            }
            else
            {
                return RedirectToAction("BaoCaoLichSuGD");
            }
        }
 
        #endregion

        #region Private Method
        private void load_cbo_loai()
        {
            List<SelectListItem> cbo_loai = new List<SelectListItem>();
            cbo_loai.Add(new SelectListItem { Text = "--Tất cả--", Value = "-1", Selected = true });
            cbo_loai.Add(new SelectListItem { Text = "Thu nhập", Value = "1"});
            cbo_loai.Add(new SelectListItem { Text = "Chi tiêu", Value = "2"});
            ViewData["cbo_loai"] = cbo_loai;
        }
        private void load_cbo_danh_muc()
        {
            //load cbo danh muc
            decimal v_id_user = user_control.get_id_user();
            list_cbo_danh_muc = db.DM_THU_CHI.Where(x => x.ID_USER == v_id_user).Select(x => new ten_danh_muc { TEN_DANH_MUC = x.TEN, ID_DANH_MUC = x.ID }).ToList();
            List<SelectListItem> cbo_danh_muc = new List<SelectListItem>();
            for (int i = 0; i < list_cbo_danh_muc.Count; i++)
            {
                cbo_danh_muc.Add(new SelectListItem { Text = list_cbo_danh_muc[i].TEN_DANH_MUC, Value = list_cbo_danh_muc[i].ID_DANH_MUC.ToString() });
            }
            cbo_danh_muc.Add(new SelectListItem { Text = "-----Tất cả-----", Value = "-1", Selected = true });
            ViewData["cbo_danh_muc"] = cbo_danh_muc;
        }
        private void load_cbo_quy()
        {
            //load cbo quy
            decimal v_id_user = user_control.get_id_user();
            list_cbo_quy = db.DM_QUY.Where(x => x.ID_USER == v_id_user).Select(x => new ten_cbo_quy { TEN_QUY = x.TEN, ID_QUY = x.ID }).ToList();
            List<SelectListItem> cbo_quy = new List<SelectListItem>();
            for (int i = 0; i < list_cbo_quy.Count; i++)
            {
                cbo_quy.Add(new SelectListItem { Text = list_cbo_quy[i].TEN_QUY, Value = list_cbo_quy[i].ID_QUY.ToString() });
            }
            cbo_quy.Add(new SelectListItem { Text = "-----Tất cả-----", Value = "-1", Selected = true });
            ViewData["cbo_quy"] = cbo_quy;
        }
        #endregion


    }
}
