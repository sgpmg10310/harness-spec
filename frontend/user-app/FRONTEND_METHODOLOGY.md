# FRONTEND_METHODOLOGY - user-app

## 1. 목적
사용자 웹 애플리케이션의 개발 방법론을 정의한다.

---

## 2. 기본 원칙
- 화면은 사용자 흐름 중심으로 설계한다.
- 사용자 권한에 따라 메뉴/버튼 노출을 제어한다.
- 단, 최종 권한 검증은 반드시 서버에서 수행한다.
- Tailwind CSS를 사용하고 인라인 CSS는 금지한다.
- 공통 UI는 컴포넌트로 분리한다.
- API 호출은 화면 컴포넌트 내부에 직접 작성하지 않는다.

---

## 3. 권장 폴더 구조

```text
src/
 ├─ pages/
 │   ├─ LoginPage.tsx
 │   ├─ MainPage.tsx
 │   ├─ DataListPage.tsx
 │   ├─ DataDetailPage.tsx
 │   └─ MyPage.tsx
 ├─ components/
 │   ├─ layout/
 │   ├─ form/
 │   ├─ table/
 │   └─ feedback/
 ├─ api/
 │   ├─ authApi.ts
 │   └─ dataApi.ts
 ├─ hooks/
 ├─ store/
 ├─ types/
 └─ utils/
```

---

## 4. 화면 개발 기준

### 4.1 로그인 화면
- ID/PW 필수 입력 검증
- 로그인 실패 메시지 표시
- 계정 잠금 메시지 표시
- 로그인 성공 시 메인 이동

### 4.2 목록 화면
- 검색 조건 제공
- 페이징 필수
- 로딩 상태 표시
- 데이터 없음 상태 표시
- 오류 발생 시 안내 메시지 표시

### 4.3 상세 화면
- 조회 권한 확인
- 수정 가능 여부에 따라 버튼 제어
- 삭제 기능은 권한이 있는 경우만 제공

### 4.4 등록/수정 화면
- 필수값 검증
- 저장 전 확인 메시지
- 저장 성공/실패 메시지
- 중복 데이터 오류 처리

---

## 5. API 호출 기준

```ts
export async function getDataList(params: DataSearchParams) {
  const response = await apiClient.get("/api/data", { params });
  return response.data;
}
```

- API client를 공통화한다.
- 401 발생 시 로그인 화면으로 이동한다.
- 403 발생 시 권한 없음 메시지를 표시한다.
- 500 발생 시 공통 오류 메시지를 표시한다.

---

## 6. Tailwind CSS 기준

### 금지
```jsx
<div style={{ marginTop: "10px" }}>내용</div>
```

### 권장
```jsx
<div className="mt-2 rounded-lg border border-gray-200 bg-white p-4 shadow-sm">
  내용
</div>
```

---

## 7. 컴포넌트 기준

| 컴포넌트 | 역할 |
|---|---|
| AppLayout | 기본 레이아웃 |
| PageHeader | 페이지 제목/설명 |
| SearchForm | 검색 조건 |
| DataTable | 목록 테이블 |
| ConfirmModal | 확인 팝업 |
| ErrorBanner | 오류 메시지 |

---

## 8. 상태 관리 기준
- 서버 데이터는 API 호출 결과 기준으로 관리한다.
- 화면 임시 상태는 컴포넌트 내부 상태로 관리한다.
- 전역 상태는 로그인 사용자 정보, 권한, 공통 코드 정도만 유지한다.

---

## 9. 테스트 기준
- 로그인 성공/실패
- 권한별 메뉴 노출
- 목록 조회/페이징
- 등록/수정 validation
- API 오류 처리
