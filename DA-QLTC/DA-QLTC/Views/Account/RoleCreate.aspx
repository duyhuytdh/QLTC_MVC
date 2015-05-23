<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    RoleCreate
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center">
        <h2>Thêm Role</h2>
        <% using (Html.BeginForm())
           {%>
        <%: Html.AntiForgeryToken()%>
        <%:Html.ValidationSummary(true)%>
        <div style="padding: 10px">
            <div><%: Html.ActionLink("Danh sách Role", "RoleIndex") %></div>
            <label>
                Role name
            </label>
            <div>
                <%: Html.TextBox("RoleName")%>
            </div>
        </div>
        <input class="btn btn-success" type="submit" value="Save" />
        <% }%>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
