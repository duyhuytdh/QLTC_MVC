<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.USER>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #tbl_tao_quy tr > td {
            padding: 10px;
        }
    </style>
    <h2 style="text-align: center; padding: 10px 10px 15px 150px">Đăng ký tài khoản</h2>
    <div style="text-align: center; margin: 0px auto; width: 100%">
        <% using (Html.BeginForm())
           { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary() %>

        <fieldset>
            <legend>Thêm danh mục thu/chi</legend>
            <div style="margin: 0px auto">
                <label class="glyphicon glyphicon-list"></label>
                <%: Html.ActionLink("Xem danh sách user", "Index") %>
            </div>
            <div style="width: 500px; text-align: center; margin: 0px auto">
                <table id="tbl_tao_quy">
                    <tr>
                        <td>
                            <label class="float-left">Họ và tên</label></td>
                        <td>
                            <div class="editor-field float-right form-control">
                                <%: Html.EditorFor(model => model.USER_NAME) %>
                                <%: Html.ValidationMessageFor(model => model.USER_NAME) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="float-left">Tên đăng nhập</label></td>
                        <td style="text-align: left">
                            <div class="editor-field float-right form-control">
                                <%: Html.EditorFor(model => model.ACCOUNT_NAME) %>
                                <%: Html.ValidationMessageFor(model => model.ACCOUNT_NAME) %>
                            </div>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <label class="float-left">Mật khẩu</label></td>
                        <td style="text-align: left">
                            <div class="editor-field float-right form-control">
                                <%: Html.EditorFor(model => model.PASSWORD) %>
                                <%: Html.ValidationMessageFor(model => model.PASSWORD) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="float-left">Nhập lại mật khẩu</label></td>
                        <td>
                            <div class="editor-field float-right form-control">
                                <%: Html.EditorFor(model => model.PASSWORD) %>
                                <%: Html.ValidationMessageFor(model => model.PASSWORD) %>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <p>
                <input class="btn btn-success" style="margin-left:100px" type="submit" value="Đăng ký" />
            </p>
        </fieldset>
        <% } %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
