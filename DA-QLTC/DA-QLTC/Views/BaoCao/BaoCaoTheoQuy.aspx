<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    BaoCaoTheoQuy
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <%:ViewBag.list_quy%>
    <%:ViewBag.list_thu_chi%>--%>
    <h2 class="h2" style="text-align: center">Báo cáo tổng hợp theo quỹ</h2>
    <table style="padding: 10px; margin-left: 280px">
        <tr>
            <td>
                <label class="label-input-css float-left">Từ ngày</label></td>
            <td>&nbsp;&nbsp;<input type="text" class="form-control" style="width: 100px" placeholder="Click để chọn ngày tháng" id="m_dat_tu_ngay" /></td>
            <td style="width: 20px"></td>
            <td>
                <label class="label-input-css float-left">Đến ngày</label></td>

            <td>&nbsp;&nbsp;<input type="text" class="form-control" style="width: 100px" placeholder="Click để chọn ngày tháng" id="m_dat_den_ngay" /></td>
        </tr>
    </table>
    <br />
    <br />
    <table id="tbl_bc_tong_hop" class="table table-hover table-bordered header-background" style="width: 1000px">
        <thead>
            <tr>
                <th rowspan="2">Tên Quỹ</th>
                <th>Tổng Thu
                </th>
                <th>Tổng Chi
                </th>
                <th>Thu - Chi
                </th>
                <th>Số dư Quỹ trước
                </th>
                <th>Số dư Quỹ sau
                </th>
            </tr>
            <tr>
                <th>(1)
                </th>
                <th>(2)
                </th>
                <th>(3)=(1)-(2)
                </th>
                <th>(4)
                </th>
                <th>(5)=(4)+(3)
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in ViewBag.list_bc)
               { %>
            <tr>
                <td>
                    <%=item.TEN_QUY %>
                </td>
                <td class="format-so-tien">
                    <%=item.TONG_THU %>
                </td>
                <td class="format-so-tien">
                    <%=item.TONG_CHI %>
                </td>
                <td class="format-so-tien">
                    <%=item.TONG_THU - item.TONG_CHI%>
                </td>
                <td class="format-so-tien">
                    <%=item.TONG_QUY%>
                </td>
                <td class="format-so-tien">
                    <%=item.TONG_QUY + (item.TONG_THU-item.TONG_CHI)%>
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
