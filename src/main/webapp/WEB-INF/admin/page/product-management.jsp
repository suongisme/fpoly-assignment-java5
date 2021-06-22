<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="main-content">
    <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Quản lý sản phẩm</h3>
        <div class="row mt">
            <div class="col-md-12">
                <div class="content-panel">
                    <table class="table table-striped table-advance table-hover">
                        <h4>
                            <i class="fa fa-angle-right"></i>
                            Sản phẩm
                            <a href="${pageContext.request.contextPath}/admin/form#product" class="btn btn-success">Thêm sản phẩm</a>
                        </h4>
                        <hr>
                        <thead>
                        <tr>
                            <th><i class="fa fa-bullhorn"></i> Tên sản phẩm</th>
                            <th><i class="fa fa-bookmark"></i> Hình ảnh</th>
                            <th><i class="fa fa-bookmark"></i> Gíá</th>
                            <th><i class="fa fa-bookmark"></i> Sale</th>
                            <th><i class=" fa fa-edit"></i> Loại</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td style="line-height: 35px">${product.name}</td>
                                    <td style="line-height: 35px">${product.image}</td>
                                    <td style="line-height: 35px">${product.price}</td>
                                    <td style="line-height: 35px">${product.sale}%</td>
                                    <td style="line-height: 35px">${product.category.name}</td>
                                    <td style="line-height: 35px">
                                        <a href="${pageContext.request.contextPath}/admin/form?product_id=${product.id}#product" class="btn btn-primary btn-xs">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/product/${product.id}" class="btn btn-danger btn-xs">
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
    <nav aria-label="Page navigation example" style="display: flex; justify-content: center">
        <ul class="pagination">
            <c:forEach var="page" items="${pages}">
                <li class="page-item">
                    <a  style="background: ${param.page eq page ? '#1919e659' : 'white'}" class="page-link" href="${pageContext.request.contextPath}/admin/product-management?page=${page}">${page}</a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</section>