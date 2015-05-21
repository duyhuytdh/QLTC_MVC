<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.USER>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
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
