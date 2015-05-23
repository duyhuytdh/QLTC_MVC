<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DA_QLTC.Models.GD_THU_CHI>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    BaoCaoTongHop
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="h2" style="text-align: center">Báo cáo Lịch sử giao dịch</h2>

    <table>
        <tr>
            <td>
                <label class="label-input-css float-left">Từ ngày</label></td>
            <td>
                <input type="text" class="form-control" placeholder="Click để chọn ngày tháng" id="m_dat_tu_ngay" /></td>
        </tr>
          <tr>
            <td>
                <label class="label-input-css float-left">Đến ngày</label></td>
            <td>
                <input type="text" class="form-control" placeholder="Click để chọn ngày tháng" id="m_dat_den_ngay" /></td>
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
