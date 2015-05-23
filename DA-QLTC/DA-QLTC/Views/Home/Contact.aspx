<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="contactTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Contact - My ASP.NET MVC Application
</asp:Content>

<asp:Content ID="contactContent" ContentPlaceHolderID="MainContent" runat="server">
        <div style="text-align:center">
            <h2> <%: ViewBag.Message %></h2>

    <section class="contact">
        <header>
            <h3>Phone:</h3>
        </header>
        <p>
            <span>0169 201 1280</span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span >Support:</span>
            <span><a href="mailto:duyhuytdh@gmail.com">duyhuytdh@gmail.com</a></span>
        </p>
        <p>
            <span >Marketing:</span>
            <span><a href="mailto:knjght9x15@gmail.com">knjght9x15@gmail.com</a></span>
        </p>
        <p>
            <span>General:</span>
            <span><a href="mailto:duyhuytdh@gmail.com">duyhuytdh@gmail.com</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Địa chỉ:</h3>
        </header>
        <p>
            Nhà D3 Viện Toán Ứng Dụng và Tin Học<br />
            Trường đại học Bách Khoa Hà Nội, số 1 Đại Cồ Việt - Hai Bà Trưng - Hà Nội
        </p>
    </section>
    </div>
</asp:Content>