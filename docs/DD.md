# DD - Detailed Design

## 1. Backend 계층
- Controller: 요청/응답 처리
- Service: 비즈니스 로직
- Repository: DB 접근
- Security: 인증/인가
- Audit: 감사 로그
- Exception: 공통 예외

## 2. Frontend 기준
- 화면은 page 단위 구성
- 반복 UI는 component화
- API 호출은 api 모듈로 분리
- Tailwind CSS 사용
- 인라인 CSS 금지

## 3. 주요 테이블
- users
- roles
- permissions
- role_permissions
- audit_log
- login_history
- system_code

## 4. API 처리 기준
```java
@PreAuthorize("hasAuthority('USER_READ')")
@GetMapping("/api/admin/users")
public Page<UserResponse> searchUsers(...) {
    return userService.searchUsers(...);
}
```

## 5. 감사 로그 저장 기준
- 로그인 성공/실패
- 권한 변경
- 사용자 정보 변경
- 데이터 등록/수정/삭제
- 감사 로그 조회
- 관리자 설정 변경

## 6. UI 예시
```jsx
<div className="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
  <h3 className="text-sm font-medium text-gray-500">사용자 수</h3>
  <p className="mt-2 text-2xl font-semibold text-gray-900">120</p>
</div>
```
