<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<section id="main-content">
    <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Form Components</h3>

        <!-- INLINE FORM ELELEMNTS -->
        <div class="row mt" id="category">
            <div class="col-lg-12">
                <div class="form-panel">
                    <h4 class="mb"><i class="fa fa-angle-right"></i> Loại sản phẩm</h4>
                    <form:form action="${context}/admin/category" class="form-inline" role="form" modelAttribute="category">
                        <form:input path="id" type="hidden"/>

                        <div class="form-group">
                            <form:label path="name" cssClass="sr-only" for="exampleInputEmail2">Tên loại</form:label>
                            <form:input path="name" class="form-control" id="exampleInputEmail2" placeholder="Enter name category"/>
                            <form:errors path="name"/>
                        </div>
                        <button class="btn btn-theme">Submit</button>
                    </form:form>
                </div><!-- /form-panel -->
            </div><!-- /col-lg-12 -->
        </div><!-- /row -->

        <!-- INLINE FORM ELELEMNTS -->
        <div class="row mt" id="ice">
            <div class="col-lg-12">
                <div class="form-panel">
                    <h4 class="mb"><i class="fa fa-angle-right"></i> Đá (%)</h4>
                    <form:form action="${context}/admin/ice" class="form-inline" role="form" modelAttribute="ice">
                        <form:input path="id" type="hidden"/>
                        <div class="form-group">
                            <form:label path="icePercent" cssClass="sr-only" for="exampleInputEmail2">Tỷ lệ</form:label>
                            <form:input path="icePercent" cssClass="form-control" placeholder="Enter name category"/>
                            <form:errors path="icePercent"/>
                        </div>
                        <button class="btn btn-theme">Submit</button>
                    </form:form>
                </div><!-- /form-panel -->
            </div><!-- /col-lg-12 -->
        </div><!-- /row -->

        <!-- INLINE FORM ELELEMNTS -->
        <div class="row mt" id="sugar">
            <div class="col-lg-12">
                <div class="form-panel">
                    <h4 class="mb"><i class="fa fa-angle-right"></i> Đường (%)</h4>
                    <form:form action="${context}/admin/sugar" cssClass="form-inline" role="form" modelAttribute="sugar">
                        <form:input path="id" type="hidden"/>
                        <div class="form-group">
                            <form:label path="sugarPercent" cssClass="sr-only" for="exampleInputEmail2">Tỷ lệ</form:label>
                            <form:input path="sugarPercent" cssClass="form-control" placeholder="Enter name category"/>
                            <form:errors path="sugarPercent"/>
                        </div>
                        <button type="submit" class="btn btn-theme">Submit</button>
                    </form:form>
                </div><!-- /form-panel -->
            </div><!-- /col-lg-12 -->
        </div><!-- /row -->

        <!-- INLINE FORM ELELEMNTS -->
        <div class="row mt" id="size">
            <div class="col-lg-12">
                <div class="form-panel">
                    <h4 class="mb"><i class="fa fa-angle-right"></i> Size</h4>
                    <form:form action="${context}/admin/size" cssClass="form-inline" role="form" modelAttribute="size">
                        <form:input path="id" type="hidden"/>
                        <div class="form-group">
                            <form:label path="name" cssClass="sr-only" for="exampleInputEmail2">Size</form:label>
                            <form:input path="name" type="text" cssClass="form-control" placeholder="Enter name category"/>
                            <form:errors path="name"/>
                        </div>
                        <button type="submit" class="btn btn-theme">Submit</button>
                    </form:form>
                </div><!-- /form-panel -->
            </div><!-- /col-lg-12 -->
        </div><!-- /row -->

        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt" id="topping">
            <div class="col-lg-12">
                <div class="form-panel">
                    <h4 class="mb"><i class="fa fa-angle-right"></i> Topping</h4>
                    <form:form action="${context}/admin/topping" cssClass="form-horizontal style-form" method="POST" modelAttribute="topping">
                        <form:input path="id" type="hidden"/>
                        <div class="form-group">
                            <form:label path="name" cssClass="col-sm-2 col-sm-2 control-label">Tên topping</form:label>
                            <div class="col-sm-10">
                                <form:input path="name" cssClass="form-control"/>
                                <form:errors path="name"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <form:label path="price" cssClass="col-sm-2 col-sm-2 control-label">Giá</form:label>
                            <div class="col-sm-10">
                                <form:input path="price" cssClass="form-control"/>
                                <span class="help-block">
                                    <form:errors path="price"/>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <button class="btn btn-theme">submit</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div><!-- col-lg-12-->
        </div><!-- /row -->

        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt" id="product">
            <div class="col-lg-12">
                <div class="form-panel">
                    <h4 class="mb"><i class="fa fa-angle-right"></i> Sản phẩm</h4>
                    <form:form action="${context}/admin/product#product" class="form-horizontal style-form" enctype="multipart/form-data" method="POST" modelAttribute="product">
                        <form:input path="id" type="hidden"/>
                        <form:input path="image" type="hidden"/>
                        <div class="form-group">
                            <form:label path="name" cssClass="col-sm-2 col-sm-2 control-label">Tên sản phẩm</form:label>
                            <div class="col-sm-10">
                                <form:input path="name" type="text" class="form-control" placeholder="Tên sản phẩm"/>
                                <form:errors path="name"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <form:label path="description" cssClass="col-sm-2 col-sm-2 control-label">Mô tả</form:label>
                            <div class="col-sm-10">
                                <form:input path="description" type="text" cssClass="form-control" placeholder="mô tả"/>
                                <form:errors path="description"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <form:label path="price" class="col-sm-2 col-sm-2 control-label">Giá</form:label>
                            <div class="col-sm-10">
                                <form:input path="price" type="text" cssClass="form-control" placeholder="Giá"/>
                                <span class="help-block">
                                    <form:errors path="price"/>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <form:label path="sale" cssClass="col-sm-2 col-sm-2 control-label">Giảm giá(%)</form:label>
                            <div class="col-sm-10">
                                <form:input path="sale" type="text" cssClass="form-control round-form" placeholder="Giảm giá"/>
                                <form:errors path="sale"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <form:label path="category" cssClass="col-sm-2 col-sm-2 control-label">Loại sản phẩm</form:label>
                            <div class="col-sm-10">
                                <form:select path="category" cssClass="form-control">
                                    <c:forEach var="category" items="${categories}">
                                        <option ${category.id eq product.category.id ? 'selected' : ''} value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Image</label>
                            <label for="file" class="fancybox col-sm-10" style="width: 30%">
                                <img style="height: 100px; border: 1px solid" class="img-responsive" src="${context}/${product.image}" alt="">
                            </label>
                            <input type="file" style="display: none" id="file" name="file">
                        </div>

                        <div class="form-group">
                            <div class="col-sm-10">
                                <button class="btn btn-theme">submit</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div><!-- col-lg-12-->
        </div><!-- /row -->

    </section><! --/wrapper -->
</section><!-- /MAIN CONTENT -->

<script src="${context}/js/admin-form.js">

</script>
