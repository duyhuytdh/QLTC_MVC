<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.USER>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>USER</legend>

        <%: Html.HiddenFor(model => model.ID) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.USER_NAME) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.USER_NAME) %>
            <%: Html.ValidationMessageFor(model => model.USER_NAME) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ACCOUNT_NAME) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ACCOUNT_NAME) %>
            <%: Html.ValidationMessageFor(model => model.ACCOUNT_NAME) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.PASSWORD) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.PASSWORD) %>
            <%: Html.ValidationMessageFor(model => model.PASSWORD) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EMAIL) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EMAIL) %>
            <%: Html.ValidationMessageFor(model => model.EMAIL) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.FACEBOOK) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.FACEBOOK) %>
            <%: Html.ValidationMessageFor(model => model.FACEBOOK) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.GHI_CHU) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.GHI_CHU) %>
            <%: Html.ValidationMessageFor(model => model.GHI_CHU) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
