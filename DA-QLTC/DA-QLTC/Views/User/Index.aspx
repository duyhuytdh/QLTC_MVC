<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DA_QLTC.Models.USER>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; margin: 0px auto; padding-left: 100px">
        <h2 class="h2">Danh sách user</h2>
    </div>

    <p>
        <label class="glyphicon glyphicon-plus"></label>
        <%: Html.ActionLink("Thêm user", "Create") %>
        <label class="glyphicon glyphicon-plus"></label>
        <%: Html.ActionLink("Thêm role", "RoleCreate","Account") %>
    </p>
    <table id="tbl_ds_quy" class="table table-hover table-bordered header-background" style="width: 1000px">
        <thead>
            <tr>
                <th style="width: 200px">User Name</th>
                <th>Account Name</th>
                <th>PassWord</th>
                <th>Email</th>
                <th>Facebook</th>
                <th>Role</th>
                <th style="width: 200px">Ghi chú</th>
                <th>Thao tác </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.USER_NAME) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.ACCOUNT_NAME) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.PASSWORD) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.EMAIL) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.FACEBOOK) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.ROLE) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.GHI_CHU) %>
                </td>
                <td style="margin: 2px; width: 180px">
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
