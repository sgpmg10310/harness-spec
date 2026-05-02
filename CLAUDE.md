# Project Master Guide (claude.md)

## 1. 목적
본 문서는 프로젝트 전체 설계, 개발, 운영 기준을 정의하는 최상위 가이드이다.

---

## 2. 아키텍처 개요

User → user-app → api-server → DB  
Admin → admin-app → admin-server → api-server → DB  

로그:
api-server → ELK

---

## 3. 핵심 원칙

### 3.1 아키텍처
- 사용자/관리자 시스템 분리
- API 서버 / Admin 서버 분리
- 로그 중앙화 (ELK)

### 3.2 보안
- 모든 API 서버 권한 검증 필수
- OWASP 기준 준수
- 민감정보 로그 금지

### 3.3 권한
- RBAC 구조 적용
- Role → Permission 기반 제어

### 3.4 UI
- Tailwind CSS 사용
- 인라인 CSS 금지

### 3.5 개발
- Controller 최소화
- Service 중심 설계
- 공통 모듈 재사용

---

## 4. 문서 참조 (필수)

| 문서 | 설명 |
|---|---|
| PRD.md | 기능 정의 |
| TRD.md | API/기술 |
| IA.md | 구조/흐름 |
| DD.md | 상세 설계 |
| SECURITY_AUTH_AUDIT.md | 보안/감사 |
| ELK_LOGGING.md | 로그 |
| AUTH_RBAC.md | 권한 |
| ADMIN_ARCHITECTURE.md | 서버 분리 |
| USER_JOURNEY.md | 사용자 흐름 |
| ERD.md | DB 구조 |

---

## 5. 개발 흐름

1. PRD 확인
2. TRD 기반 API 개발
3. DD 기준 DB/로직 구현
4. SECURITY 기준 적용
5. ELK 로그 연동
6. Admin 기능 구현

---

## 6. 배포 구조

- api-server
- admin-server
- ELK Stack
- DB

---

## 7. 금지 사항

- 인라인 CSS
- 권한 없는 API 접근
- 민감정보 로그 기록
- 외부 npm 무단 사용

---

## 8. 품질 기준

- 응답시간 3초 이하
- 오류 로그 100% 기록
- 감사 로그 누락 없음
