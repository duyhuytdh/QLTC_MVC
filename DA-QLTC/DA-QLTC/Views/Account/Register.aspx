<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #tbl_dang_ky tr > td {
            padding: 10px;
        }
    </style>
     <h2 style="text-align: center; padding: 10px 10px 15px 150px">Đăng ký tài khoản</h2>
    <% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary() %>

    <fieldset>
        <legend>Registration Form</legend>
        <div style="width: 500px; text-align: center; margin: 0px auto">
            <table id="tbl_dang_ky">
                  <tr>
                    <td>
                        <label class="float-left">Họ và tên</label></td>
                    <td>
                        <input type="text" name="m_txt_ho_ten" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="float-left">Tên đăng nhập (*)</label></td>
                    <td>
                        <%: Html.TextBoxFor(m => m.UserName) %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="float-left">Mật khẩu (*)</label></td>
                    <td>
                        <%: Html.PasswordFor(m => m.Password) %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="float-left">Xác nhận mật khẩu (*)</label></td>
                    <td>
                        <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    </td>
                </tr>
            </table>
        </div>
        <p>
            <input class="btn btn-success" style="margin-left:500px" type="submit" value="Đăng ký" />
        </p>
    </fieldset>
    <% } %>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
