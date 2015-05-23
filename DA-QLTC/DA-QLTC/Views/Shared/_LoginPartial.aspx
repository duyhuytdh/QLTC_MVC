<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<style>
    .username {
    }
</style>
<% if (Request.IsAuthenticated) { %>
    <label class="glyphicon glyphicon-user"></label>
    Xin chào, <%: Html.ActionLink(User.Identity.Name, "Manage", "Account", routeValues: null, htmlAttributes: new { @class = "username", title = "Manage" }) %>!
    <label class="glyphicon glyphicon-log-out"></label>
    <% using (Html.BeginForm("LogOff", "Account", FormMethod.Post, new { id = "logoutForm" })) { %>
        <%: Html.AntiForgeryToken() %>
        <a href="javascript:document.getElementById('logoutForm').submit()">Log off</a>
    <% } %>
<% } else { %>
        <label class="glyphicon glyphicon-edit"></label>
        <%: Html.ActionLink("Register", "Register", "Account", routeValues: null, htmlAttributes: new { id = "registerLink" })%>
         <label class="glyphicon glyphicon-log-in"></label>
        <%: Html.ActionLink("Log in", "Login", "Account", routeValues: null, htmlAttributes: new { id = "loginLink" })%>
<% } %>