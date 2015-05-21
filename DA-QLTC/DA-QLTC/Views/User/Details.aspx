<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.USER>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>USER</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.USER_NAME) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.USER_NAME) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ACCOUNT_NAME) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ACCOUNT_NAME) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.PASSWORD) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.PASSWORD) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.EMAIL) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EMAIL) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.FACEBOOK) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.FACEBOOK) %>
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
