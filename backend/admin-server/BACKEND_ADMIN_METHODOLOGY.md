# BACKEND_ADMIN_METHODOLOGY - admin-server

## 1. 목적
관리자 서버의 개발 방법론을 정의한다.

---

## 2. 기본 원칙
- 관리자 기능은 api-server와 분리한다.
- admin-server는 관리자 인증/인가를 별도로 적용한다.
- ADMIN/AUDITOR 권한을 기준으로 API를 분리한다.
- 감사 로그 조회 행위도 감사 로그로 저장한다.
- Spring Boot Admin Server를 구성한다.
- 운영 endpoint는 제한적으로 노출한다.

---

## 3. 권장 패키지 구조

```text
src/main/java/com/company/project/admin/
 ├─ controller/
 │   ├─ UserAdminController.java
 │   ├─ RoleAdminController.java
 │   ├─ AuditLogController.java
 │   └─ SystemHealthController.java
 ├─ service/
 ├─ client/
 │   └─ ApiServerClient.java
 ├─ config/
 ├─ security/
 ├─ monitoring/
 ├─ dto/
 └─ exception/
```

---

## 4. 관리자 API 기준

### 4.1 사용자 관리
```java
@PreAuthorize("hasAuthority('USER_READ')")
@GetMapping("/api/admin/users")
public Page<UserResponse> searchUsers(UserSearchRequest request, Pageable pageable) {
    return userAdminService.searchUsers(request, pageable);
}
```

### 4.2 권한 변경
```java
@PreAuthorize("hasAuthority('USER_ROLE_UPDATE')")
@PutMapping("/api/admin/users/{userId}/role")
public void updateUserRole(@PathVariable String userId, @RequestBody RoleUpdateRequest request) {
    userAdminService.updateUserRole(userId, request);
}
```

### 4.3 감사 로그 조회
```java
@PreAuthorize("hasAuthority('AUDIT_READ')")
@GetMapping("/api/admin/audit-logs")
public Page<AuditLogResponse> searchAuditLogs(AuditLogSearchRequest request, Pageable pageable) {
    return auditLogService.search(request, pageable);
}
```

---

## 5. Spring Boot Admin Server 설정

```yaml
server:
  port: 8081

spring:
  application:
    name: admin-server
  security:
    user:
      name: admin
      password: ${ADMIN_PASSWORD}
```

---

## 6. Actuator 접근 기준
- health, info, metrics, loggers 등 필요한 endpoint만 노출한다.
- env, beans, heapdump 등 민감 endpoint는 운영에서 제한한다.
- show-details는 authorized 기준으로 설정한다.

---

## 7. 감사 로그 조회 기준
- 기간 조건 필수
- 페이징 필수
- 사용자 ID, 행위 유형, 결과 상태 검색 제공
- 민감정보는 마스킹된 값만 반환
- 조회 행위 자체를 감사 로그로 저장

---

## 8. api-server 연동 기준
- 사용자 업무 데이터는 api-server API를 통해 조회하는 방식을 우선한다.
- 직접 DB 접근이 필요한 경우 읽기 전용 권한을 권장한다.
- 서버 간 호출은 timeout/retry 정책을 정의한다.
- 관리자 요청 traceId를 api-server로 전달한다.

---

## 9. 보안 기준
- admin-server 접근은 관리자 인증 필수
- 관리자 IP 제한 검토
- ADMIN/AUDITOR 권한 분리
- 관리자 권한 변경 행위는 이중 확인 적용 권장

---

## 10. 테스트 기준
- 관리자 로그인
- Role별 API 접근 제한
- 감사 로그 조회/페이징
- 권한 변경 감사 로그 저장
- Spring Boot Admin 등록 확인
- Actuator endpoint 노출 범위 확인
