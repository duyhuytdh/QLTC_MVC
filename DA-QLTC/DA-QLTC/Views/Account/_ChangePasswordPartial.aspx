<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.LocalPasswordModel>" %>

<style>
    #tbl_change_pass tr>td{
        padding: 10px;
    }
</style>
<h3 style="color: forestgreen; margin-left: 400px">Đổi mật khẩu</h3>

<% using (Html.BeginForm("Manage", "Account"))
   { %>
<%: Html.AntiForgeryToken() %>
<%: Html.ValidationSummary() %>

<fieldset>
    <legend>Change Password Form</legend>
    <div style="width: 500px; text-align: center; margin: 0px auto">
        <table id="tbl_change_pass">
            <tr>
                <td class="float-left"><%: Html.Label("Mật khẩu cũ") %></td>
                <td><%: Html.PasswordFor(m => m.OldPassword) %></td>
            </tr>
            <tr>
                <td class="float-left"><%: Html.Label("Mật khẩu mới") %></td>
                <td><%: Html.PasswordFor(m => m.NewPassword) %></td>
            </tr>
            <tr>
                <td class="float-left"><%: Html.Label("Nhập lại mật khẩu") %></td>
                <td><%: Html.PasswordFor(m => m.ConfirmPassword) %></td>
            </tr>
        </table>
        <input class="btn btn-success" type="submit" value="Change password" />
    </div>
</fieldset>
<% } %>
