<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<%@include file="/common/taglib.jsp"%>

<style>
  body{margin:0}
  .md-page{min-height:100vh;background:#f3f3f4;color:#1f2937;font-family:Arial,Helvetica,sans-serif}
  .md-header{background:#fff;color:#000;box-shadow:0 1px 2px -2px rgba(0,0,0,.1),0 3px 6px 0 rgba(0,0,0,.05);padding:10px 16px;display:flex;align-items:center;justify-content:space-between;margin-bottom:8px}
  .md-brand{display:flex;align-items:center;gap:12px}
  .md-logo-img{width:38px;height:46px;object-fit:contain}
  .md-brand-top{color:#cc0d00;font-weight:700;font-size:16px;line-height:1.25}
  .md-brand-bottom{font-size:14px;line-height:1.25;text-transform:uppercase}

  .md-header-right{display:flex;align-items:center;gap:8px}
  .md-menu-toggle{width:20px;height:20px;color:#111827;display:none;align-items:center;justify-content:center}
  .md-menu-toggle svg{width:100%;height:100%;fill:currentColor}
  .md-action-btn{width:24px;height:24px;color:#111827;display:inline-flex;align-items:center;justify-content:center;cursor:pointer}
  .md-action-btn svg{width:100%;height:100%;fill:currentColor}

  .md-user{position:relative;display:flex;align-items:center;gap:10px;font-size:14px;padding-bottom:8px;margin-bottom:-8px}
  .md-user-trigger{display:flex;align-items:center;gap:8px;user-select:none}
  .md-user-ptit{width:22px;height:22px;object-fit:contain}
  .md-user-name{font-size:14px;font-weight:500;color:#111827;max-width:180px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
  .md-user-info-icon{width:21px;height:21px;display:inline-flex;color:#111827}
  .md-user-info-icon svg{width:100%;height:100%;fill:currentColor}
  .md-user-menu{position:absolute;top:100%;right:0;width:220px;border:1px solid #ececec;border-radius:8px;background:#fff;box-shadow:0 10px 20px rgba(0,0,0,.08);overflow:hidden;z-index:999;display:none}
  .md-user:hover .md-user-menu{display:block}
  .md-user:focus-within .md-user-menu{display:block}
  .md-user-menu a{display:flex;align-items:center;gap:10px;padding:12px 14px;font-size:16px;color:#1f2937;text-decoration:none;border-bottom:1px solid #f3f4f6}
  .md-user-menu a:last-child{border-bottom:0}
  .md-user-menu a:hover{background:#f9fafb}
  .md-menu-icon{width:17px;height:17px;display:inline-flex;color:#6b7280;flex:0 0 17px}
  .md-menu-icon svg{width:100%;height:100%;fill:currentColor}

  .md-wrap{max-width:980px;margin:46px auto 0;padding:0 16px}
  .md-greet{text-align:center;color:#cc0d00;font-weight:700;font-size:24px !important;line-height:1.25;margin:0 0 16px}
  .md-desc{text-align:center;font-size:17px;line-height:1.45;margin:0 0 22px}
  .md-filters{display:flex;justify-content:center;gap:10px;margin-bottom:28px}
  .md-filters select{width:320px;height:38px;border:1px solid #d7d7d7;border-radius:4px;background:#fff;font-size:15px;color:#374151;padding:0 12px}

  .md-cards{display:grid;grid-template-columns:1fr 1fr;gap:22px;margin-bottom:24px}
  .md-card{background:#fff;border:1px solid #e5e7eb;border-radius:6px;overflow:hidden}
  .md-card-link-block{display:block;color:inherit;text-decoration:none}
  .md-card-link-block:hover{box-shadow:0 4px 12px rgba(0,0,0,.08)}
  .md-card-head{background:#ececec;padding:20px 24px;display:flex;align-items:center;gap:12px;font-size:18px;font-weight:700}
  .md-card-icon{width:24px;height:24px;color:#1f2937;flex:0 0 24px}
  .md-card-icon svg{width:100%;height:100%;fill:currentColor}
  .md-card-body{padding:20px 24px 18px;font-size:17px;line-height:1.45}
  .md-illus{height:240px;border:1px solid #e5e7eb;border-radius:6px;background:#f3f4f6;display:flex;align-items:center;justify-content:center;margin-top:16px;padding:8px}
  .md-illus img{width:100%;height:100%;object-fit:contain;display:block}
  .md-card-foot{display:flex;align-items:center;justify-content:space-between;color:#e10600;margin-top:14px;font-size:17px}
  .md-card-foot a{color:#e10600;text-decoration:none}
  .md-card-arrow{font-size:34px;line-height:1}

  .md-trending{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:20px;width:min(1320px,calc(100vw - 40px));margin:8px 0 26px;position:relative;left:50%;transform:translateX(-50%)}
  .md-trend-panel{position:relative;border:1px solid #e5e7eb;border-radius:6px;padding:24px;min-width:0;display:flex;flex-direction:column;overflow:hidden}
  .md-trend-panel.hot-panel{background-image:linear-gradient(135deg,#fff4f4 0%,#ffffff 75%)}
  .md-trend-panel.new-panel{background-image:linear-gradient(135deg,#f3fff6 0%,#ffffff 75%)}
  .md-trend-deco{position:absolute;right:24px;top:-6px;width:31px;height:45px;object-fit:contain;opacity:.95}
  .md-trend-logo{width:33px;height:41px;object-fit:contain;margin-bottom:10px}
  .md-trend-title{font-size:24px;font-weight:700;margin:0 0 6px}
  .md-trend-title .hot-word{color:#e10600}
  .md-trend-title .new-word{color:#10b74a}
  .md-trend-sub{font-size:12px;font-weight:500;color:#374151;margin-bottom:18px}
  .md-trend-grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:12px}
  .md-trend-left{display:flex;align-items:end}
  .md-trend-right{display:grid;gap:12px;min-width:0}
  .md-chip{border-radius:4px;padding:10px 8px;background-color:transparent;box-shadow:rgba(0,0,0,.1) 2px 1px 2px 2px,rgba(0,0,0,.05) 0 3px 6px 0;background-image:linear-gradient(rgba(255,0,0,0),rgba(255,255,255,.5));min-width:0;min-height:64px;display:flex;flex-direction:column;justify-content:center}
  .md-chip.new{background-image:linear-gradient(rgba(16,183,74,0),rgba(255,255,255,.5))}
  .md-chip-sm{border-radius:26px;background-color:#ffc8c8;color:#ff0000;font-size:8px;font-weight:700;width:30px;height:15px;display:flex;align-items:center;justify-content:center;margin-bottom:6px}
  .md-chip-sm.new{color:#10b74a;background:#dcfce7}
  .md-chip-text{display:block;min-width:0;font-size:14px;font-weight:700;text-align:left;white-space:break-spaces;line-height:1.25}
  .md-chip-link{color:inherit;text-decoration:none;display:block}
  .md-chip-link:hover .md-chip-text{text-decoration:underline}

  .md-footer{background:#eceff3;border-top:1px solid #e5e7eb;padding:22px 0;margin-top:18px}
  .md-footer-grid{max-width:1220px;margin:0 auto;padding:0 16px;display:grid;grid-template-columns:1.3fr 1fr 1fr;gap:18px}
  .md-foot-title{font-size:18px;font-weight:700;color:#6b7280;margin-bottom:6px}
  .md-foot-logo{width:56px;height:68px;object-fit:contain;display:block;margin-bottom:10px}
  .md-foot-big{font-size:24px;font-weight:700;margin-bottom:6px}
  .md-foot-txt{font-size:17px;line-height:1.45;margin-bottom:2px}

  @media (max-width:1200px){
    .md-brand-top{font-size:16px}.md-brand-bottom{font-size:14px}
    .md-user{font-size:16px;gap:10px}
    .md-wrap{max-width:940px}
    .md-greet{font-size:24px !important}.md-desc{font-size:18px}
    .md-filters select{font-size:15px;width:280px;height:38px}
    .md-card-head{font-size:17px}.md-card-body{font-size:17px}.md-illus{height:220px}
    .md-card-foot{font-size:17px}.md-card-arrow{font-size:26px}
    .md-trend-panel{padding:20px 16px 16px}
    .md-trend-title{font-size:22px}
    .md-trend-sub{font-size:15px}
    .md-chip{min-height:62px}
    .md-chip-sm{font-size:13px}
  }
  @media (max-width:768px){
    .md-menu-toggle{display:inline-flex}
    .md-brand-bottom{display:none}
    .md-user-name{max-width:92px}
    .md-greet{font-size:22px !important}
    .md-desc{font-size:18px}
    .md-filters{flex-direction:column}
    .md-filters select{width:100%;font-size:16px}
    .md-card-head{font-size:26px}
    .md-card-body{font-size:18px}
    .md-illus{height:190px}
    .md-card-foot{font-size:22px}
    .md-card-arrow{font-size:28px}
    .md-cards,.md-trending,.md-footer-grid{grid-template-columns:1fr}
    .md-trending{width:100%;left:0;transform:none}
    .md-trend-grid{grid-template-columns:1fr}
  }
</style>

<div class="md-page">
  <%@ include file="/common/web/header-app.jsp" %>

  <main class="md-wrap">
    <div class="md-greet" style="font-size:24px !important;">Xin chào ${greetingName}, 👋</div>
    <div class="md-desc">Bạn đang tham gia hệ thống xét tuyển trực tuyến của PTIT<br>Vui lòng chọn mục đích để tiếp tục:</div>

    <div class="md-filters">
      <select><option>Chính quy</option><option>Liên thông</option></select>
      <select><option>2025</option><option>2026</option></select>
    </div>

    <section class="md-cards">
      <a class="md-card md-card-link-block" href="<c:url value='/danhsachhoso'/>">
        <div class="md-card-head">
          <span class="md-card-icon" aria-hidden="true">
            <svg viewBox="0 0 24 24">
              <path d="M12 3 1.5 8.5 12 14l8.5-4.5V16h2V8.5L12 3Zm-6.5 9.3V17c0 2 3 3.5 6.5 3.5s6.5-1.5 6.5-3.5v-4.7L12 16l-6.5-3.7Z"/>
            </svg>
          </span>
          <span>Nộp hồ sơ trực tuyến</span>
        </div>
        <div class="md-card-body">Bạn đang tham gia hệ thống xét tuyển trực tuyến đại học của PTIT
          <div class="md-illus"><img src="<c:url value='/image/mucdich-xet-tuyen.png'/>" alt="Nộp hồ sơ trực tuyến"></div>
          <div class="md-card-foot"><span>Xem chi tiết</span><span class="md-card-arrow">→</span></div>
        </div>
      </a>
      <article class="md-card">
        <div class="md-card-head">
          <span class="md-card-icon" aria-hidden="true">
            <svg viewBox="0 0 24 24">
              <path d="M3 4h18v12h-7v2h3v2H7v-2h3v-2H3V4Zm2 2v8h14V6H5Zm7 1 4 2.5L12 12 8 9.5 12 7Zm0 1.7-1.3.8 1.3.8 1.3-.8-1.3-.8Z"/>
            </svg>
          </span>
          <span>Nhập học trực tuyến</span>
        </div>
        <div class="md-card-body">Bạn đang tham gia hệ thống nhập học trực tuyến đại học của PTIT
          <div class="md-illus"><img src="<c:url value='/image/mucdich-nhap-hoc.png'/>" alt="Nhập học trực tuyến"></div>
          <div class="md-card-foot"><a href="#">Xem chi tiết</a><span class="md-card-arrow">→</span></div>
        </div>
      </article>
    </section>

    <section class="md-trending">
      <article class="md-trend-panel hot-panel">
        <img src="<c:url value='/image/top-hot-corner.svg'/>" alt="HOT" class="md-trend-deco">
        <img src="<c:url value='/image/ptit-header-icon.png'/>" alt="PTIT" class="md-trend-logo">
        <div class="md-trend-title">Top ngành <span class="hot-word">HOT</span> nhất</div>
        <div class="md-trend-sub">Tổng hợp một số ngành được yêu thích nhất qua các năm tuyển sinh</div>
        <div class="md-trend-grid">
          <div class="md-trend-left">
            <a class="md-chip md-chip-link" href="https://daotao.ptit.edu.vn/nganhhoc/7480201" target="_blank" rel="noopener noreferrer">
              <span class="md-chip-sm">HOT</span>
              <span class="md-chip-text">Công nghệ thông tin</span>
            </a>
          </div>
          <div class="md-trend-right">
            <a class="md-chip md-chip-link" href="https://daotao.ptit.edu.vn/nganhhoc/7480101" target="_blank" rel="noopener noreferrer"><span class="md-chip-sm">HOT</span><span class="md-chip-text">Khoa học máy tính (định hướng Khoa học dữ liệu)</span></a>
            <a class="md-chip md-chip-link" href="https://daotao.ptit.edu.vn/nganhhoc/7480201" target="_blank" rel="noopener noreferrer"><span class="md-chip-sm">HOT</span><span class="md-chip-text">Công nghệ thông tin (Cử nhân, định hướng ứng dụng)</span></a>
            <a class="md-chip md-chip-link" href="https://daotao.ptit.edu.vn/nganhhoc/7480102" target="_blank" rel="noopener noreferrer"><span class="md-chip-sm">HOT</span><span class="md-chip-text">Kỹ thuật dữ liệu (ngành Mạng máy tính và truyền thông dữ liệu)</span></a>
          </div>
        </div>
      </article>

      <article class="md-trend-panel new-panel">
        <img src="<c:url value='/image/top-new-corner.svg'/>" alt="NEW" class="md-trend-deco">
        <img src="<c:url value='/image/ptit-header-icon.png'/>" alt="PTIT" class="md-trend-logo">
        <div class="md-trend-title">Top ngành <span class="new-word">MỚI</span> nhất</div>
        <div class="md-trend-sub">Tổng hợp một số ngành mới nhất hiện nay</div>
        <div class="md-trend-grid">
          <div class="md-trend-left">
            <a class="md-chip md-chip-link new" href="https://daotao.ptit.edu.vn/nganhhoc/7480201" target="_blank" rel="noopener noreferrer">
              <span class="md-chip-sm new">NEW</span>
              <span class="md-chip-text">Công nghệ thông tin (chất lượng cao)</span>
            </a>
          </div>
          <div class="md-trend-right">
            <a class="md-chip md-chip-link new" href="https://daotao.ptit.edu.vn/nganhhoc/7480201" target="_blank" rel="noopener noreferrer"><span class="md-chip-sm new">NEW</span><span class="md-chip-text">Công nghệ thông tin (Cử nhân, định hướng quốc tế)</span></a>
            <a class="md-chip md-chip-link new" href="https://daotao.ptit.edu.vn/nganhhoc/7480102" target="_blank" rel="noopener noreferrer"><span class="md-chip-sm new">NEW</span><span class="md-chip-text">Kỹ thuật dữ liệu (ngành Mạng máy tính và truyền thông dữ liệu)</span></a>
            <div class="md-chip new"><span class="md-chip-sm new">NEW</span><span class="md-chip-text">Kế toán chất lượng cao (chuẩn quốc tế)</span></div>
          </div>
        </div>
      </article>
    </section>
  </main>

  <%@ include file="/common/web/footer-app.jsp" %>
</div>
