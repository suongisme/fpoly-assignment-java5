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

                            <th>
                                <i class="fa fa-bullhorn"></i>
                                Mã hóa đơn
                            </th>
                            <th>
                                <i class="fa fa-bullhorn"></i>
                                Ngày
                            </th>
                            <th>
                                <i class="fa fa-bullhorn"></i>
                                Tên sản phẩm
                            </th>
                            <th>
                                <i class="fa fa-bookmark"></i> Size</th>
                            <th><i class="fa fa-bookmark"></i> Topping</th>
                            <th><i class="fa fa-bookmark"></i> Đá</th>
                            <th><i class="fa fa-bookmark"></i> Đường</th>
                            <th><i class="fa fa-bookmark"></i> Số lượng</th>
                            <th><i class="fa fa-bookmark"></i> Hình thức</th>
                            <th><i class="fa fa-bookmark"></i> Tổng tiền</th>
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
                                    <td>${item.size.name}</td>
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
</section>

