# ADMIN_FRONTEND_METHODOLOGY - admin-app

## 1. 목적
관리자 웹 애플리케이션의 개발 방법론을 정의한다.

---

## 2. 기본 원칙
- 관리자 기능은 일반 사용자 화면과 분리한다.
- ADMIN/AUDITOR 권한에 따라 메뉴를 분리한다.
- 감사 로그 조회 행위도 감사 대상임을 고려한다.
- Tailwind CSS를 사용하고 인라인 CSS는 금지한다.
- 대량 데이터 화면은 반드시 검색 조건과 페이징을 제공한다.

---

## 3. 권장 폴더 구조

```text
src/
 ├─ pages/
 │   ├─ AdminLoginPage.tsx
 │   ├─ DashboardPage.tsx
 │   ├─ UserManagementPage.tsx
 │   ├─ RoleManagementPage.tsx
 │   ├─ AuditLogPage.tsx
 │   └─ SystemHealthPage.tsx
 ├─ components/
 │   ├─ dashboard/
 │   ├─ user/
 │   ├─ role/
 │   ├─ audit/
 │   └─ layout/
 ├─ api/
 │   ├─ adminAuthApi.ts
 │   ├─ adminUserApi.ts
 │   ├─ roleApi.ts
 │   ├─ auditApi.ts
 │   └─ systemApi.ts
 ├─ hooks/
 ├─ store/
 ├─ types/
 └─ utils/
```

---

## 4. 관리자 화면 기준

### 4.1 대시보드
- 전체 사용자 수
- 로그인 실패 수
- 오류 발생 건수
- 최근 감사 로그
- 서비스 Health 요약

### 4.2 사용자 관리
- 사용자 목록 검색
- 사용자 상세 조회
- 사용자 상태 변경
- 사용자 Role 변경
- 변경 전/후 감사 로그 저장은 서버에서 처리

### 4.3 권한 관리
- Role 목록 조회
- Permission 목록 조회
- Role-Permission 매핑 수정
- 권한 변경 시 확인 팝업 필수

### 4.4 감사 로그 조회
- 기간 조건 필수
- 사용자 ID 조건
- 행위 유형 조건
- 결과 상태 조건
- 페이지네이션 필수
- 로그 상세 팝업 제공

### 4.5 시스템 모니터링
- Spring Boot Admin 링크 또는 요약 정보 표시
- Health, Metrics, Loggers 확인
- 장애 시 Kibana 조회 링크 제공 가능

---

## 5. UI 컴포넌트 예시

```jsx
export default function DashboardCard({ title, value, description }) {
  return (
    <div className="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
      <h3 className="text-sm font-medium text-gray-500">{title}</h3>
      <p className="mt-2 text-2xl font-semibold text-gray-900">{value}</p>
      <p className="mt-1 text-sm text-gray-500">{description}</p>
    </div>
  );
}
```

---

## 6. 보안 UI 기준
- 권한 없는 메뉴는 숨긴다.
- 권한 없는 API 응답 403 발생 시 안내 화면으로 이동한다.
- 감사 로그 원문에 민감정보가 포함되지 않도록 서버 마스킹 결과를 표시한다.
- 관리자 화면은 자동 로그아웃 안내를 제공한다.

---

## 7. 테스트 기준
- Role별 메뉴 노출
- 사용자 검색/수정
- 권한 변경 확인 팝업
- 감사 로그 검색/페이징
- 시스템 상태 조회
- 401/403/500 공통 오류 처리
