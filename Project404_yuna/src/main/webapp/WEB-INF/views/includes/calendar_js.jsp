<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        if (calendarEl) {
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth', locale: 'ko', height: 'auto',
                headerToolbar: { left: 'prev,next today', center: 'title', right: 'dayGridMonth,timeGridWeek,timeGridDay' },
                editable: true, selectable: true, navLinks: true, dayMaxEvents: true,
                events: [], // 여기에 초기 이벤트 데이터 추가 가능
                dateClick: function(info) {
                    $('#eventModal').modal('show');
                    $('#eventTitle').val(''); $('#eventDescription').val('');
                    $('#eventStartDate').val(info.dateStr + 'T09:00'); $('#eventEndDate').val(info.dateStr + 'T10:00');
                    $('#allDayEvent').prop('checked', false); $('#eventColor').val('#007bff');
                    $('#eventId').val(''); $('#deleteEventBtn').hide(); $('#eventModalLabel').text('새 일정 추가');
                },
                eventClick: function(info) {
                    $('#eventModal').modal('show');
                    $('#eventTitle').val(info.event.title); $('#eventDescription').val(info.event.extendedProps.description || '');
                    $('#eventStartDate').val(moment(info.event.start).format('YYYY-MM-DDTHH:mm'));
                    $('#eventEndDate').val(info.event.end ? moment(info.event.end).format('YYYY-MM-DDTHH:mm') : '');
                    $('#allDayEvent').prop('checked', info.event.allDay); $('#eventColor').val(info.event.backgroundColor || '#007bff');
                    $('#eventId').val(info.event.id); $('#deleteEventBtn').show(); $('#eventModalLabel').text('일정 상세/수정');
                },
                eventDrop: function(info) { console.log('Event moved:', info.event.title, 'to', info.event.start); },
                eventResize: function(info) { console.log('Event resized:', info.event.title, 'new end:', info.event.end); }
            });
            calendar.render();

            $('#saveEventBtn').on('click', function() {
                var eventId = $('#eventId').val(); var title = $('#eventTitle').val();
                if (!title) { alert('제목을 입력해주세요.'); return; }
                var eventData = { id: eventId, title: title, start: $('#eventStartDate').val(), end: $('#eventEndDate').val(),
                                allDay: $('#allDayEvent').is(':checked'), backgroundColor: $('#eventColor').val(),
                                borderColor: $('#eventColor').val(), extendedProps: { description: $('#eventDescription').val() } };
                if (eventId) { var existingEvent = calendar.getEventById(eventId); if (existingEvent) { existingEvent.setProp('title', title); existingEvent.setExtendedProp('description', eventData.extendedProps.description); existingEvent.setStart(eventData.start); existingEvent.setEnd(eventData.end); existingEvent.setAllDay(eventData.allDay); existingEvent.setProp('backgroundColor', eventData.backgroundColor); existingEvent.setProp('borderColor', eventData.borderColor); alert('일정이 수정되었습니다.'); }
                } else { calendar.addEvent(eventData); alert('새 일정이 추가되었습니다.'); }
                $('#eventModal').modal('hide');
            });
            $('#deleteEventBtn').on('click', function() {
                if (confirm('이 일정을 삭제하시겠습니까?')) { var eventId = $('#eventId').val(); if (eventId) { var eventToRemove = calendar.getEventById(eventId); if (eventToRemove) { eventToRemove.remove(); alert('일정이 삭제되었습니다.'); } } $('#eventModal').modal('hide'); }
            });
        }
    });
</script>