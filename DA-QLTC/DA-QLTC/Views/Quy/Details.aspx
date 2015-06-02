<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.DM_QUY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <style>
        #tbl_tao_quy tr > td {
            padding: 10px;
        }
    </style>
    <h2 style="text-align: center; padding: 10px 10px 15px 100px">Chi tiết quỹ</h2>
    <div style="text-align: center; margin: 0px auto; width: 100%">
        <% using (Html.BeginForm())
           { %>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Chi tiết quỹ</legend>
            <div style="margin: 0px auto">
                <label class="glyphicon glyphicon-list"></label>
                <%: Html.ActionLink("Xem danh sách quỹ", "Index") %>
            </div>
            <div style="width: 500px; text-align: center; margin: 0px auto">
                <table id="tbl_tao_quy">
                    <tr>
                        <td>
                            <label class="float-left">Tên Quỹ</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.TEN) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="float-left">Số tiền</label></td>
                        <td>
                            <div class="display-field float-left form-control-static format-so-tien">
                                <%: Html.DisplayFor(model => model.SO_TIEN) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="float-left">Đơn vị tính</label></td>
                        <td style="text-align: left">
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.DM_DVT.TEN) %>
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
        });
    </script>
</asp:Content>
