<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.GD_THU_CHI>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #tbl_them_chu_chi tr > td {
            padding: 10px;
        }
    </style>
    <h2 style="text-align: center; padding: 10px 10px 15px 150px">Chi tiết quỹ</h2>
    <div style="text-align: center; margin: 0px auto; width: 100%">
        <% using (Html.BeginForm())
           { %>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Chi tiết danh mục thu/chi</legend>
            <div style="margin: 0px auto">
                <label class="glyphicon glyphicon-list"></label>
                <%: Html.ActionLink("Xem lịch sử giao dịch thu/chi", "Index") %>
            </div>
            <div style="width: 500px; text-align: center; margin: 0px auto">
                <table id="tbl_them_chu_chi">
                    <tr>
                        <td>
                            <label class="float-left">Ngày giao dịch</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                              <span><%=ViewData["txt_ngay"]%></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="float-left">Tên giao dịch</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.TEN_GIAO_DICH) %>
                            </div>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <label class="float-left">Danh mục giao dịch</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.DM_THU_CHI.TEN) %>
                            </div>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <label class="float-left">Số tiền</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.SO_TIEN) %>
                            </div>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <label class="float-left">Đơn vị tính</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.DM_DVT.TEN) %>
                            </div>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <label class="float-left">Quỹ giao dịch</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.DM_QUY.TEN) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="float-left">Ghi chú</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.GHI_CHU) %>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <p>
                <label class="glyphicon glyphicon-edit"></label>
                <%: Html.ActionLink("Sửa", "Edit", new { id=Model.ID }) %> |
               <label class="glyphicon glyphicon-circle-arrow-left"></label>
                <%: Html.ActionLink("Trở lại", "Index") %>
            </p>
        </fieldset>
        <% } %>
    </div>
<h2>Details</h2>

<fieldset>
    <legend>GD_THU_CHI</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.THOI_GIAN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.THOI_GIAN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.DM_THU_CHI.TEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DM_THU_CHI.TEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.SO_TIEN) %>
    </div>
    <div class="display-field format-so-tien">
        <%: Html.DisplayFor(model => model.SO_TIEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.DM_DVT.TEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DM_DVT.TEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.DM_QUY.TEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DM_QUY.TEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.GHI_CHU) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GHI_CHU) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             var lst = $('.format-so-tien');
             for (var i = 0; i < lst.length; i++) {
                 $(lst[i]).text(accounting.formatNumber($(lst[i]).text()));
             }
             $('#m_dat_ngay').datepicker({ dateFormat: 'dd/mm/yy', gotoCurrent: true, setDate: new Date() });
         });
    </script>
</asp:Content>
