# TRD - Technical Requirements Document

## 1. 기술 스택
| 영역 | 기술 |
|---|---|
| Backend | Spring Boot 3.x, Spring Security, JPA |
| Frontend | React 또는 Vue, Tailwind CSS |
| Admin | Spring Boot Admin |
| Logging | Filebeat, Logstash, Elasticsearch, Kibana |
| DB | Oracle / MySQL / PostgreSQL 중 선택 |

## 2. 시스템 구성
```text
User → frontend/user-app → backend/api-server → DB
Admin → frontend/admin-app → backend/admin-server → backend/api-server → DB
api-server/admin-server → Filebeat → Logstash → Elasticsearch → Kibana
```

## 3. 인증/인가
- Session 또는 JWT 방식 선택
- RBAC 기반 Role/Permission 제어
- 프론트 메뉴 제어와 별도로 서버 API 권한 검증 필수

## 4. API 기준
- RESTful API 사용
- Request/Response DTO 사용
- Entity 직접 반환 금지
- 공통 에러 응답 사용

## 5. 로그 기준
- JSON 로그 권장
- traceId, userId, action, status 포함
- 민감정보 로그 금지

## 6. npm 정책
- 사내 npm repository에 존재하는 패키지만 사용
- `scripts/npm-check.sh <package-name>` 통과 필수
