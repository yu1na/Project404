<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>일정 관리</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/main.min.css' rel='stylesheet' />

    <style>
        body {
            background: linear-gradient(to bottom right, #e3f2fd, #ffffff);
            min-height: 100vh;
            display: flex; /* flexbox를 사용하여 본문 내용을 중앙에 배치하기 위함 */
            flex-direction: column; /* 세로 방향으로 정렬 */
            margin: 0; /* 기본 마진 제거 */
            padding: 0; /* 기본 패딩 제거 */
        }
        .navbar-nav .nav-link {
            font-weight: 500;
            color: #1976d2 !important;
        }
        .navbar-brand {
            font-weight: bold;
            color: #0d47a1 !important;
        }
        /* 기존 calendar.jsp의 wrapper, sidebar-container, main-content 스타일을 새로운 레이아웃에 맞게 조정 */
        .wrapper {
            flex-grow: 1; /* 남은 공간을 모두 차지하도록 하여 중앙 정렬을 도움 */
            display: flex;
            /* 이전 sidebar-container와 main-content 스타일은 이 navbar-only 레이아웃에서는 불필요 */
            /* 만약 사이드바를 다시 추가하고 싶다면 이 wrapper 내부에 추가적인 div를 구성해야 함 */
            justify-content: center; /* 수평 중앙 정렬 (내용이 좁을 때) */
            align-items: flex-start; /* 수직 상단 정렬 (내용이 길어질 경우) */
            padding: 20px; /* 내부 여백 */
        }
        .main-content { /* calendar 내용을 감싸는 div (이전 wrapper/main-content와 혼동 주의) */
            max-width: 1200px; /* 캘린더 컨텐츠 최대 너비 */
            width: 100%;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 { /* 캘린더 페이지의 제목 스타일 */
            color: #2c3e50;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
        }
        h1 i { /* 캘린더 제목 옆 아이콘 */
            margin-right: 10px;
            font-size: 1.2em;
        }
        #calendar { /* FullCalendar 컨테이너 */
            margin: 0 auto;
            padding: 20px 0;
        }

        /* FullCalendar 기본 스타일 재정의 (선택 사항) */
        .fc .fc-button-primary {
            background-color: #3498db;
            border-color: #3498db;
        }
        .fc .fc-button-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }
        .fc .fc-daygrid-event {
            background-color: #2ecc71; /* 이벤트 배경색 */
            border-color: #2ecc71;
        }
        .fc-event {
            border-radius: 3px;
            font-size: .85em;
            padding: 2px 5px;
            cursor: pointer;
        }

        /* 모달창 스타일 (Bootstrap 기본 사용) */
        #eventModal .modal-header {
            background-color: #2c3e50;
            color: white;
            border-bottom: none;
        }
        #eventModal .modal-title {
            color: white;
        }
        #eventModal .btn-close {
            filter: invert(1); /* 닫기 버튼을 흰색으로 */
        }
        #eventModal .modal-footer {
            border-top: none;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand bg-white shadow-sm px-4">
        <a class="navbar-brand" href="/">
            ✈
        </a>
        <ul class="navbar-nav mx-auto d-flex flex-row">
            <li class="nav-item me-3"><a class="nav-link" href="/approval/list">전자결재시스템</a></li>
            <li class="nav-item me-3"><a class="nav-link" href="/docs/list">문서보관소</a></li>
            <li class="nav-item me-3"><a class="nav-link" href="/report/list">업무보고시스템</a></li>
            <li class="nav-item me-3"><a class="nav-link" href="/message/inbox">커뮤니케이션기능</a></li>
            <li class="nav-item me-3"><a class="nav-link" href="/qna/list">고객응대공유</a></li>
            <li class="nav-item me-3"><a class="nav-link" href="/calendar">일정관리</a></li>
            <li class="nav-item me-3"><a class="nav-link" href="/mypage">마이페이지</a></li>
        </ul>
        <div class="d-flex">
            <a class="nav-link" href="/login">로그인/회원가입</a>
        </div>
    </nav>

    <div class="wrapper">
        <div class="main-content">
            <h1><i class="bi bi-calendar"></i> 일정 관리</h1>
            <div id='calendar'></div>

           
            <div id="eventModal" class="modal fade" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="eventModalLabel">일정 상세/수정</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="eventForm">
                                <div class="mb-3"><label for="eventTitle" class="form-label">제목</label><input type="text" class="form-control" id="eventTitle"></div>
                                <div class="mb-3"><label for="eventDescription" class="form-label">설명/비고</label><textarea class="form-control" id="eventDescription" rows="3"></textarea></div>
                                <div class="mb-3"><label for="eventStartDate" class="form-label">시작일시</label><input type="datetime-local" class="form-control" id="eventStartDate"></div>
                                <div class="mb-3"><label for="eventEndDate" class="form-label">종료일시</label><input type="datetime-local" class="form-control" id="eventEndDate"></div>
                                <div class="form-check mb-3"><input class="form-check-input" type="checkbox" id="allDayEvent"><label class="form-check-label" for="allDayEvent">종일</label></div>
                                <div class="mb-3"><label for="eventColor" class="form-label">색상</label><input type="color" class="form-control form-control-color" id="eventColor" value="#007bff"></div>
                                <input type="hidden" id="eventId">
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" id="deleteEventBtn">삭제</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-primary" id="saveEventBtn">저장</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core/locales/ko.global.min.js'></script>

    <c:import url="/WEB-INF/views/includes/calendar_js.jsp" />
</body>
</html>