<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About - My ASP.NET MVC Application
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h2><%: ViewBag.Message %></h2>
    </hgroup>

    <article>
        <p>
            Hệ thống được xây dựng cho đồ án II học kì 20142 năm 2015
            <br />
            Sinh viên: Trần Duy Huy
            <br />
            Viện Toán Ứng Dụng và Tin Học - Trường đại học Bách Khoa Hà Nội
        </p>

        <p>
            Hệ thống sẽ quản lý tài chính của bạn theo các quỹ (hũ tiền). Bạn nên chia tiền theo mô hình 
            Jars (mô hình 6 chiếc hũ), một mô hình quản lý tài chính cá nhân hiệu quả. Sau khi tạo quỹ 
            bạn sẽ nhập các danh mục chi tiêu mà bạn thường gặp. Nhiệm vụ hằng ngày bạn nhập các khoản chi
            tiêu theo các danh mục đó. Hệ thống sẽ thống kê và đưa ra báo cáo tài chính theo thời gian
            cho bạn để bạn có những điều chính thích hợp trong chi tiêu nhằm đem lại hiệu quả quản lý tài
            chính tốt nhất.
        </p>

        <p>
           Do đây là lần đầu triển khai nên hệ thống còn nhiều thiếu xót. Rất mong nhận được sự góp ý của
            các bạn.
            <br />
            Mọi ý kiến đóng góp xin gửi về địa chỉ <span><a href="mailto:duyhuytdh@gmail.com">duyhuytdh@gmail.com</a></span>
            <br />
            Xin chân thành cám ơn!
        </p>
    </article>
</asp:Content>