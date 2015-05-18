<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DA_QLTC.Models.DM_QUY>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin:0px auto"><h2>Danh mục quỹ</h2></div>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th>User name</th>
                <th>Tên Quỹ</th>
                <th>Số tiền</th>
                <th>Đơn vị tính</th>
                <th>Log số tiền</th>
                <th>Ghi chú</th>
                <th>Thao tác </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.USER.USER_NAME) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.TEN) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.SO_TIEN) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DM_DVT.TEN) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.LOG_SO_TIEN) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.GHI_CHU) %>
                </td>
                <td>
                    <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.ID }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.ID }) %>
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
