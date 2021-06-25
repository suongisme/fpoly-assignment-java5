<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="main-content">
    <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Basic Table Examples</h3>
        <div class="row">

            <div class="col-md-12" id="ice">
                <div class="content-panel">
                    <h4>
                        <i class="fa fa-angle-right"></i>
                        Đá
                        <a href="${pageContext.request.contextPath}/admin/form#ice" class="btn btn-success">Thêm đá</a>
                    </h4>
                    <hr>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tỷ lệ</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="ice" items="${ices}">

                                <tr>
                                    <td>${ice.id}</td>
                                    <td>${ice.icePercent}%</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/form?ice_id=${ice.id}#ice" class="btn btn-primary btn-xs">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/ice/${ice.id}" class="btn btn-danger btn-xs">
                                            <i class="fa fa-trash-o "></i>
                                        </a>
                                    </td>
                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>
                </div><! --/content-panel -->
            </div><!-- /col-md-12 -->

            <div class="col-md-12 mt" id="size">
                <div class="content-panel">
                    <table class="table table-hover">
                        <h4>
                            <i class="fa fa-angle-right"></i>
                            Size
                            <a href="${pageContext.request.contextPath}/admin/form#size" class="btn btn-success">Thêm size</a>
                        </h4>
                        <hr>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Size</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="size" items="${sizes}">
                                <tr>
                                    <td>${size.id}</td>
                                    <td>${size.name}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/form?size_id=${size.id}#size" class="btn btn-primary btn-xs">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/size/${size.id}" class="btn btn-danger btn-xs">
                                            <i class="fa fa-trash-o "></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div><! --/content-panel -->
            </div><!-- /col-md-12 -->


            <div class="col-md-12 mt" id="sugar">
                <div class="content-panel">
                    <table class="table table-hover">
                        <h4>
                            <i class="fa fa-angle-right"></i>
                            Đường
                            <a href="${pageContext.request.contextPath}/admin/form#sugar" class="btn btn-success">Thêm đường</a>
                        </h4>
                        <hr>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tỷ lệ</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="sugar" items="${sugars}">
                                <tr>
                                    <td>${sugar.id}</td>
                                    <td>${sugar.sugarPercent}%</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/form?sugar_id=${sugar.id}#sugar" class="btn btn-primary btn-xs">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/sugar/${sugar.id}" class="btn btn-danger btn-xs">
                                            <i class="fa fa-trash-o "></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div><! --/content-panel -->
            </div><!-- /col-md-12 -->

            <div class="col-md-12 mt" id="topping">
                <div class="content-panel">
                    <table class="table table-hover">
                        <h4>
                            <i class="fa fa-angle-right"></i>
                            Topping
                            <a href="${pageContext.request.contextPath}/admin/form#topping" class="btn btn-success">Thêm topping</a>
                        </h4>
                        <hr>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Giá</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="topping" items="${toppings}">

                                <tr>
                                    <td>${topping.id}</td>
                                    <td>${topping.name}</td>
                                    <td>${topping.price}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/form?topping_id=${topping.id}#topping" class="btn btn-primary btn-xs">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/topping/${topping.id}" class="btn btn-danger btn-xs">
                                            <i class="fa fa-trash-o "></i>
                                        </a>
                                    </td>
                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>
                </div><! --/content-panel -->
            </div><!-- /col-md-12 -->

        </div><!-- row -->

    </section><! --/wrapper -->
</section><!-- /MAIN CONTENT -->