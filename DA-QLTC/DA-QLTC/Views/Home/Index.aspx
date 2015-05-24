<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page-PFM-Personal Financial Management
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <%--<div style="width:1000px; min-height:600px; background-image:url("/Images/piggy.jpg")">
    <img src="../../Images/piggy.jpg" />
</div>--%>
    <p class="site-title">
        <img src="../../Images/piggy.png" alt="Header image" style="width: 1000px; height: 550px; margin-left:195px">
    </p>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
