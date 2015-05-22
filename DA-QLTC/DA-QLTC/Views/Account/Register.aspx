<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>Register.</h1>
        <h2>Create a new account.</h2>
    </hgroup>

    <% using (Html.BeginForm()) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary() %>

        <fieldset>
            <legend>Registration Form</legend>
            <ol>
                <li>
                    <label>Họ và tên</label>
                    <input id="m_txt_ho_ten" name="m_txt_ho_ten" type="text" />
                </li>
                <li>
                    <%: Html.Label("Tên đăng nhập") %>
                    <%: Html.TextBoxFor(m => m.UserName) %>
                </li>
                <li>
                    <%: Html.Label("Mật khẩu") %>
                    <%: Html.PasswordFor(m => m.Password) %>
                </li>
                <li>
                    <%: Html.Label("Xác nhận mật khẩu") %>
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                </li>
            </ol>
            <input type="submit" value="Register" />
        </fieldset>
    <% } %>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
