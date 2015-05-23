<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    RoleAddToUser
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="spacerBody" style="padding: 10px; margin-left: 200px">
        <p>&nbsp;</p>
        <%: Html.ActionLink("Create New Role", "RoleCreate")%> | <%:Html.ActionLink("Roles", "RoleIndex") %>

        <h2>Role Add to User</h2>

        <% using (Html.BeginForm("RoleAddToUser", "User"))
           {%>
        <%: Html.AntiForgeryToken()%>
        <%:Html.ValidationSummary(true)%>

        <%--        <div class="message-success"><%=ViewBag.ResultMessage%></div>--%>
        <p>
            Username : <%: Html.TextBox("UserName")%>
            Role Name:  <%:Html.DropDownList("RoleName", ViewBag.Roles as SelectList)%>
        </p>
        <input class="btn btn-sm btn-success" style="margin-left: 200px" type="submit" value="Save Role for this User" />
        <%}%>



        <div class="hr"></div>
        <% using (Html.BeginForm("GetRoles", "User"))
           {%>
        <%:Html.AntiForgeryToken() %>
        <p>
            Username : <%:Html.TextBox("UserName")%>
        </p>
        <input class="btn btn-sm btn-success" style="margin-left: 200px" type="submit" value="Get Roles for this User" />
        <% }%>

        <% if (ViewBag.RolesForThisUser != null)
           {%>
        <h3>Roles for this user </h3>
        <ol>
            <% foreach (string s in ViewBag.RolesForThisUser)
               {%>
            <li><%=s %></li>
            <% }%>
        </ol>
        <% }%>

        <h3>Delete A User from a Role</h3>

        <% using (Html.BeginForm("DeleteRoleForUser", "User"))
           {%>
        <%: Html.AntiForgeryToken()%>
        <%:Html.ValidationSummary(true)%>

        <p>
            Username : <%:Html.TextBox("UserName")%>
        Role Name: <%:Html.DropDownList("RoleName", ViewBag.Roles as SelectList)%>
        </p>

        <input class="btn btn-sm btn-danger" style="margin-left: 200px" type="submit" value="Delete this user from Role" />
        <% }%>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
