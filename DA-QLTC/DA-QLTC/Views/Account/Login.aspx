<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.LoginModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Log in
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #tbl_login tr>td {
            padding:10px;
        }
    </style>
<h2 style="margin-left:150px; margin-top:20px; color:forestgreen" class="h2">Đăng nhập</h2>
    <section id="loginForm">
        <h3 class="h3" style="color:green">Đăng nhập bằng tài khoản đã có</h3>
        <% using (Html.BeginForm(new { ReturnUrl = ViewBag.ReturnUrl }))
           { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Log in Form</legend>
            <table id="tbl_login">
                <tr>
                    <td class="float-left"><%: Html.LabelFor(m => m.UserName) %></td>
                    <td class="float-right">
                        <%: Html.TextBoxFor(m => m.UserName) %>
                        <%: Html.ValidationMessageFor(m => m.UserName) %>
                    </td>
                </tr>
                <tr>
                    <td class="float-left"><%: Html.LabelFor(m => m.Password) %></td>
                    <td class="float-right">
                        <%: Html.PasswordFor(m => m.Password) %>
                        <%: Html.ValidationMessageFor(m => m.Password) %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%: Html.CheckBoxFor(m => m.RememberMe) %>
                        <%: Html.LabelFor(m => m.RememberMe, new { @class = "checkbox" }) %>
                    </td>
                </tr>
            </table>
            <input style="margin-left:200px" class="btn btn-success" type="submit" value="Log in" />
        </fieldset>
        <p style="color:blue; margin-left:100px; margin-top:10px">
            <%: Html.ActionLink("Register", "Register") %> if you don't have an account.
        </p>
        <% } %>
    </section>

   <%-- <section class="social" id="socialLoginForm">
        <h2>Use another service to log in.</h2>
        <%: Html.Action("ExternalLoginsList", new { ReturnUrl = ViewBag.ReturnUrl }) %>
    </section>--%>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
