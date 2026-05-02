# ADMIN_ARCHITECTURE

## 1. 분리 구조
```text
frontend/user-app
frontend/admin-app
backend/api-server
backend/admin-server
```

## 2. 역할
| 구성 | 역할 |
|---|---|
| user-app | 사용자 화면 |
| admin-app | 관리자 화면 |
| api-server | 사용자 업무 API |
| admin-server | 관리자 API, Spring Boot Admin |

## 3. 보안
- admin-app 접근 제한
- admin-server 관리자 인증 적용
- Actuator endpoint 제한 노출
- 관리자 행위 감사 로그 저장

## 4. 운영 장점
- 장애 격리
- 보안 강화
- 운영 기능 집중 관리
- 유지보수 영향 최소화
