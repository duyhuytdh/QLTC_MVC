<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page-PFM-Personal Financial Management
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <%--    <section class="featured">
        <div class="content-wrapper">
        </div>
    </section>--%>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <div role="tabpanel">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="Quỹ" role="tab" data-toggle="tab">Quỹ</a></li>
            <li role="presentation"><a href="#profile" aria-controls="Thu" role="tab" data-toggle="tab">Thu</a></li>
            <li role="presentation"><a href="#messages" aria-controls="Chi" role="tab" data-toggle="tab">Chi</a></li>
            <li role="presentation"><a href="#settings" aria-controls="Báo cáo" role="tab" data-toggle="tab">Báo cáo</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="Div1">...</div>
            <div role="tabpanel" class="tab-pane" id="Div2">...</div>
            <div role="tabpanel" class="tab-pane" id="Div3">...</div>
            <div role="tabpanel" class="tab-pane" id="Div4">...</div>
        </div>

    </div>
</asp:Content>
