# Project Guide - Spring Boot Web Application

## 개요
Spring Boot 기반 웹 애플리케이션과 관리자 시스템을 분리 구성한다.

## 문서 위치
- docs/PRD.md
- docs/TRD.md
- docs/IA.md
- docs/DD.md
- docs/SECURITY_AUTH_AUDIT.md
- docs/ELK_LOGGING.md
- docs/AUTH_RBAC.md
- docs/ADMIN_ARCHITECTURE.md
- docs/USER_JOURNEY.md
- docs/ERD.md

## 핵심 구조
- user-app / admin-app 분리
- api-server / admin-server 분리
- ELK 로그 중앙화
- RBAC 권한 관리

## 필수 규칙
- 서버 권한 검증 필수
- Tailwind CSS 사용
- 인라인 CSS 금지
- npm 사내망 사용
