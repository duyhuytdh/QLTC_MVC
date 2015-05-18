<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.DM_QUY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>DM_QUY</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.USER.USER_NAME) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.USER.USER_NAME) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.TEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TEN) %>
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
        <%: Html.DisplayNameFor(model => model.LOG_SO_TIEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.LOG_SO_TIEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.GHI_CHU) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GHI_CHU) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
