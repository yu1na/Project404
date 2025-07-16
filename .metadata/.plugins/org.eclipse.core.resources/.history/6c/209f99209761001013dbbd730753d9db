package com.pj.springboot.calendar;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository // Spring Bean으로 등록
public interface CalendarEventRepository extends JpaRepository<CalendarEvent, Long> {
    // CalendarEvent 엔티티와 Long 타입의 ID를 사용하여 JPA Repository 기능 상속
    // (findAll, findById, save, delete 등 기본 CRUD 메서드 자동 제공)
}