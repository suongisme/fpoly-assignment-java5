<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div id="sidebar"  class="nav-collapse ">
    <!-- sidebar menu start-->
    <ul class="sidebar-menu" id="nav-accordion">

        <p class="centered">
            <img src="${pageContext.request.contextPath}/images/icon_page.png" class="img-circle" width="60">
        </p>
        <h5 class="centered">NguyenVanSuong</h5>

        <li class="mt">
            <a class="${requestScope.active eq 'user' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/user">
                <i class="fa fa-dashboard"></i>
                <span>Quản lý người dùng</span>
            </a>
        </li>

        <li class="mt">
            <a class="${requestScope.active eq 'category' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/category-management" >
                <i class="fa fa-desktop"></i>
                <span>Quản lý loại sản phẩm</span>
            </a>
        </li>

        <li class="mt">
            <a class="${requestScope.active eq 'product' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/product-management" >
                <i class="fa fa-desktop"></i>
                <span>Quản lý sản phẩm</span>
            </a>
        </li>

        <li class="mt">
            <a class="${requestScope.active eq 'resources' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/resources-management" >
                <i class="fa fa-cogs"></i>
                <span>Quản lý tài nguyên</span>
            </a>
        </li>

        <li class="mt">
            <a class="${requestScope.active eq 'receipt' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/receipt-management" >
                <i class="fa fa-desktop"></i>
                <span>Quản lý hóa đơn</span>
            </a>
        </li>

        <li class="mt">
            <a class="${requestScope.active eq 'form' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/form" >
                <i class="fa fa-desktop"></i>
                <span>Form</span>
            </a>
        </li>
    </ul>
    <!-- sidebar menu end-->
</div>