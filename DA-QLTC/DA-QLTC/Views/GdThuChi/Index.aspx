<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DA_QLTC.Models.GD_THU_CHI>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div style="text-align: center; margin: 0px auto; padding-left: 100px">
        <h2 class="h2">Giao dịch Thu/Chi</h2>
    </div>

 <p>
        <label class="glyphicon glyphicon-plus"></label>
        <%: Html.ActionLink("Thêm giao dịch mới", "Create") %>
    </p>
<table id="tbl_ds_thu_chi" class="table table-hover table-bordered header-background" style="width: 1000px">
    <thead>
    <tr>
        <th style="width:100px">
           Ngày giao dịch
        </th>
        <th style="width:auto">
            Tên giao dịch
        </th>
         <th style="width:100px">
            Tên danh mục
        </th>
        <th>
            Loại giao dịch
        </th>
          <th style="width:100px">
            Số tiền
        </th>
          <th style="width:80px">
            Đơn vị tính
        </th>
         <th style="width:100px">
            Quỹ giao dịch
        </th>
        <th style="width:100px">
           Ghi chú
        </th>
        <th>
            Thao tác
        </th>
    </tr>
</thead>
    <tbody>
      <% foreach (var item in Model) { %>
    <tr>
        <td class="format-ngay-thang">
            <%: Html.DisplayFor(modelItem => item.THOI_GIAN) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TEN_GIAO_DICH) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DM_THU_CHI.TEN)%> 
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
       <td style="margin:2px; width:180px">
                    <label class="glyphicon glyphicon-edit"></label>
                    <%: Html.ActionLink("Sửa", "Edit", new { id=item.ID }) %> 
            <label class="glyphicon glyphicon-align-justify"></label>
                    <%: Html.ActionLink("Chi tiết", "Details", new { id=item.ID }) %> 
            <label class="glyphicon glyphicon-trash"></label>
                    <%: Html.ActionLink("Xóa", "Delete", new { id=item.ID }) %>
                </td>
    </tr>
<% } %>
</tbody>
</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
     <script type="text/javascript">
         function ShowDate(DateSql) {
             //var now = new Date(DateSql);
             //var then = DateSql.getFullYear() + '-' + (DateSql.getMonth() + 1) + '-' + DateSql.getDay();
             //then += ' ' + DateSql.getHours() + ':' + DateSql.getMinutes();
             //alert(DateSql + '\n' + then);
             var sqlDateStr = DateSql.val(); // as for MySQL DATETIME
             sqlDateStr = sqlDateStr.replace(/:| /g, "-");
             var YMDhms = sqlDateStr.split("-");
             var sqlDate = new Date();
             sqlDate.setFullYear(parseInt(YMDhms[0]), parseInt(YMDhms[1]) - 1,
                                                      parseInt(YMDhms[2]));
             sqlDate.setHours(parseInt(YMDhms[3]), parseInt(YMDhms[4]),
                                                   parseInt(YMDhms[5]), 0/*msValue*/);
             alert(sqlDate);
         }
         $(document).ready(function () {
             var lst = $('.format-so-tien');
             for (var i = 0; i < lst.length; i++) {
                 $(lst[i]).text(accounting.formatNumber($(lst[i]).text()));
             }
             ShowDate();
             var lstDate = $('.format-ngay-thang');
             for (var i = 0; i < lstDate.length; i++) {
                 ShowDate($(lstDate[i]));
             }
         });
    </script>
</asp:Content>
