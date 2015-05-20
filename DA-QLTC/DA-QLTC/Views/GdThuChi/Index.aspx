﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DA_QLTC.Models.GD_THU_CHI>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div style="text-align: center; margin: 0px auto; padding-left: 200px">
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
        <th style="width:300px">
            Tên giao dịch
        </th>
         <th style="width:100px">
            Tên danh mục
        </th>
          <th style="width:100px">
            Số tiền
        </th>
          <th style="width:100px">
            Đơn vị tính
        </th>
         <th style="width:100px">
            Quỹ giao dịch
        </th>
        <th style="width:300px">
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
        <td>
            <%: Html.DisplayFor(modelItem => item.THOI_GIAN) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TEN_GIAO_DICH) %>
        </td>
        <td>
            <%Html.DisplayFor(modelItem => item.DM_THU_CHI.TEN);%>
        </td>
        <td>
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
       <td style="margin:2px">
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
</asp:Content>
