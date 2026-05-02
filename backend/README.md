# Backend

## 목적
사용자 API 서버와 관리자 서버를 분리하여 개발한다.

## 구성
- api-server: 사용자 업무 API, 핵심 비즈니스 로직
- admin-server: 관리자 API, Spring Boot Admin, 모니터링

## 공통 원칙
- Controller는 얇게 유지
- Service 중심 비즈니스 로직
- Repository는 DB 접근만 담당
- DTO 사용
- Entity 직접 반환 금지
- 서버 권한 검증 필수
- 감사 로그 저장
