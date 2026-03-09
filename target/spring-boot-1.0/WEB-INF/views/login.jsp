<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Xét tuyển PTIT</title>
    <style>
        * { box-sizing: border-box; }
        html, body {
            margin: 0;
            height: 100%;
            font-family: "Roboto", "Helvetica Neue", Arial, sans-serif;
            font-size: 14px;
            line-height: 1.5715;
            background: #efefef;
            color: #262626;
            overflow: hidden;
        }
        .page {
            height: 100vh;
            display: grid;
            grid-template-columns: 68% 32%;
            background: #efefef;
            overflow: hidden;
        }
        .left { overflow: hidden; }
        .left img { width: 100%; height: 100%; object-fit: cover; display: block; }

        .right {
            position: relative;
            padding: 64px 40px 120px;
        }
        .main {
            width: 100%;
            max-width: 380px;
            margin: 0 auto;
        }

        .title-wrap {
            width: max-content;
            max-width: 100%;
            margin: 0 auto 30px;
        }

        .head {
            text-align: center;
            font-size: 16px;
            font-weight: 700;
            margin: 0 0 4px;
            line-height: 1.35;
            white-space: nowrap;
            letter-spacing: 0.2px;
        }
        .subhead {
            text-align: center;
            font-size: 23px;
            line-height: 1.2;
            font-weight: 700;
            color: #cc0d00;
            margin: 0;
            text-transform: uppercase;
            white-space: nowrap;
            letter-spacing: 0.2px;
        }

        .label {
            font-size: 14px;
            font-weight: 500;
            margin: 0 0 8px;
            color: rgba(0, 0, 0, 0.88);
        }
        .field {
            height: 42px;
            border: 1px solid #d9d9d9;
            border-radius: 6px;
            background: #fff;
            display: flex;
            align-items: center;
            padding: 0 10px;
        }
        .icon {
            color: #ff4d4f;
            width: 18px;
            min-width: 18px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
        }
        .icon svg { width: 1em; height: 1em; }
        .suffix {
            color: #9e9e9e;
            width: 18px;
            min-width: 18px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
        }
        .input {
            flex: 1;
            border: 0;
            outline: 0;
            height: 24px;
            margin: 0 8px;
            padding: 0 10px;
            background: transparent;
            font-size: 16px;
            font-weight: 400;
            color: #202020;
        }
        .input::placeholder { color: #b5b5b5; }

        .error-line {
            color: #ff4d4f;
            font-size: 12px;
            min-height: 16px;
            line-height: 1.25;
            margin-top: 4px;
            margin-bottom: 10px;
        }

        .btn {
            width: 100%;
            height: 42px;
            border: 0;
            border-radius: 8px;
            background: #d90800;
            color: #fff;
            font-size: 16px;
            font-weight: 500;
            margin-top: 6px;
            cursor: pointer;
        }
        .btn:hover { background: #c10700; }

        .forgot {
            display: block;
            text-align: center;
            margin-top: 14px;
            text-decoration: none;
            color: #de1000;
            font-size: 14px;
            font-weight: 400;
        }

        .sys-alert {
            border: 1px solid #f3bbbb;
            background: #fff2f2;
            color: #a8071a;
            border-radius: 6px;
            padding: 8px 12px;
            margin: 0 0 12px;
            font-size: 14px;
        }

        .footer {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 22px;
            text-align: center;
            color: rgba(0, 0, 0, 0.45);
            font-size: 13px;
            font-weight: 400;
            line-height: 2;
        }

        .guide-modal-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.45);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            padding: 16px;
        }
        .guide-modal-overlay.show { display: flex; }

        .guide-modal {
            width: 100%;
            max-width: 520px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08), 0 3px 6px -4px rgba(0, 0, 0, 0.12);
            overflow: hidden;
        }
        .guide-header {
            position: relative;
            padding: 14px 18px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 20px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .guide-info-icon {
            color: #1890ff;
            width: 22px;
            height: 22px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .guide-info-icon svg { width: 100%; height: 100%; fill: currentColor; }
        .guide-close {
            position: absolute;
            top: 10px;
            right: 10px;
            border: 0;
            background: transparent;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            color: rgba(0, 0, 0, 0.45);
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .guide-close:hover { background: rgba(0, 0, 0, 0.06); }
        .guide-close svg { width: 1em; height: 1em; fill: currentColor; }

        .guide-body { padding: 18px; }
        .guide-text { margin-bottom: 10px; font-size: 14px; }
        .guide-box {
            background: #f6faff;
            border: 1px solid #e6f7ff;
            border-radius: 6px;
            padding: 12px;
            margin-bottom: 12px;
        }
        .guide-row {
            display: flex;
            align-items: center;
            margin-bottom: 6px;
            font-size: 14px;
        }
        .guide-row:last-child { margin-bottom: 0; }
        .guide-row-icon {
            margin-right: 8px;
            font-size: 18px;
            width: 18px;
            height: 18px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .guide-row-icon svg { width: 100%; height: 100%; fill: currentColor; }
        .guide-row-icon.user { color: #52c41a; }
        .guide-row-icon.lock { color: #faad14; }
        .guide-example { color: #cc0d00; margin-left: 4px; }

        .guide-note {
            margin: 0;
            color: rgba(0, 0, 0, 0.45);
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .guide-note-icon {
            color: #faad14;
            width: 16px;
            height: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .guide-note-icon svg { width: 100%; height: 100%; fill: currentColor; }

        .guide-footer {
            padding: 10px 18px 18px;
        }
        .guide-ok {
            width: 100%;
            height: 40px;
            border: 1px solid #d90800;
            border-radius: 8px;
            background: #d90800;
            color: #fff;
            font-size: 14px;
            font-weight: 400;
            box-shadow: 0 2px 0 rgba(217, 8, 0, 0.18);
            cursor: pointer;
        }
        .guide-ok:hover {
            background: #ff3028;
            border-color: #ff3028;
        }
        .guide-ok:active {
            background: #b30700;
            border-color: #b30700;
        }

        @media (max-width: 1200px) {
            .page { grid-template-columns: 1fr; }
            .left { display: none; }
            .right { padding: 24px 20px 100px; }
            .main { max-width: 520px; }
        }
    </style>
</head>
<body>
<div class="page">
    <div class="left"><img src="<c:url value='/image/ptit-login-left.png'/>" alt="PTIT"></div>

    <div class="right">
        <div class="main">
            <div class="title-wrap">
                <h1 class="head">HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG</h1>
                <div class="subhead">HỆ THỐNG XÉT TUYỂN TRỰC TUYẾN</div>
            </div>

            <c:if test="${param.incorrectAccount != null}"><div class="sys-alert">Tên đăng nhập hoặc mật khẩu không đúng</div></c:if>
            <c:if test="${param.accessDenied != null}"><div class="sys-alert">Bạn không có quyền truy cập</div></c:if>
            <c:if test="${param.sessionTimeout != null}"><div class="sys-alert">Phiên đăng nhập đã hết hạn</div></c:if>

            <form action="<c:url value='/j_spring_security_check'/>" method="post" autocomplete="off" id="loginForm">
                <div class="label">Tên đăng nhập</div>
                <div class="field">
                    <span class="icon" aria-hidden="true">
                        <svg viewBox="64 64 896 896" fill="currentColor"><path d="M858.5 763.6a374 374 0 00-80.6-119.5 375.63 375.63 0 00-119.5-80.6c-.4-.2-.8-.3-1.2-.5C719.5 518 760 444.7 760 362c0-137-111-248-248-248S264 225 264 362c0 82.7 40.5 156 102.8 201.1-.4.2-.8.3-1.2.5-44.8 18.9-85 46-119.5 80.6a375.63 375.63 0 00-80.6 119.5A371.7 371.7 0 00136 901.8a8 8 0 008 8.2h60c4.4 0 7.9-3.5 8-7.8 2-77.2 33-149.5 87.8-204.3 56.7-56.7 132-87.9 212.2-87.9s155.5 31.2 212.2 87.9C779 752.7 810 825 812 902.2c.1 4.4 3.6 7.8 8 7.8h60a8 8 0 008-8.2c-1-47.8-10.9-94.3-29.5-138.2zM512 534c-45.9 0-89.1-17.9-121.6-50.4S340 407.9 340 362c0-45.9 17.9-89.1 50.4-121.6S466.1 190 512 190s89.1 17.9 121.6 50.4S684 316.1 684 362c0 45.9-17.9 89.1-50.4 121.6S557.9 534 512 534z"></path></svg>
                    </span>
                    <input id="username" name="j_username" class="input" type="text" placeholder="Tài khoản" value="${param.j_username}">
                    <span class="suffix">&#8855;</span>
                </div>
                <div class="error-line" id="usernameErr">Nhập tên đăng nhập</div>

                <div class="label">Mật khẩu</div>
                <div class="field">
                    <span class="icon" aria-hidden="true">
                        <svg viewBox="64 64 896 896" fill="currentColor"><path d="M832 464h-68V240c0-70.7-57.3-128-128-128H388c-70.7 0-128 57.3-128 128v224h-68c-17.7 0-32 14.3-32 32v384c0 17.7 14.3 32 32 32h640c17.7 0 32-14.3 32-32V496c0-17.7-14.3-32-32-32zM332 240c0-30.9 25.1-56 56-56h248c30.9 0 56 25.1 56 56v224H332V240zm460 600H232V536h560v304zM484 701v53c0 4.4 3.6 8 8 8h40c4.4 0 8-3.6 8-8v-53a48.01 48.01 0 10-56 0z"></path></svg>
                    </span>
                    <input id="password" name="j_password" class="input" type="password" placeholder="Mật khẩu">
                    <span class="suffix">&#128065;</span>
                </div>
                <div class="error-line" id="passwordErr">Nhập mật khẩu</div>

                <button class="btn" type="submit">Đăng nhập</button>
                <a href="#" class="forgot">Quên mật khẩu ?</a>
            </form>
        </div>

        <div class="footer">Học viện Công nghệ Bưu chính Viễn thông<br>© 2026 PTIT</div>
    </div>
</div>

<div class="guide-modal-overlay" id="guideModal" aria-hidden="true">
    <div class="guide-modal" role="dialog" aria-modal="true" aria-labelledby="guideTitle">
        <div class="guide-header">
            <span class="guide-info-icon" aria-hidden="true">
                <svg viewBox="64 64 896 896"><path d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372z"></path><path d="M464 336a48 48 0 1096 0 48 48 0 10-96 0zm72 112h-48c-4.4 0-8 3.6-8 8v272c0 4.4 3.6 8 8 8h48c4.4 0 8-3.6 8-8V456c0-4.4-3.6-8-8-8z"></path></svg>
            </span>
            <span id="guideTitle">Hướng dẫn đăng nhập</span>
            <button type="button" class="guide-close" id="guideClose" aria-label="Đóng">
                <svg viewBox="64 64 896 896"><path d="M799.86 166.31c.02 0 .04.02.08.06l57.69 57.7c.04.03.05.05.06.08a.12.12 0 010 .06c0 .03-.02.05-.06.09L569.93 512l287.7 287.7c.04.04.05.06.06.09a.12.12 0 010 .07c0 .02-.02.04-.06.08l-57.7 57.69c-.03.04-.05.05-.07.06a.12.12 0 01-.07 0c-.03 0-.05-.02-.09-.06L512 569.93l-287.7 287.7c-.04.04-.06.05-.09.06a.12.12 0 01-.07 0c-.02 0-.04-.02-.08-.06l-57.69-57.7c-.04-.03-.05-.05-.06-.07a.12.12 0 010-.07c0-.03.02-.05.06-.09L454.07 512l-287.7-287.7c-.04-.04-.05-.06-.06-.09a.12.12 0 010-.07c0-.02.02-.04.06-.08l57.7-57.69c.03-.04.05-.05.07-.06a.12.12 0 01.07 0c.03 0 .05.02.09.06L512 454.07l287.7-287.7c.04-.04.06-.05.09-.06a.12.12 0 01.07 0z"></path></svg>
            </button>
        </div>
        <div class="guide-body">
            <div class="guide-text">Thí sinh nhập học trực tuyến dùng <b>Tên đăng nhập</b> và <b>Mật khẩu</b> được cấp.</div>
            <div class="guide-box">
                <div class="guide-row">
                    <span class="guide-row-icon user" aria-hidden="true">
                        <svg viewBox="64 64 896 896"><path d="M858.5 763.6a374 374 0 00-80.6-119.5 375.63 375.63 0 00-119.5-80.6c-.4-.2-.8-.3-1.2-.5C719.5 518 760 444.7 760 362c0-137-111-248-248-248S264 225 264 362c0 82.7 40.5 156 102.8 201.1-.4.2-.8.3-1.2.5-44.8 18.9-85 46-119.5 80.6a375.63 375.63 0 00-80.6 119.5A371.7 371.7 0 00136 901.8a8 8 0 008 8.2h60c4.4 0 7.9-3.5 8-7.8 2-77.2 33-149.5 87.8-204.3 56.7-56.7 132-87.9 212.2-87.9s155.5 31.2 212.2 87.9C779 752.7 810 825 812 902.2c.1 4.4 3.6 7.8 8 7.8h60a8 8 0 008-8.2c-1-47.8-10.9-94.3-29.5-138.2zM512 534c-45.9 0-89.1-17.9-121.6-50.4S340 407.9 340 362c0-45.9 17.9-89.1 50.4-121.6S466.1 190 512 190s89.1 17.9 121.6 50.4S684 316.1 684 362c0 45.9-17.9 89.1-50.4 121.6S557.9 534 512 534z"></path></svg>
                    </span>
                    <span>Tên đăng nhập là <b>CCCD/CMND</b> của thí sinh,<span class="guide-example">VD: 001234567891</span></span>
                </div>
                <div class="guide-row">
                    <span class="guide-row-icon lock" aria-hidden="true">
                        <svg viewBox="64 64 896 896"><path d="M832 464h-68V240c0-70.7-57.3-128-128-128H388c-70.7 0-128 57.3-128 128v224h-68c-17.7 0-32 14.3-32 32v384c0 17.7 14.3 32 32 32h640c17.7 0 32-14.3 32-32V496c0-17.7-14.3-32-32-32zM332 240c0-30.9 25.1-56 56-56h248c30.9 0 56 25.1 56 56v224H332V240zm460 600H232V536h560v304zM484 701v53c0 4.4 3.6 8 8 8h40c4.4 0 8-3.6 8-8v-53a48.01 48.01 0 10-56 0z"></path></svg>
                    </span>
                    <span>Mật khẩu là <b>ngày sinh</b> của thí sinh,<span class="guide-example">VD: 01012007</span></span>
                </div>
            </div>
            <p class="guide-note">
                <span class="guide-note-icon" aria-hidden="true">
                    <svg viewBox="64 64 896 896"><path d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372z"></path><path d="M464 336a48 48 0 1096 0 48 48 0 10-96 0zm72 112h-48c-4.4 0-8 3.6-8 8v272c0 4.4 3.6 8 8 8h48c4.4 0 8-3.6 8-8V456c0-4.4-3.6-8-8-8z"></path></svg>
                </span>
                Mọi thắc mắc vui lòng liên hệ bộ phận hỗ trợ.
            </p>
        </div>
        <div class="guide-footer">
            <button type="button" class="guide-ok" id="guideOk">Đã hiểu</button>
        </div>
    </div>
</div>

<script>
(function () {
    var form = document.getElementById('loginForm');
    var username = document.getElementById('username');
    var password = document.getElementById('password');
    var usernameErr = document.getElementById('usernameErr');
    var passwordErr = document.getElementById('passwordErr');

    var guideModal = document.getElementById('guideModal');
    var guideClose = document.getElementById('guideClose');
    var guideOk = document.getElementById('guideOk');

    function updateErrors() {
        usernameErr.style.visibility = username.value.trim() ? 'hidden' : 'visible';
        passwordErr.style.visibility = password.value.trim() ? 'hidden' : 'visible';
    }

    function closeGuideModal() {
        guideModal.classList.remove('show');
        guideModal.setAttribute('aria-hidden', 'true');
    }

    function openGuideModal() {
        guideModal.classList.add('show');
        guideModal.setAttribute('aria-hidden', 'false');
    }

    username.addEventListener('input', updateErrors);
    password.addEventListener('input', updateErrors);
    guideClose.addEventListener('click', closeGuideModal);
    guideOk.addEventListener('click', closeGuideModal);
    guideModal.addEventListener('click', function (e) {
        if (e.target === guideModal) {
            closeGuideModal();
        }
    });
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape' && guideModal.classList.contains('show')) {
            closeGuideModal();
        }
    });

    form.addEventListener('submit', function (e) {
        updateErrors();
        if (!username.value.trim() || !password.value.trim()) {
            e.preventDefault();
        }
    });

    updateErrors();
    openGuideModal();
})();
</script>
</body>
</html>
