<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.GD_THU_CHI>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        #tbl_tao_quy tr > td {
            padding: 10px;
        }
    </style>
    <h2 style="text-align: center; padding: 10px 10px 15px 150px">Thêm giao dịch</h2>
    <div style="text-align: center; margin: 0px auto; width: 100%">
        <% using (Html.BeginForm())
           { %>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Thêm giao dịch thu/chi</legend>
            <div style="margin: 0px auto">
                <label class="glyphicon glyphicon-list"></label>
                <%: Html.ActionLink("Xem lịch sử giao dịch thu/chi", "Index") %>
            </div>
            <div style="width: 500px; text-align: center; margin: 0px auto">
                <table id="tbl_tao_quy">
                    <tr>
                        <td>
                            <label class="label-input-css float-left">Ngày giao dịch</label></td>
                        <td>
                            <input type="text" class="form-control" placeholder="Click to show datepicker" id="m_dat_ngay" /></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label-input-css float-left">Tên giao dịch</label></td>
                        <td>
                            <div class="editor-field float-right form-control">
                                <%: Html.EditorFor(model => model.TEN_GIAO_DICH) %>
                                <%: Html.ValidationMessageFor(model => model.TEN_GIAO_DICH) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label-input-css float-left">Danh mục giao dịch</label></td>
                        <td>
                            <div class="editor-field float-right form-control">
                                <%: Html.DropDownList("ID_THU_CHI", String.Empty) %>
                                <%: Html.ValidationMessageFor(model => model.ID_THU_CHI) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label-input-css float-left format-money">Số tiền</label></td>
                        <td style="text-align: left">
                            <div class="editor-field float-right form-control">
                                <%: Html.EditorFor(model => model.SO_TIEN)%>
                                <%: Html.ValidationMessageFor(model => model.SO_TIEN) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label-input-css float-left">Đơn vị tính</label></td>
                        <td style="text-align: left">
                            <div class="editor-field float-right form-control">
                                <%: Html.DropDownList("ID_DVT", String.Empty) %>
                                <%: Html.ValidationMessageFor(model => model.ID_DVT) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label-input-css float-left">Quỹ giao dịch</label></td>
                        <td>
                            <div class="editor-field float-right form-control">
                                <%: Html.DropDownList("ID_QUY", String.Empty) %>
                                <%: Html.ValidationMessageFor(model => model.ID_QUY) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label-input-css float-left">Ghi chú</label></td>
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
    <script src="../../Scripts/UI/GD_THU_CHI.js"></script>
</asp:Content>
