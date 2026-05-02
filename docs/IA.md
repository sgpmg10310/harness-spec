# IA - Information Architecture

## 1. 전체 구조
```text
User → user-app → api-server → DB
Admin → admin-app → admin-server → api-server → DB
api-server/admin-server → ELK
```

## 2. 화면 구조
### user-app
- 로그인
- 메인
- 목록
- 상세
- 등록/수정
- 내 정보

### admin-app
- 관리자 로그인
- 대시보드
- 사용자 관리
- 권한 관리
- 감사 로그 조회
- 시스템 상태
- 로그 조회 연계

## 3. 처리 흐름
요청 → 인증 → 권한 검증 → 서비스 처리 → DB → 감사 로그 → 응답

## 4. 감사 흐름
행위 발생 → AuditLogService → audit_log 저장 → ELK 출력 → 관리자 조회
