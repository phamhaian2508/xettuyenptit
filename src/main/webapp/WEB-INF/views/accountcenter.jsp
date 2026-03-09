<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <title>Account Center - Xét tuyển PTIT</title>
<style>
  body{margin:0}
  .ac-page{min-height:100vh;background:#f0f2f5;color:#1f2937;font-family:Arial,Helvetica,sans-serif}
  .ac-header{background:#fff;border-bottom:1px solid #e5e7eb;box-shadow:0 1px 2px rgba(0,0,0,.06);padding:10px 18px;display:flex;align-items:center;justify-content:space-between}
  .ac-brand{display:flex;align-items:center;gap:12px}
  .ac-logo{width:38px;height:46px;object-fit:contain}
  .ac-brand-top{color:#cc0d00;font-weight:700;font-size:20px;line-height:1.2}
  .ac-brand-bottom{font-size:16px;line-height:1.2}
  .ac-brand-bottom a{color:inherit;text-decoration:none}
  .ac-brand-bottom a:hover{text-decoration:underline}
  .ac-user{position:relative;display:flex;align-items:center;gap:12px;font-size:16px;padding-bottom:8px;margin-bottom:-8px}
  .ac-user-trigger{display:flex;align-items:center;gap:8px;user-select:none}
  .ac-user-ptit{width:22px;height:22px;object-fit:contain}
  .ac-user-info-icon{width:21px;height:21px;display:inline-flex;color:#111827}
  .ac-user-info-icon svg{width:100%;height:100%;fill:currentColor}
  .ac-user-menu{position:absolute;top:100%;right:0;width:220px;border:1px solid #ececec;border-radius:8px;background:#fff;box-shadow:0 10px 20px rgba(0,0,0,.08);overflow:hidden;z-index:999;display:none}
  .ac-user:hover .ac-user-menu,.ac-user:focus-within .ac-user-menu{display:block}
  .ac-user-menu a{display:flex;align-items:center;gap:10px;padding:12px 14px;font-size:16px;color:#1f2937;text-decoration:none;border-bottom:1px solid #f3f4f6}
  .ac-user-menu a:last-child{border-bottom:0}
  .ac-user-menu a:hover{background:#f9fafb}
  .ac-menu-icon{width:17px;height:17px;display:inline-flex;color:#6b7280;flex:0 0 17px}
  .ac-menu-icon svg{width:100%;height:100%;fill:currentColor}

  .ac-wrap{max-width:1280px;margin:16px auto;padding:0 16px}
  .ac-grid{display:grid;grid-template-columns:380px 1fr;gap:20px;align-items:start}
  .ac-card{background:#fff;border:1px solid #e5e7eb;border-radius:4px}
  .ac-left{padding:30px}
  .ac-avatar{width:104px;height:104px;border-radius:50%;background:#d10909;color:#fff;font-size:46px;font-weight:700;display:flex;align-items:center;justify-content:center;margin:0 auto 22px}
  .ac-name{text-align:center;font-size:24px;font-weight:500;margin-bottom:8px}
  .ac-email{text-align:center;font-size:15px;color:#1f2937;margin-bottom:24px}
  .ac-meta{font-size:14px;line-height:1.75}
  .ac-meta p{margin:0 0 8px;display:flex;align-items:center}
  .ac-meta .anticon{display:inline-flex;align-items:center;justify-content:center;width:16px;height:16px;margin-right:10px;color:#4b5563}
  .ac-meta .anticon svg{width:16px;height:16px;fill:currentColor}

  .ac-right .tabs{display:flex;padding:0 24px;border-bottom:1px solid #eee}
  .ac-right .tab{padding:18px 0;font-size:16px;font-weight:600;color:#1f2937;margin-right:36px;border-bottom:2px solid transparent}
  .ac-right .tab.active{color:#e01515;border-bottom-color:#e01515}
  .ac-tab-link{text-decoration:none}
  .ac-form{padding:24px}
  .ac-row{display:grid;grid-template-columns:1fr 1fr;gap:14px}
  .ac-field{margin-bottom:16px}
  .ac-field label{display:block;font-size:15px;color:#1f2937;margin-bottom:8px}
  .req{color:#e01515}
  .ac-input,.ac-select,.ac-textarea{width:100%;border:1px solid #d1d5db;border-radius:2px;padding:10px 12px;font-size:16px;color:#111827;box-sizing:border-box}
  .ac-input,.ac-select{height:42px}
  .ac-textarea{height:86px;resize:vertical}
  .ac-save-wrap{text-align:center;padding-top:4px}
  .ac-save{height:40px;padding:0 22px;background:#cf1322;border:0;color:#fff;border-radius:4px;font-size:18px;font-weight:700;cursor:pointer}
  .ac-save:hover{background:#b9121f}
  .ac-success{margin:0 0 16px;background:#ecfdf3;border:1px solid #22c55e;color:#166534;padding:10px 12px;border-radius:4px;font-size:14px}
  .ac-error{margin:0 0 16px;background:#fef2f2;border:1px solid #ef4444;color:#991b1b;padding:10px 12px;border-radius:4px;font-size:14px}

  .ac-footer{background:#eceff3;border-top:1px solid #e5e7eb;padding:22px 0;margin-top:20px}
  .ac-footer-grid{max-width:1220px;margin:0 auto;padding:0 16px;display:grid;grid-template-columns:1.3fr 1fr 1fr;gap:18px}
  .ac-foot-title{font-size:18px;font-weight:700;color:#6b7280;margin-bottom:6px}
  .ac-foot-logo{width:56px;height:68px;object-fit:contain;display:block;margin-bottom:10px}
  .ac-foot-big{font-size:24px;font-weight:700;margin-bottom:6px}
  .ac-foot-txt{font-size:17px;line-height:1.45;margin-bottom:2px}

  @media (max-width:1200px){
    .ac-name{font-size:22px}
    .ac-email{font-size:16px}
    .ac-meta{font-size:14px}
    .ac-right .tab{font-size:15px}
    .ac-field label{font-size:14px}
    .ac-input,.ac-select,.ac-textarea{font-size:15px}
    .ac-input,.ac-select{height:40px}
    .ac-save{height:38px;font-size:16px}
  }
  @media (max-width:992px){
    .ac-grid{grid-template-columns:1fr}
    .ac-row{grid-template-columns:1fr}
    .ac-footer-grid{grid-template-columns:1fr}
  }
</style>

<c:set var="displayUser" value="${empty userInfo.userName ? '037204009534' : userInfo.userName}"/>
<c:set var="displayName" value="${empty userInfo.fullName ? 'Nguyễn Anh Tuấn' : userInfo.fullName}"/>
<c:set var="displayFullName" value="${empty userInfo.fullName ? displayUser : userInfo.fullName}"/>
<c:set var="displayEmail" value="${empty userInfo.email ? 'tuanhb2k4@gmail.com' : userInfo.email}"/>
<c:set var="displayMiddleName" value="${empty userInfo.middleName ? 'Nguyễn Anh' : userInfo.middleName}"/>
<c:set var="displayFirstName" value="${empty userInfo.firstName ? 'Tuấn' : userInfo.firstName}"/>
<c:set var="displayIdentity" value="${empty userInfo.identityNumber ? '037204009534' : userInfo.identityNumber}"/>
<c:set var="displayIdentityDate" value="${empty userInfo.identityIssueDate ? '10/05/2021' : userInfo.identityIssueDate}"/>
<c:set var="displayIdentityPlace" value="${empty userInfo.identityIssuePlace ? 'Hòa Bình' : userInfo.identityIssuePlace}"/>
<c:set var="displayProvince" value="${empty userInfo.permanentProvince ? 'Tỉnh Hòa Bình (17)' : userInfo.permanentProvince}"/>
<c:set var="displayDistrict" value="${empty userInfo.permanentDistrict ? 'Huyện Lạc Sơn' : userInfo.permanentDistrict}"/>
<c:set var="displayWard" value="${empty userInfo.permanentWard ? 'Xã Thượng Cốc' : userInfo.permanentWard}"/>
<c:set var="displayAddress" value="${empty userInfo.permanentAddress ? 'Xóm mới' : userInfo.permanentAddress}"/>
<c:set var="displayDob" value="${empty userInfo.dateOfBirth ? '03/03/2004' : userInfo.dateOfBirth}"/>
<c:set var="displayGender" value="${empty userInfo.gender ? 'Nam' : userInfo.gender}"/>
<c:set var="displayPhone" value="${empty userInfo.phone ? '0823928782' : userInfo.phone}"/>

<div class="ac-page">
  <header class="ac-header">
    <div class="ac-brand">
      <img src="<c:url value='/image/ptit-header-icon.png'/>" class="ac-logo" alt="PTIT">
      <div>
        <div class="ac-brand-bottom"><a href="<c:url value='/mucdich'/>">Xét tuyển PTIT</a></div>
      </div>
    </div>

    <div class="ac-user">
      <span class="ac-user-info-icon" aria-hidden="true">
        <svg viewBox="64 64 896 896" focusable="false"><path d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372zm-20-590h40c4.4 0 8 3.6 8 8v40c0 4.4-3.6 8-8 8h-40c-4.4 0-8-3.6-8-8v-40c0-4.4 3.6-8 8-8zm44 428h-48c-4.4 0-8-3.6-8-8V430c0-4.4 3.6-8 8-8h48c4.4 0 8 3.6 8 8v284c0 4.4-3.6 8-8 8z"></path></svg>
      </span>
      <div class="ac-user-trigger">
        <img src="<c:url value='/image/ptit-header-icon.png'/>" alt="PTIT" class="ac-user-ptit">
        <span>${displayFullName}</span>
      </div>
      <div class="ac-user-menu">
        <a href="<c:url value='/account/center'/>"><span class="ac-menu-icon"><svg viewBox="64 64 896 896" focusable="false"><path d="M858.5 763.6a374 374 0 00-80.6-119.5 375.63 375.63 0 00-119.5-80.6c-.4-.2-.8-.3-1.2-.5C719.5 518 760 444.7 760 362c0-137-111-248-248-248S264 225 264 362c0 82.7 40.5 156 102.8 201.1-.4.2-.8.3-1.2.5-44.8 18.9-85 46-119.5 80.6a375.63 375.63 0 00-80.6 119.5A371.7 371.7 0 00136 901.8a8 8 0 008 8.2h60c4.4 0 7.9-3.5 8-7.8 2-77.2 33-149.5 87.8-204.3 56.7-56.7 132-87.9 212.2-87.9s155.5 31.2 212.2 87.9C779 752.7 810 825 812 902.2c.1 4.4 3.6 7.8 8 7.8h60a8 8 0 008-8.2c-1-47.8-10.9-94.3-29.5-138.2zM512 534c-45.9 0-89.1-17.9-121.6-50.4S340 407.9 340 362c0-45.9 17.9-89.1 50.4-121.6S466.1 190 512 190s89.1 17.9 121.6 50.4S684 316.1 684 362c0 45.9-17.9 89.1-50.4 121.6S557.9 534 512 534z"></path></svg></span><span>Trang cá nhân</span></a>
        <a href="<c:url value='/logout'/>"><span class="ac-menu-icon"><svg viewBox="64 64 896 896" focusable="false"><path d="M868 732h-70.3c-4.8 0-9.3 2.1-12.3 5.8-7.6 9.2-16.1 17.7-25.3 25.2-45.1 36.7-103.2 57-164.1 57H370c-61.9 0-120-20.3-165.1-57.3-45-36.8-71.2-88.5-74-145.7-.2-4.9-4.3-8.8-9.2-8.8H56c-5.5 0-10 4.5-10 10 .3 77.4 33.5 149.5 93.5 203C197 871.6 280.4 900 370 900h226c89.5 0 172.9-28.4 230.5-78.8 16.5-14.5 31.2-31 43.7-49.1 3.1-4.5-.1-10.1-5.2-10.1zM951.2 486.2L815.8 351c-1.5-1.5-3.6-2.3-5.7-2.3-1 0-2 .2-3 .6-3 1.2-5 4.1-5 7.4v86.3H512c-4.4 0-8 3.6-8 8v120c0 4.4 3.6 8 8 8h290.1v86.3c0 3.3 2 6.2 5 7.4 1 .4 2 .6 3 .6 2.1 0 4.2-.8 5.7-2.3l135.4-135.2c3.1-3.1 3.1-8.2 0-11.3z"></path></svg></span><span>Đăng xuất</span></a>
      </div>
    </div>
  </header>

  <main class="ac-wrap">
    <div class="ac-grid">
      <aside class="ac-card ac-left">
        <div class="ac-avatar">${fn:toUpperCase(fn:substring(displayMiddleName,0,1))}${fn:toUpperCase(fn:substring(displayFirstName,0,1))}</div>
        <div class="ac-name">${displayFirstName}</div>
        <div class="ac-email">${displayEmail}</div>
        <div class="ac-meta">
          <p>
            <span role="img" aria-label="contacts" class="anticon anticon-contacts">
              <svg viewBox="64 64 896 896" focusable="false" aria-hidden="true">
                <path d="M594.3 601.5a111.8 111.8 0 0029.1-75.5c0-61.9-49.9-112-111.4-112s-111.4 50.1-111.4 112c0 29.1 11 55.5 29.1 75.5a158.09 158.09 0 00-74.6 126.1 8 8 0 008 8.4H407c4.2 0 7.6-3.3 7.9-7.5 3.8-50.6 46-90.5 97.2-90.5s93.4 40 97.2 90.5c.3 4.2 3.7 7.5 7.9 7.5H661a8 8 0 008-8.4c-2.8-53.3-32-99.7-74.7-126.1zM512 578c-28.5 0-51.7-23.3-51.7-52s23.2-52 51.7-52 51.7 23.3 51.7 52-23.2 52-51.7 52zm416-354H768v-56c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v56H548v-56c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v56H328v-56c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v56H96c-17.7 0-32 14.3-32 32v576c0 17.7 14.3 32 32 32h832c17.7 0 32-14.3 32-32V256c0-17.7-14.3-32-32-32zm-40 568H136V296h120v56c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-56h148v56c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-56h148v56c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-56h120v496z"></path>
              </svg>
            </span>Thí sinh
          </p>
          <p>
            <span role="img" aria-label="user" class="anticon anticon-user">
              <svg viewBox="64 64 896 896" focusable="false" aria-hidden="true">
                <path d="M858.5 763.6a374 374 0 00-80.6-119.5 375.63 375.63 0 00-119.5-80.6c-.4-.2-.8-.3-1.2-.5C719.5 518 760 444.7 760 362c0-137-111-248-248-248S264 225 264 362c0 82.7 40.5 156 102.8 201.1-.4.2-.8.3-1.2.5-44.8 18.9-85 46-119.5 80.6a375.63 375.63 0 00-80.6 119.5A371.7 371.7 0 00136 901.8a8 8 0 008 8.2h60c4.4 0 7.9-3.5 8-7.8 2-77.2 33-149.5 87.8-204.3 56.7-56.7 132-87.9 212.2-87.9s155.5 31.2 212.2 87.9C779 752.7 810 825 812 902.2c.1 4.4 3.6 7.8 8 7.8h60a8 8 0 008-8.2c-1-47.8-10.9-94.3-29.5-138.2zM512 534c-45.9 0-89.1-17.9-121.6-50.4S340 407.9 340 362c0-45.9 17.9-89.1 50.4-121.6S466.1 190 512 190s89.1 17.9 121.6 50.4S684 316.1 684 362c0 45.9-17.9 89.1-50.4 121.6S557.9 534 512 534z"></path>
              </svg>
            </span>${displayFirstName}
          </p>
          <p>
            <span role="img" aria-label="calendar" class="anticon anticon-calendar">
              <svg viewBox="64 64 896 896" focusable="false" aria-hidden="true">
                <path d="M880 184H712v-64c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v64H384v-64c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v64H144c-17.7 0-32 14.3-32 32v664c0 17.7 14.3 32 32 32h736c17.7 0 32-14.3 32-32V216c0-17.7-14.3-32-32-32zm-40 656H184V460h656v380zM184 392V256h128v48c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-48h256v48c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-48h128v136H184z"></path>
              </svg>
            </span>${displayDob}
          </p>
          <p>
            <span role="img" aria-label="man" class="anticon anticon-man">
              <svg viewBox="64 64 896 896" focusable="false" aria-hidden="true">
                <path d="M874 120H622c-3.3 0-6 2.7-6 6v56c0 3.3 2.7 6 6 6h160.4L583.1 387.3c-50-38.5-111-59.3-175.1-59.3-76.9 0-149.3 30-203.6 84.4S120 539.1 120 616s30 149.3 84.4 203.6C258.7 874 331.1 904 408 904s149.3-30 203.6-84.4C666 765.3 696 692.9 696 616c0-64.1-20.8-124.9-59.2-174.9L836 241.9V402c0 3.3 2.7 6 6 6h56c3.3 0 6-2.7 6-6V150c0-16.5-13.5-30-30-30zM408 828c-116.9 0-212-95.1-212-212s95.1-212 212-212 212 95.1 212 212-95.1 212-212 212z"></path>
              </svg>
            </span>${displayGender}
          </p>
          <p>
            <span role="img" aria-label="cluster" class="anticon anticon-cluster">
              <svg viewBox="64 64 896 896" focusable="false" aria-hidden="true">
                <path d="M888 680h-54V540H546v-92h238c8.8 0 16-7.2 16-16V168c0-8.8-7.2-16-16-16H240c-8.8 0-16 7.2-16 16v264c0 8.8 7.2 16 16 16h238v92H190v140h-54c-4.4 0-8 3.6-8 8v176c0 4.4 3.6 8 8 8h176c4.4 0 8-3.6 8-8V688c0-4.4-3.6-8-8-8h-54v-72h220v72h-54c-4.4 0-8 3.6-8 8v176c0 4.4 3.6 8 8 8h176c4.4 0 8-3.6 8-8V688c0-4.4-3.6-8-8-8h-54v-72h220v72h-54c-4.4 0-8 3.6-8 8v176c0 4.4 3.6 8 8 8h176c4.4 0 8-3.6 8-8V688c0-4.4-3.6-8-8-8zM256 805.3c0 1.5-1.2 2.7-2.7 2.7h-58.7c-1.5 0-2.7-1.2-2.7-2.7v-58.7c0-1.5 1.2-2.7 2.7-2.7h58.7c1.5 0 2.7 1.2 2.7 2.7v58.7zm288 0c0 1.5-1.2 2.7-2.7 2.7h-58.7c-1.5 0-2.7-1.2-2.7-2.7v-58.7c0-1.5 1.2-2.7 2.7-2.7h58.7c1.5 0 2.7 1.2 2.7 2.7v58.7zM288 384V216h448v168H288zm544 421.3c0 1.5-1.2 2.7-2.7 2.7h-58.7c-1.5 0-2.7-1.2-2.7-2.7v-58.7c0-1.5 1.2-2.7 2.7-2.7h58.7c1.5 0 2.7 1.2 2.7 2.7v58.7zM360 300a40 40 0 1080 0 40 40 0 10-80 0z"></path>
              </svg>
            </span>${displayEmail}
          </p>
        </div>
      </aside>

      <section class="ac-card ac-right">
        <div class="tabs">
          <c:choose>
            <c:when test="${activeTab eq 'password'}">
              <a class="tab ac-tab-link" href="<c:url value='/account/center'/>">Thông tin cá nhân</a>
              <a class="tab ac-tab-link active" href="<c:url value='/account/center?tab=password'/>">Đổi mật khẩu</a>
            </c:when>
            <c:otherwise>
              <a class="tab ac-tab-link active" href="<c:url value='/account/center'/>">Thông tin cá nhân</a>
              <a class="tab ac-tab-link" href="<c:url value='/account/center?tab=password'/>">Đổi mật khẩu</a>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="ac-form">
          <c:if test="${activeTab eq 'password'}">
            <c:if test="${pwSaved}">
              <div class="ac-success">Đổi mật khẩu thành công.</div>
            </c:if>
            <c:if test="${pwError}">
              <div class="ac-error">Mật khẩu cũ không đúng hoặc xác nhận mật khẩu mới chưa khớp.</div>
            </c:if>
            <form action="<c:url value='/account/center/password'/>" method="post">
              <div class="ac-field">
                <label><span class="req">*</span> Mật khẩu cũ</label>
                <input class="ac-input" type="password" name="oldPassword" required>
              </div>
              <div class="ac-field">
                <label><span class="req">*</span> Mật khẩu mới</label>
                <input class="ac-input" type="password" name="newPassword" required>
              </div>
              <div class="ac-field">
                <label><span class="req">*</span> Xác nhận mật khẩu mới</label>
                <input class="ac-input" type="password" name="confirmPassword" required>
              </div>
              <div class="ac-save-wrap">
                <button class="ac-save" type="submit">Lưu</button>
              </div>
            </form>
          </c:if>

          <c:if test="${activeTab ne 'password'}">
            <c:if test="${saved}">
              <div class="ac-success">Đã lưu thông tin thành công.</div>
            </c:if>

            <form action="<c:url value='/account/center/save'/>" method="post">
              <div class="ac-row">
                <div class="ac-field">
                  <label><span class="req">*</span> Số CMND/CCCD hoặc hộ chiếu</label>
                  <input class="ac-input" name="identityNumber" value="${displayIdentity}">
                </div>
                <div class="ac-field">
                  <label><span class="req">*</span> Ngày cấp</label>
                  <input class="ac-input" name="identityIssueDate" value="${displayIdentityDate}">
                </div>
              </div>

              <div class="ac-field">
                <label><span class="req">*</span> Nơi cấp</label>
                <textarea class="ac-textarea" name="identityIssuePlace">${displayIdentityPlace}</textarea>
              </div>

              <div class="ac-row">
                <div class="ac-field">
                  <label><span class="req">*</span> Họ đệm</label>
                  <input class="ac-input" name="middleName" value="${displayMiddleName}">
                </div>
                <div class="ac-field">
                  <label><span class="req">*</span> Tên</label>
                  <input class="ac-input" name="firstName" value="${displayFirstName}">
                </div>
              </div>

              <div class="ac-field">
                <label><span class="req">*</span> Hộ khẩu thường trú</label>
                <div class="ac-row">
                  <div class="ac-field">
                    <input class="ac-input" name="permanentProvince" value="${displayProvince}">
                  </div>
                  <div class="ac-field">
                    <input class="ac-input" name="permanentDistrict" value="${displayDistrict}">
                  </div>
                </div>
                <div class="ac-row">
                  <div class="ac-field">
                    <input class="ac-input" name="permanentWard" value="${displayWard}">
                  </div>
                  <div class="ac-field">
                    <input class="ac-input" name="permanentAddress" value="${displayAddress}">
                  </div>
                </div>
              </div>

              <div class="ac-row">
                <div class="ac-field">
                  <label><span class="req">*</span> Ngày sinh</label>
                  <input class="ac-input" name="dateOfBirth" value="${displayDob}">
                </div>
                <div class="ac-field">
                  <label><span class="req">*</span> Giới tính</label>
                  <select class="ac-select" name="gender">
                    <option value="Nam" ${displayGender eq 'Nam' ? 'selected' : ''}>Nam</option>
                    <option value="Nữ" ${displayGender eq 'Nữ' ? 'selected' : ''}>Nữ</option>
                    <option value="Khác" ${displayGender eq 'Khác' ? 'selected' : ''}>Khác</option>
                  </select>
                </div>
              </div>

              <div class="ac-row">
                <div class="ac-field">
                  <label><span class="req">*</span> Email</label>
                  <input class="ac-input" name="email" value="${displayEmail}">
                </div>
                <div class="ac-field">
                  <label><span class="req">*</span> Số điện thoại</label>
                  <input class="ac-input" name="phone" value="${displayPhone}">
                </div>
              </div>

              <div class="ac-save-wrap">
                <button class="ac-save" type="submit">Lưu</button>
              </div>
            </form>
          </c:if>
        </div>
      </section>
    </div>
  </main>

  <footer class="ac-footer">
    <div class="ac-footer-grid">
      <div>
        <img src="<c:url value='/image/ptit-header-icon.png'/>" alt="PTIT" class="ac-foot-logo">
        <div class="ac-foot-big">HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH<br>VIỄN THÔNG</div>
        <div class="ac-foot-txt">Là đơn vị đào tạo, nghiên cứu trọng điểm, chủ lực của ngành thông tin và truyền thông tại Việt Nam.</div>
      </div>
      <div>
        <div class="ac-foot-title">THÔNG TIN LIÊN HỆ</div>
        <div class="ac-foot-txt">Email: tuyensinh@ptit.edu.vn</div>
        <div class="ac-foot-txt">Website: https://portal.ptit.edu.vn</div>
        <div class="ac-foot-txt">Website tuyển sinh: https://tuyensinh.ptit.edu.vn</div>
        <div class="ac-foot-txt">Số điện thoại liên hệ: 024 3756 2186</div>
      </div>
      <div>
        <div class="ac-foot-title">ĐỊA CHỈ HỌC VIỆN</div>
        <div class="ac-foot-txt">Trụ sở chính: 122 Hoàng Quốc Việt, Cầu Giấy, Hà Nội</div>
        <div class="ac-foot-txt">Cơ sở Hà Nội: Km10 Nguyễn Trãi, Hà Đông, Hà Nội</div>
        <div class="ac-foot-txt">Học viện cơ sở TP.HCM: 11 Nguyễn Đình Chiểu, Quận 1</div>
        <div class="ac-foot-txt">Cơ sở TP.HCM: Đường Man Thiện, P. Hiệp Phú, Quận 9</div>
      </div>
    </div>
  </footer>
</div>
