<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.DM_QUY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>DM_QUY</legend>

        <%: Html.HiddenFor(model => model.ID) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ID_USER, "USER") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("ID_USER", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.ID_USER) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TEN) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TEN) %>
            <%: Html.ValidationMessageFor(model => model.TEN) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.SO_TIEN) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.SO_TIEN) %>
            <%: Html.ValidationMessageFor(model => model.SO_TIEN) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ID_DVT, "DM_DVT") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("ID_DVT", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.ID_DVT) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.LOG_SO_TIEN) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.LOG_SO_TIEN) %>
            <%: Html.ValidationMessageFor(model => model.LOG_SO_TIEN) %>
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
