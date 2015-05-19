﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.DM_THU_CHI>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>DM_THU_CHI</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.TEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.DM_TU_DIEN.TEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DM_TU_DIEN.TEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.USER.USER_NAME) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.USER.USER_NAME) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.GHI_CHU) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GHI_CHU) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
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
