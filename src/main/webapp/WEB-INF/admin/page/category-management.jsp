<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section id="main-content">
    <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Quản lý loại sản phẩm</h3>
        <div class="row mt">
            <div class="col-md-12">
                <div class="content-panel">
                    <table class="table table-striped table-advance table-hover">
                        <h4>
                            <i class="fa fa-angle-right"></i>
                            Loại sản phẩm
                            <a href="${pageContext.request.contextPath}/admin/form#category" class="btn btn-success">Thêm loại sản phẩm</a>
                        </h4>
                        <hr>
                        <thead>
                        <tr>
                            <th><i class="fa fa-bullhorn"></i> ID</th>
                            <th><i class="fa fa-bullhorn"></i> Tên</th>
                            <th><i class="fa fa-bullhorn"></i> Số lượng sản phẩm</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="category" items="${categories}">
                                <tr>
                                    <td>${category.id}</td>
                                    <td>${category.name}</td>
                                    <td> ${category.products.size()} </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/form?category_id=${category.id}#category"  class="btn btn-primary btn-xs">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/category/${category.id}" data-products="${category.products.size()}" class="btn btn-danger btn-xs btn-delete-category">
                                            <i class="fa fa-trash-o "></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div><!-- /content-panel -->
            </div><!-- /col-md-12 -->
        </div><!-- /row -->
    </section>
</section>
<script src="${pageContext.request.contextPath}/js/admin-category.js"></script>

