<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<%@include file="/common/taglib.jsp"%>

<style>
  body{margin:0}
  .hs-page{min-height:100vh;background:#f3f3f4;color:#1f2937;font-family:Arial,Helvetica,sans-serif}
  .hs-header{background:#fff;color:#000;box-shadow:0 1px 2px -2px rgba(0,0,0,.1),0 3px 6px 0 rgba(0,0,0,.05);padding:10px 16px;display:flex;align-items:center;justify-content:space-between;margin-bottom:8px}
  .hs-brand{display:flex;align-items:center;gap:12px}
  .hs-logo{width:38px;height:46px;object-fit:contain}
  .hs-brand-top{color:#cc0d00;font-weight:700;font-size:16px;line-height:1.25}
  .hs-brand-bottom{font-size:14px;line-height:1.25;text-transform:uppercase}

  .hs-header-right{display:flex;align-items:center;gap:8px}
  .hs-menu-toggle{width:20px;height:20px;color:#111827;display:none;align-items:center;justify-content:center}
  .hs-menu-toggle svg{width:100%;height:100%;fill:currentColor}
  .hs-action-btn{width:24px;height:24px;color:#111827;display:inline-flex;align-items:center;justify-content:center;cursor:pointer}
  .hs-action-btn svg{width:100%;height:100%;fill:currentColor}

  .hs-user{position:relative;display:flex;align-items:center;gap:10px;font-size:14px;padding-bottom:8px;margin-bottom:-8px}
  .hs-user-trigger{display:flex;align-items:center;gap:8px;user-select:none}
  .hs-user-ptit{width:22px;height:22px;object-fit:contain}
  .hs-user-name{font-size:14px;font-weight:500;color:#111827;max-width:180px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
  .hs-user-menu{position:absolute;top:100%;right:0;width:220px;border:1px solid #ececec;border-radius:8px;background:#fff;box-shadow:0 10px 20px rgba(0,0,0,.08);overflow:hidden;z-index:999;display:none}
  .hs-user:hover .hs-user-menu,.hs-user:focus-within .hs-user-menu{display:block}
  .hs-user-menu a{display:flex;align-items:center;gap:10px;padding:12px 14px;font-size:16px;color:#1f2937;text-decoration:none;border-bottom:1px solid #f3f4f6}
  .hs-user-menu a:last-child{border-bottom:0}
  .hs-user-menu a:hover{background:#f9fafb}
  .hs-menu-icon{width:17px;height:17px;display:inline-flex;color:#6b7280;flex:0 0 17px}
  .hs-menu-icon svg{width:100%;height:100%;fill:currentColor}

  .hs-wrap{max-width:1320px;margin:56px auto 0;padding:0 16px}
  .hs-top{display:flex;align-items:flex-start;justify-content:space-between;margin-bottom:24px}
  .hs-title{margin:0;font-size:42px;font-weight:700}
  .hs-filters{display:flex;gap:10px}
  .hs-filters select{width:230px;height:38px;border:1px solid #d7d7d7;border-radius:4px;background:#fff;font-size:15px;color:#374151;padding:0 12px}

  .hs-trending-wrap{border:1px solid #e5e7eb;border-radius:8px;background:#fff;padding:16px;margin-bottom:24px}
  .hs-trending{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:16px}
  .hs-panel{position:relative;border:1px solid #e5e7eb;border-radius:6px;padding:24px;min-width:0;overflow:hidden}
  .hs-panel.hot-panel{background-image:linear-gradient(135deg,#fff4f4 0%,#ffffff 75%)}
  .hs-panel.new-panel{background-image:linear-gradient(135deg,#f3fff6 0%,#ffffff 75%)}
  .hs-panel-deco{position:absolute;right:24px;top:-6px;width:31px;height:45px;object-fit:contain;opacity:.95}
  .hs-panel-logo{width:33px;height:41px;object-fit:contain;margin-bottom:10px}
  .hs-panel-title{font-size:24px;font-weight:700;margin:0 0 6px}
  .hs-panel-title .hot{color:#e10600}
  .hs-panel-title .new{color:#10b74a}
  .hs-panel-sub{font-size:12px;font-weight:500;color:#374151;margin-bottom:18px}
  .hs-grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:12px}
  .hs-left{display:flex;align-items:end}
  .hs-right{display:grid;gap:12px;min-width:0}
  .hs-chip{border-radius:4px;padding:10px 8px;background-color:transparent;box-shadow:rgba(0,0,0,.1) 2px 1px 2px 2px,rgba(0,0,0,.05) 0 3px 6px 0;background-image:linear-gradient(rgba(255,0,0,0),rgba(255,255,255,.5));min-width:0;min-height:64px;display:flex;flex-direction:column;justify-content:center}
  .hs-chip.new{background-image:linear-gradient(rgba(16,183,74,0),rgba(255,255,255,.5))}
  .hs-chip-sm{border-radius:26px;background-color:#ffc8c8;color:#ff0000;font-size:8px;font-weight:700;width:30px;height:15px;display:flex;align-items:center;justify-content:center;margin-bottom:6px}
  .hs-chip-sm.new{color:#10b74a;background:#dcfce7}
  .hs-chip-text{display:block;min-width:0;font-size:14px;font-weight:700;text-align:left;white-space:break-spaces;line-height:1.25}
  .hs-chip-link{color:inherit;text-decoration:none}
  .hs-chip-link:hover .hs-chip-text{text-decoration:underline}

  .hs-footer{background:#eceff3;border-top:1px solid #e5e7eb;padding:22px 0}
  .hs-footer-grid{max-width:1320px;margin:0 auto;padding:0 16px;display:grid;grid-template-columns:1.3fr 1fr 1fr;gap:18px}
  .hs-foot-title{font-size:18px;font-weight:700;color:#8a93a5;margin-bottom:6px}
  .hs-foot-logo{width:56px;height:68px;object-fit:contain;display:block;margin-bottom:10px}
  .hs-foot-big{font-size:24px;font-weight:700;margin-bottom:6px}
  .hs-foot-txt{font-size:17px;line-height:1.45;margin-bottom:2px}

  @media (max-width:992px){
    .hs-top{flex-direction:column;gap:12px}
    .hs-filters{width:100%}
    .hs-filters select{flex:1}
    .hs-trending{grid-template-columns:1fr}
    .hs-footer-grid{grid-template-columns:1fr}
    .hs-menu-toggle{display:inline-flex}
    .hs-brand-bottom{display:none}
    .hs-user-name{max-width:92px}
  }
</style>

<div class="hs-page">
  <%@ include file="/common/web/header-app.jsp" %>

  <main class="hs-wrap">
    <div class="hs-top">
      <h1 class="hs-title">Hồ sơ tuyển sinh</h1>
      <div class="hs-filters">
        <select><option>Chính quy</option><option>Liên thông</option></select>
        <select><option>2025</option><option>2026</option></select>
      </div>
    </div>

    <section class="hs-trending-wrap">
      <div class="hs-trending">
        <article class="hs-panel hot-panel">
          <img src="<c:url value='/image/top-hot-corner.svg'/>" alt="HOT" class="hs-panel-deco">
          <img src="<c:url value='/image/ptit-header-icon.png'/>" alt="PTIT" class="hs-panel-logo">
          <div class="hs-panel-title">Top ngành <span class="hot">HOT</span> nhất</div>
          <div class="hs-panel-sub">Tổng hợp một số ngành được yêu thích nhất qua các năm tuyển sinh</div>
          <div class="hs-grid">
            <div class="hs-left">
              <a class="hs-chip hs-chip-link" href="https://daotao.ptit.edu.vn/nganhhoc/7480201" target="_blank" rel="noopener noreferrer">
                <span class="hs-chip-sm">HOT</span><span class="hs-chip-text">Công nghệ thông tin</span>
              </a>
            </div>
            <div class="hs-right">
              <a class="hs-chip hs-chip-link" href="https://daotao.ptit.edu.vn/nganhhoc/7480101" target="_blank" rel="noopener noreferrer"><span class="hs-chip-sm">HOT</span><span class="hs-chip-text">Khoa học máy tính (định hướng Khoa học dữ liệu)</span></a>
              <a class="hs-chip hs-chip-link" href="https://daotao.ptit.edu.vn/nganhhoc/7480201" target="_blank" rel="noopener noreferrer"><span class="hs-chip-sm">HOT</span><span class="hs-chip-text">Công nghệ thông tin (Cử nhân, định hướng ứng dụng)</span></a>
              <a class="hs-chip hs-chip-link" href="https://daotao.ptit.edu.vn/nganhhoc/7480102" target="_blank" rel="noopener noreferrer"><span class="hs-chip-sm">HOT</span><span class="hs-chip-text">Kỹ thuật dữ liệu (ngành Mạng máy tính và truyền thông dữ liệu)</span></a>
            </div>
          </div>
        </article>

        <article class="hs-panel new-panel">
          <img src="<c:url value='/image/top-new-corner.svg'/>" alt="NEW" class="hs-panel-deco">
          <img src="<c:url value='/image/ptit-header-icon.png'/>" alt="PTIT" class="hs-panel-logo">
          <div class="hs-panel-title">Top ngành <span class="new">MỚI</span> nhất</div>
          <div class="hs-panel-sub">Tổng hợp một số ngành mới nhất hiện nay</div>
          <div class="hs-grid">
            <div class="hs-left">
              <a class="hs-chip hs-chip-link new" href="https://daotao.ptit.edu.vn/nganhhoc/7480201" target="_blank" rel="noopener noreferrer">
                <span class="hs-chip-sm new">NEW</span><span class="hs-chip-text">Công nghệ thông tin (chất lượng cao)</span>
              </a>
            </div>
            <div class="hs-right">
              <a class="hs-chip hs-chip-link new" href="https://daotao.ptit.edu.vn/nganhhoc/7480201" target="_blank" rel="noopener noreferrer"><span class="hs-chip-sm new">NEW</span><span class="hs-chip-text">Công nghệ thông tin (Cử nhân, định hướng quốc tế)</span></a>
              <a class="hs-chip hs-chip-link new" href="https://daotao.ptit.edu.vn/nganhhoc/7480102" target="_blank" rel="noopener noreferrer"><span class="hs-chip-sm new">NEW</span><span class="hs-chip-text">Kỹ thuật dữ liệu (ngành Mạng máy tính và truyền thông dữ liệu)</span></a>
              <div class="hs-chip new"><span class="hs-chip-sm new">NEW</span><span class="hs-chip-text">Kế toán chất lượng cao (chuẩn quốc tế)</span></div>
            </div>
          </div>
        </article>
      </div>
    </section>
  </main>

  <%@ include file="/common/web/footer-app.jsp" %>
</div>
