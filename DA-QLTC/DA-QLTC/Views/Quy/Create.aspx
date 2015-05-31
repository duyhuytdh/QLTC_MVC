<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.DM_QUY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Tạo quỹ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #tbl_tao_quy tr > td {
            padding: 10px;
        }
    </style>
    <h2 style="text-align: center; padding: 10px 10px 15px 100px">Tạo Quỹ</h2>
    <div style="text-align: center; margin: 0px auto; width: 100%">
        <% using (Html.BeginForm())
           { %>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Thêm quỹ</legend>
            <div  style="margin:0px auto">
                <label class="glyphicon glyphicon-list"></label>
                <%: Html.ActionLink("Xem danh sách quỹ", "Index") %>
            </div>
            <div style="width: 500px; text-align: center; margin:0px auto">
                <table id="tbl_tao_quy">
                    <tr>
                        <td>
                            <label>Tên Quỹ</label></td>
                        <td>
                            <div class="editor-field float-right form-control">
                                <%: Html.EditorFor(model => model.TEN) %>
                                <%: Html.ValidationMessageFor(model => model.TEN) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Số tiền</label></td>
                        <td>
                            <div class="editor-field float-right form-control">
                                <%: Html.EditorFor(model => model.SO_TIEN) %>
                                <%: Html.ValidationMessageFor(model => model.SO_TIEN) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Đơn vị tính</label></td>
                        <td style="text-align: left">
                            <div class="editor-field float-right form-control">
                                <%: Html.DropDownList("ID_DVT", "VN Đồng") %>
                                <%: Html.ValidationMessageFor(model => model.ID_DVT) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Ghi chú</label></td>
                        <td>
                            <div class="editor-field float-right form-control">
                                <%: Html.EditorFor(model => model.GHI_CHU) %>
                                <%: Html.ValidationMessageFor(model => model.GHI_CHU) %>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <p>
                <input class="btn btn-success" type="submit" value="Tạo mới" />
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
