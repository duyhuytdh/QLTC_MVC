<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.GD_THU_CHI>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>GD_THU_CHI</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.THOI_GIAN) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.THOI_GIAN) %>
            <%: Html.ValidationMessageFor(model => model.THOI_GIAN) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ID_THU_CHI, "DM_THU_CHI") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("ID_THU_CHI", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.ID_THU_CHI) %>
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
            <%: Html.LabelFor(model => model.ID_QUY, "DM_QUY") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("ID_QUY", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.ID_QUY) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.GHI_CHU) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.GHI_CHU) %>
            <%: Html.ValidationMessageFor(model => model.GHI_CHU) %>
        </div>

        <p>
            <input type="submit" value="Create" />
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
