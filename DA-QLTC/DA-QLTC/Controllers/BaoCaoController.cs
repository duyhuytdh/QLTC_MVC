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

namespace DA_QLTC.Controllers
{
    [Authorize]
    public class BaoCaoController : Controller
    {
        public class BCQuy
        {
            public string TEN_QUY;
            public decimal TONG_THU;
            public decimal TONG_CHI;
            public decimal TONG_QUY;
        }
        List<string> list_ten_quy;
        List<GD_THU_CHI> list_thu_chi;
        List<BCQuy> list_bc_quy;

        DA_QLTC.App_Start.UserControl user_control = new DA_QLTC.App_Start.UserControl();
        private QLTC_MVCEntities db = new QLTC_MVCEntities();
        //
        // GET: /BaoCaoTongHop/

        public ActionResult BaoCaoLichSuGD()
        {
            decimal v_id_user = user_control.get_id_user();
            var gd_thu_chi = db.GD_THU_CHI.Where(x => x.DM_THU_CHI.ID_USER == v_id_user).Include(g => g.DM_DVT).Include(g => g.DM_QUY).Include(g => g.DM_THU_CHI);
            return View(gd_thu_chi.ToList());
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
        public ActionResult ExportData()
        {
            decimal v_id_user = user_control.get_id_user();
            GridView gv = new GridView();
            gv.DataSource = db.GD_THU_CHI.Where(x => x.DM_THU_CHI.ID_USER == v_id_user).Include(g => g.DM_DVT).Include(g => g.DM_QUY).Include(g => g.DM_THU_CHI).ToList();
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
    }
}
