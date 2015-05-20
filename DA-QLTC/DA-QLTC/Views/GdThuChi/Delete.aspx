<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.GD_THU_CHI>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>GD_THU_CHI</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.THOI_GIAN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.THOI_GIAN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.DM_THU_CHI.TEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DM_THU_CHI.TEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.SO_TIEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.SO_TIEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.DM_DVT.TEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DM_DVT.TEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.DM_QUY.TEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DM_QUY.TEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.GHI_CHU) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GHI_CHU) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
