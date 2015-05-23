<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    RoleIndex
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="" style="text-align: center">
        <h3>Danh sách Role</h3>
        <%: Html.ActionLink("Create New Role", "RoleCreate")%> | <%:Html.ActionLink("Add Role to User", "RoleAddToUser")%>
        <table style="padding:10px; width:300px; margin-left:300px" class="table table-hover table-bordered header-background">
            <thead>
                <tr>
                    <th>Tên Role</th>
                    <th>Thao tác</th>
                </tr>
            </thead>

            <tbody>
                <% foreach (string s in Model)
                   {%>
                <tr>
                    <td>
                        <%=s %>
                    </td>
                    <td>
                        <label class="glyphicon glyphicon-trash"></label>
                        <span onclick="return confirm('Are you sure to delete?')">
                            <a href="/User/RoleDelete?RoleName=<%=s%>" class="delLink">Delete</a>
                        </span>
                    </td>
                </tr>
                  <%} %>
            </tbody>
        </table>
      
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
