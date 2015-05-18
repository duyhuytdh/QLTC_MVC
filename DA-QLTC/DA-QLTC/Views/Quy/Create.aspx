<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.DM_QUY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Tạo quỹ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <style>
         #tbl_tao_quy tr>td {
             padding: 10px;
         }
    </style>
    <h2 style="text-align: center; padding:10px 10px 15px 150px">Tạo Quỹ</h2>
    <div style="text-align: center; margin: 0px auto; width: 400px">
        <% using (Html.BeginForm())
           { %>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Danh mục Quỹ</legend>
            <div>
                <%: Html.ActionLink("Back to List", "Index") %>
            </div>
            <table id="tbl_tao_quy">
                <tr>
                    <td>Tên Quỹ</td>
                    <td>
                        <div class="editor-field float-right">
                            <%: Html.EditorFor(model => model.TEN) %>
                            <%: Html.ValidationMessageFor(model => model.TEN) %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Số tiền</td>
                    <td>
                        <div class="editor-field float-right">
                            <%: Html.EditorFor(model => model.SO_TIEN) %>
                            <%: Html.ValidationMessageFor(model => model.SO_TIEN) %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Đơn vị tính</td>
                    <td style="text-align:left">
                        <div class="editor-field float-right">
                            <%: Html.DropDownList("ID_DVT", String.Empty) %>
                            <%: Html.ValidationMessageFor(model => model.ID_DVT) %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Ghi chú</td>
                    <td>
                        <div class="editor-field float-right">
                            <%: Html.EditorFor(model => model.GHI_CHU) %>
                            <%: Html.ValidationMessageFor(model => model.GHI_CHU) %>
                        </div>
                    </td>
                </tr>
            </table>
            <p>
                <input class="btn btn-primary" type="submit" value="Create" />
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
