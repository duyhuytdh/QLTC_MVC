<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DA_QLTC.Models.GD_THU_CHI>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    BaoCaoTongHop
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%using (Html.BeginForm("ExportData", "BaoCao", FormMethod.Post, new { enctype = "multipart/form-data" }))
    {%>
    <h2 class="h2" style="text-align: center">Báo cáo Lịch sử giao dịch</h2>
    <%DateTime now = DateTime.Now;
      var startDate = new DateTime(now.Year, now.Month, 1);
      var endDate = startDate.AddMonths(1).AddDays(-1);
      string str_startDate = startDate.ToString("dd/MM/yyyy");
      string str_endDate = endDate.ToString("dd/MM/yyyy");
    %>
    <table style="padding: 10px; margin-left: 280px">
        <tr>
            <td>
                <label class="label-input-css float-left">Từ ngày</label></td>
            <td>&nbsp;&nbsp;<input type="text" class="form-control" style="width: 100px" placeholder="Click để chọn ngày tháng" id="m_dat_tu_ngay" value="<%=str_startDate%>"/></td>
            <td style="width: 20px"></td>
            <td>
                <label class="label-input-css float-left">Đến ngày</label></td>

            <td>&nbsp;&nbsp;<input type="text" class="form-control" style="width: 100px" placeholder="Click để chọn ngày tháng" id="m_dat_den_ngay" value="<%=str_endDate%>" /></td>
        </tr>
    </table>
    <br />
    <br />
    <table>
        <tr>
            <td>
                <div style="width: 220px">
                    <label class="label-input-css float-left">Loại giao dịch</label>
                    <div class="editor-field float-right form-control">
                        <select style="width: 100px">
                            <option value="Thu nhập">Thu nhập</option>
                            <option value="Chi tiêu">Chi tiêu</option>
                        </select>
                    </div>
                </div>
            </td>
            <td style="width: 20px"></td>
            <td>
                <div style="width: 270px">
                    <label class="label-input-css float-left">Quỹ giao dịch</label>
                    <div class="editor-field float-right form-control">
                        <select style="width: 150px">
                            <option value="Tài chính">Tài chính</option>
                            <option value="Giáo dục">Giáo dục</option>
                        </select>
                    </div>
                </div>
            </td>
            <td style="width: 20px"></td>
            <td>
                <div style="width: 250px">
                    <label class="label-input-css float-left">Danh mục</label>
                    <div class="editor-field float-right form-control">
                        <select style="width: 150px">
                            <option value="Tài chính">Mua sách</option>
                            <option value="Giáo dục">Làm partime</option>
                        </select>
                    </div>
                </div>
            </td>
            <td style="width: 20px"></td>
            <td style="width: 200px">
                <input class="btn btn-sm btn-primary" type="button" value="Lọc dữ liệu" />
                <input type="submit" name="Export" id="Export" class="btn btn-sm btn-success" value="Xuất Excel" />
            </td>
        </tr>
    </table>
    <table id="tbl_bc_tong_hop" class="table table-hover table-bordered header-background" style="width: 1000px">
        <thead>
            <tr>
                <th style="width: 100px">Ngày giao dịch
                </th>
                <th style="width: auto">Tên giao dịch
                </th>
                <th style="width: 150px">Danh mục thu/chi
                </th>
                <th style="width: 80px">Loại giao dịch
                </th>
                <th style="width: 100px">Số tiền
                </th>
                <th style="width: 80px">Đơn vị tính
                </th>
                <th style="width: 100px">Quỹ giao dịch
                </th>
                <th style="width: 100px">Ghi chú
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.THOI_GIAN) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.TEN_GIAO_DICH) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DM_THU_CHI.TEN) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DM_THU_CHI.DM_TU_DIEN.TEN) %>
                </td>
                <td class="format-so-tien">
                    <%: Html.DisplayFor(modelItem => item.SO_TIEN) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DM_DVT.TEN) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DM_QUY.TEN) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.GHI_CHU) %>
                </td>
                <% } %>
        </tbody>

    </table>
    <%} %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var lst = $('.format-so-tien');
            for (var i = 0; i < lst.length; i++) {
                $(lst[i]).text(accounting.formatNumber($(lst[i]).text()));
            }
            $('#m_dat_tu_ngay').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#m_dat_den_ngay').datepicker({ dateFormat: 'dd/mm/yy' });
        });
    </script>
</asp:Content>
