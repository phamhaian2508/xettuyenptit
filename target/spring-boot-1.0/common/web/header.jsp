<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<%@ taglib prefix="select" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp" %>
<nav class="navbar-expand-lg navbar-dark fixed-top">
    <div class="row navbar">
        <div class="col-12 col-md-3">
            <div class="logo">
                <a href=""></a>
            </div>
        </div>
        <div class="col-12 col-md-6">
            <div class="item-menu">
                <div class="nav nav1">
                    <div class="nav-item p-2"><a class="nav-item-link" href="/trang-chu"><span style="color: var(--primary-color);">Trang chu</span></a></div>
                    <div class="nav-item p-2"><a href='<c:url value='/gioi-thieu'/>'><span style="color: var(--primary-color);">Gioi thieu</span></a></div>
                    <div class="nav-item p-2"><a href='<c:url value='/san-pham'/>'><span style="color: var(--primary-color);">San pham</span></a></div>
                    <div class="nav-item p-2"><a href='<c:url value='/tin-tuc'/>'><span style="color: var(--primary-color);">Tin tuc</span></a></div>
                    <div class="nav-item p-2"><a href='<c:url value='/lien-he'/>'><span style="color: var(--primary-color);">Lien he</span></a></div>
                </div>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <security:authorize access = "isAnonymous()">
                    <li class><a class="nav-link" href="<c:url value='/login'/>">Dang nhap</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Dang ky</a></li>
                </security:authorize>
                <security:authorize access = "isAuthenticated()">
                    <li class="nav-item"><a class="nav-link" href="/admin/home"> Hello <%=SecurityUtils.getPrincipal().getUsername()%></a></li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/logout'/>">
                            <i class="fa-solid fa-right-from-bracket" style="line-height: 22px"></i>
                        </a>
                    </li>
                </security:authorize>
            </ul>
        </div>
    </div>
</nav>
