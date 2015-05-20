<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DA_QLTC.Models.DM_DVT>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
         <style>
        #tbl_them_chu_chi tr > td {
            padding: 10px;
        }
    </style>
    <h2 style="text-align: center; padding: 10px 10px 15px 150px">Chi tiết đơn vị tính</h2>
    <div style="text-align: center; margin: 0px auto; width: 100%">
        <% using (Html.BeginForm())
           { %>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Chi tiết danh mục thu/chi</legend>
            <div style="margin: 0px auto">
                <label class="glyphicon glyphicon-list"></label>
                <%: Html.ActionLink("Xem danh mục đơn vị tính", "Index") %>
            </div>
            <div style="width: 500px; text-align: center; margin: 0px auto">
                <table id="tbl_them_chu_chi">
                    <tr>
                        <td>
                            <label class="float-left">Tên đơn vị tính</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.TEN) %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="float-left">Kí hiệu</label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.KI_HIEU) %>
                            </div>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <label class="float-left">Tỉ giá 1 USD = </label></td>
                        <td>
                            <div class="display-field float-left form-control-static">
                                <%: Html.DisplayFor(model => model.QUY_DOI_USD) %>
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
</asp:Content>
