# Project Master Guide (claude.md)

## 1. 목적
본 문서는 Spring Boot 기반 웹 애플리케이션 프로젝트의 전체 설계, 개발, 운영 기준을 정의하는 최상위 가이드이다.

본 프로젝트는 사용자 서비스와 관리자 서비스를 분리하고, Spring Boot Admin 및 ELK 기반 로그 체계를 통해 운영 안정성과 감사 추적성을 확보한다.

---

## 2. 프로젝트 구조

```bash
project-root/
 ├─ claude.md
 ├─ docs/
 ├─ frontend/
 │   ├─ user-app/
 │   └─ admin-app/
 ├─ backend/
 │   ├─ api-server/
 │   └─ admin-server/
 └─ scripts/
```

---

## 3. 문서 참조

| 문서 | 설명 |
|---|---|
| docs/PRD.md | 제품 요구사항 |
| docs/TRD.md | 기술 요구사항 |
| docs/IA.md | 정보 구조 |
| docs/DD.md | 상세 설계 |
| docs/SECURITY_AUTH_AUDIT.md | 보안/권한/감사 |
| docs/ELK_LOGGING.md | ELK 로그 |
| docs/AUTH_RBAC.md | RBAC 권한 |
| docs/ADMIN_ARCHITECTURE.md | 관리자 분리 구조 |
| docs/USER_JOURNEY.md | 사용자 흐름 |
| docs/ERD.md | DB 구조 |
| frontend/user-app/FRONTEND_METHODOLOGY.md | 사용자 프론트 개발 방법론 |
| frontend/admin-app/ADMIN_FRONTEND_METHODOLOGY.md | 관리자 프론트 개발 방법론 |
| backend/api-server/BACKEND_API_METHODOLOGY.md | 사용자 API 서버 개발 방법론 |
| backend/admin-server/BACKEND_ADMIN_METHODOLOGY.md | 관리자 서버 개발 방법론 |

---

## 4. 핵심 원칙

- 사용자/관리자 프론트 분리
- 사용자 API/관리자 API 서버 분리
- 서버 권한 검증 필수
- RBAC 기반 권한 관리
- 감사 로그 필수 저장
- ELK 로그 중앙화
- Spring Boot Admin 기반 운영 모니터링
- Tailwind CSS 사용
- 인라인 CSS 금지
- 사내 npm repository에 없는 패키지 사용 금지

---

## 5. 개발 완료 기준

- 기능 요구사항 구현 완료
- API 권한 검증 완료
- 감사 로그 저장 및 조회 가능
- ELK 로그 수집 가능
- Spring Boot Admin 모니터링 가능
- 폴더별 README/방법론 문서 작성 완료
