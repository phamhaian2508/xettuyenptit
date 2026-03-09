<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
  .app-shared-footer{background:#eceff3;border-top:1px solid #e5e7eb;padding:22px 0;margin-top:18px}
  .app-shared-footer-grid{max-width:1220px;margin:0 auto;padding:0 16px;display:grid;grid-template-columns:1.3fr 1fr 1fr;gap:18px}
  .app-shared-foot-title{font-size:18px;font-weight:700;color:#6b7280;margin-bottom:6px}
  .app-shared-foot-logo{width:56px;height:68px;object-fit:contain;display:block;margin-bottom:10px}
  .app-shared-foot-big{font-size:24px;font-weight:700;margin-bottom:6px}
  .app-shared-foot-txt{font-size:17px;line-height:1.45;margin-bottom:2px}

  @media (max-width:768px){
    .app-shared-footer-grid{grid-template-columns:1fr}
  }
</style>

<footer class="app-shared-footer">
  <div class="app-shared-footer-grid">
    <div>
      <img src="<c:url value='/image/ptit-header-icon.png'/>" alt="PTIT" class="app-shared-foot-logo">
      <div class="app-shared-foot-big">HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH<br>VIỄN THÔNG</div>
      <div class="app-shared-foot-txt">Là đơn vị đào tạo, nghiên cứu trọng điểm, chủ lực của ngành thông tin và truyền thông tại Việt Nam.</div>
    </div>
    <div>
      <div class="app-shared-foot-title">THÔNG TIN LIÊN HỆ</div>
      <div class="app-shared-foot-txt">Email: tuyensinh@ptit.edu.vn</div>
      <div class="app-shared-foot-txt">Website: https://portal.ptit.edu.vn</div>
      <div class="app-shared-foot-txt">Website tuyển sinh: https://tuyensinh.ptit.edu.vn</div>
      <div class="app-shared-foot-txt">Số điện thoại liên hệ: 024 3756 2186</div>
    </div>
    <div>
      <div class="app-shared-foot-title">ĐỊA CHỈ HỌC VIỆN</div>
      <div class="app-shared-foot-txt">Trụ sở chính: 122 Hoàng Quốc Việt, Cầu Giấy, Hà Nội</div>
      <div class="app-shared-foot-txt">Cơ sở Hà Nội: Km10 Nguyễn Trãi, Hà Đông, Hà Nội</div>
      <div class="app-shared-foot-txt">Học viện cơ sở TP.HCM: 11 Nguyễn Đình Chiểu, Quận 1</div>
      <div class="app-shared-foot-txt">Cơ sở TP.HCM: Đường Man Thiện, P. Hiệp Phú, Quận 9</div>
    </div>
  </div>
</footer>
