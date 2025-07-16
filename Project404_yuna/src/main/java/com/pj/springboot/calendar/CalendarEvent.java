package com.pj.springboot.calendar;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor // Lombok을 사용하여 모든 필드를 인자로 받는 생성자 생성
@Entity
@Table(name = "calendar_events") // 데이터베이스 테이블명
public class CalendarEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // DB에서 ID 자동 생성 (AUTO_INCREMENT)
    private Long id; // ID 타입을 Long으로 변경

    @Column(nullable = false, length = 255)
    private String title;

    @Column(name = "start_date")
    private String start;

    @Column(name = "end_date")
    private String end;

    @Column(nullable = false)
    private boolean allDay;

    @Column(length = 50)
    private String color;

    @Column(length = 1000)
    private String description;

}