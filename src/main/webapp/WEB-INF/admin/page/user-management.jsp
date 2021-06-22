<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="main-content">
    <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Quản lý người dùng</h3>
        <div class="row mt">
            <div class="col-md-12">
                <div class="content-panel">
                    <table class="table table-striped table-advance table-hover">
                        <h4><i class="fa fa-angle-right"></i> Admin: ${admins.size()}</h4>
                        <hr>
                        <thead>
                            <tr>
                                <th><i class="fa fa-bullhorn"></i> ID</th>
                                <th class="hidden-phone"><i class="fa fa-question-circle"></i> Username</th>
                                <th>Role</th>
                                <th><i class=" fa fa-edit"></i> Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="admin" items="${admins}">
                                <tr>
                                    <td><a href="basic_table.html#">${admin.id}</a></td>
                                    <td class="hidden-phone">${admin.username}</td>
                                    <td> ${admin.role}  </td>
                                    <td><span class="label label-mini ${admin.active ? 'label-success' : 'label-danger'}">${admin.active ? 'Có hiệu hóa' : 'Vô hiệu hóa'}</span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div><!-- /content-panel -->
            </div><!-- /col-md-12 -->
        </div><!-- /row -->

        <div class="row mt">
            <div class="col-md-12">
                <div class="content-panel">
                    <table class="table table-striped table-advance table-hover">
                        <h4><i class="fa fa-angle-right"></i> Người dùng: ${users.size()}</h4>
                        <hr>
                        <thead>
                        <tr>
                            <th><i class="fa fa-bullhorn"></i> ID</th>
                            <th class="hidden-phone"><i class="fa fa-question-circle"></i> Username</th>
                            <th>Role</th>
                            <th><i class=" fa fa-edit"></i> Status</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td><a href="basic_table.html#">${user.id}</a></td>
                                <td class="hidden-phone">${user.username}</td>
                                <td> ${user.role}  </td>
                                <td><span class="label label-mini ${user.active ? 'label-success' : 'label-danger'}">${user.active ? 'Có hiệu hóa' : 'Vô hiệu hóa'}</span></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/user/${user.active ? 'disable' : 'enable'}/${user.id}" class="btn btn-xs ${user.active ? 'btn-danger':'btn-success'}">
                                        <i class="fa ${user.active ? 'fa-trash-o' : 'fa-check'} "></i>
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