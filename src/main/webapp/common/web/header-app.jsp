<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
  .app-shared-header{background:#fff;color:#000;box-shadow:0 1px 2px -2px rgba(0,0,0,.1),0 3px 6px 0 rgba(0,0,0,.05);padding:10px 16px;display:flex;align-items:center;justify-content:space-between;margin-bottom:8px}
  .app-shared-brand{display:flex;align-items:center;gap:12px}
  .app-shared-logo{width:38px;height:46px;object-fit:contain}
  .app-shared-brand-top{color:#cc0d00;font-weight:700;font-size:16px;line-height:1.25}
  .app-shared-brand-bottom{font-size:14px;line-height:1.25;text-transform:uppercase}
  .app-shared-menu-toggle{width:20px;height:20px;color:#111827;display:none;align-items:center;justify-content:center}
  .app-shared-menu-toggle svg{width:100%;height:100%;fill:currentColor}
  .app-shared-right{display:flex;align-items:center;gap:8px}
  .app-shared-action{width:24px;height:24px;color:#111827;display:inline-flex;align-items:center;justify-content:center}
  .app-shared-action svg{width:100%;height:100%;fill:currentColor}
  .app-shared-user{position:relative;display:flex;align-items:center;gap:10px;font-size:14px;padding-bottom:8px;margin-bottom:-8px}
  .app-shared-user-trigger{display:flex;align-items:center;gap:8px;user-select:none}
  .app-shared-user-ptit{width:22px;height:22px;object-fit:contain}
  .app-shared-user-name{font-size:14px;font-weight:500;color:#111827;max-width:180px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
  .app-shared-user-menu{position:absolute;top:100%;right:0;width:220px;border:1px solid #ececec;border-radius:8px;background:#fff;box-shadow:0 10px 20px rgba(0,0,0,.08);overflow:hidden;z-index:999;display:none}
  .app-shared-user:hover .app-shared-user-menu,.app-shared-user:focus-within .app-shared-user-menu{display:block}
  .app-shared-user-menu a{display:flex;align-items:center;gap:10px;padding:12px 14px;font-size:16px;color:#1f2937;text-decoration:none;border-bottom:1px solid #f3f4f6}
  .app-shared-user-menu a:last-child{border-bottom:0}
  .app-shared-user-menu a:hover{background:#f9fafb}
  .app-shared-menu-ico{width:17px;height:17px;display:inline-flex;color:#6b7280;flex:0 0 17px}
  .app-shared-menu-ico svg{width:100%;height:100%;fill:currentColor}

  @media (max-width:992px){
    .app-shared-menu-toggle{display:inline-flex}
    .app-shared-brand-bottom{display:none}
    .app-shared-user-name{max-width:92px}
  }
</style>

<header class="app-shared-header">
  <div class="app-shared-brand">
    <img src="<c:url value='/image/ptit-header-icon.png'/>" class="app-shared-logo" alt="PTIT">
    <div>
      <div class="app-shared-brand-top">Học viện Công nghệ Bưu chính Viễn thông</div>
      <div class="app-shared-brand-bottom">HỆ THỐNG XÉT TUYỂN TRỰC TUYẾN</div>
    </div>
  </div>

  <span class="app-shared-menu-toggle" aria-hidden="true">
    <svg viewBox="0 0 1024 1024" focusable="false">
      <path d="M160 256h704a32 32 0 1 1 0 64H160a32 32 0 1 1 0-64zm0 224h704a32 32 0 1 1 0 64H160a32 32 0 1 1 0-64zm0 224h704a32 32 0 1 1 0 64H160a32 32 0 1 1 0-64z"></path>
    </svg>
  </span>

  <div class="app-shared-right">
    <span class="app-shared-action" title="Thông tin" aria-hidden="true">
      <svg viewBox="64 64 896 896" focusable="false">
        <path d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372z"></path>
        <path d="M464 336a48 48 0 1 0 96 0 48 48 0 0 0-96 0zm72 112h-48c-4.4 0-8 3.6-8 8v272c0 4.4 3.6 8 8 8h48c4.4 0 8-3.6 8-8V456c0-4.4-3.6-8-8-8z"></path>
      </svg>
    </span>
    <div class="app-shared-user">
      <div class="app-shared-user-trigger">
        <img src="<c:url value='/image/ptit-header-icon.png'/>" alt="PTIT" class="app-shared-user-ptit">
        <span class="app-shared-user-name">${displayFullName}</span>
      </div>
      <div class="app-shared-user-menu">
        <a href="<c:url value='/account/center'/>">
          <span class="app-shared-menu-ico" aria-hidden="true">
            <svg viewBox="64 64 896 896" focusable="false">
              <path d="M858.5 763.6a374 374 0 00-80.6-119.5 375.63 375.63 0 00-119.5-80.6c-.4-.2-.8-.3-1.2-.5C719.5 518 760 444.7 760 362c0-137-111-248-248-248S264 225 264 362c0 82.7 40.5 156 102.8 201.1-.4.2-.8.3-1.2.5-44.8 18.9-85 46-119.5 80.6a375.63 375.63 0 00-80.6 119.5A371.7 371.7 0 00136 901.8a8 8 0 008 8.2h60c4.4 0 7.9-3.5 8-7.8 2-77.2 33-149.5 87.8-204.3 56.7-56.7 132-87.9 212.2-87.9s155.5 31.2 212.2 87.9C779 752.7 810 825 812 902.2c.1 4.4 3.6 7.8 8 7.8h60a8 8 0 008-8.2c-1-47.8-10.9-94.3-29.5-138.2zM512 534c-45.9 0-89.1-17.9-121.6-50.4S340 407.9 340 362c0-45.9 17.9-89.1 50.4-121.6S466.1 190 512 190s89.1 17.9 121.6 50.4S684 316.1 684 362c0 45.9-17.9 89.1-50.4 121.6S557.9 534 512 534z"></path>
            </svg>
          </span>
          <span>Trang cá nhân</span>
        </a>
        <a href="<c:url value='/logout'/>">
          <span class="app-shared-menu-ico" aria-hidden="true">
            <svg viewBox="64 64 896 896" focusable="false">
              <path d="M868 732h-70.3c-4.8 0-9.3 2.1-12.3 5.8-7.6 9.2-16.1 17.7-25.3 25.2-45.1 36.7-103.2 57-164.1 57H370c-61.9 0-120-20.3-165.1-57.3-45-36.8-71.2-88.5-74-145.7-.2-4.9-4.3-8.8-9.2-8.8H56c-5.5 0-10 4.5-10 10 .3 77.4 33.5 149.5 93.5 203C197 871.6 280.4 900 370 900h226c89.5 0 172.9-28.4 230.5-78.8 16.5-14.5 31.2-31 43.7-49.1 3.1-4.5-.1-10.1-5.2-10.1zM951.2 486.2L815.8 351c-1.5-1.5-3.6-2.3-5.7-2.3-1 0-2 .2-3 .6-3 1.2-5 4.1-5 7.4v86.3H512c-4.4 0-8 3.6-8 8v120c0 4.4 3.6 8 8 8h290.1v86.3c0 3.3 2 6.2 5 7.4 1 .4 2 .6 3 .6 2.1 0 4.2-.8 5.7-2.3l135.4-135.2c3.1-3.1 3.1-8.2 0-11.3z"></path>
            </svg>
          </span>
          <span>Đăng xuất</span>
        </a>
      </div>
    </div>
  </div>
</header>
