<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section id="main-content">
    <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Quản lý hóa đơn</h3>
        <div class="row mt">
            <div class="col-md-12">
                <div class="content-panel">
                    <table class="table table-striped table-advance table-hover">
                        <h4><i class="fa fa-angle-right"></i> Hóa đơn</h4>
                        <hr>
                        <thead>
                        <tr>

                            <th>Mã</th>
                            <th>Ngày</th>
                            <th>Tên sản phẩm</th>
                            <th>Size</th>
                            <th>Topping</th>
                            <th>Đá</th>
                            <th>Đường</th>
                            <th>SL</th>
                            <th>Hình thức</th>
                            <th>Tổng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="receipt" items="${receipts}">
                            <c:set var="index" value="0"/>
                            <c:forEach var="item" items="${receipt.items}">
                                <c:set var="index" value="${index+1}"/>
                                <tr>
                                    <c:if test="${index eq 1}">
                                        <td rowspan="${receipt.items.size()}">${receipt.id}</td>
                                    </c:if>

                                    <c:if test="${index eq 1}">
                                        <td rowspan="${receipt.items.size()}">${receipt.date}</td>
                                    </c:if>
                                    <td>${item.product.name}</td>
                                    <td>${item.name.name}</td>
                                    <td>
                                        <c:set var="totalPriceTopping" value="0"/>
                                        <c:if test="${item.topping.size() eq 0}">
                                            không có topping
                                        </c:if>
                                        <c:forEach var="tp"  items="${item.topping}">
                                            ${tp.name},
                                            <c:set var="totalPriceTopping" value="${totalPriceTopping + tp.price}"/>
                                        </c:forEach>
                                    </td>

                                    <td>${item.ice.icePercent}%</td>
                                    <td>${item.sugar.sugarPercent}%</td>
                                    <td>${item.quantity}</td>
                                    <td>Tiền mặt</td>

                                    <td>${item.quantity * item.product.price + totalPriceTopping}</td>
                                </tr>
                            </c:forEach>
                            <tr style="height: 5px"/>
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
                    <a  style="background: ${param.page eq page ? '#1919e659' : 'white'}" class="page-link" href="${pageContext.request.contextPath}/admin/receipt-management?page=${page}">${page}</a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</section>

