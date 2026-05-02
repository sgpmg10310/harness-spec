# BACKEND_API_METHODOLOGY - api-server

## 1. 목적
사용자 API 서버의 개발 방법론을 정의한다.

---

## 2. 기본 원칙
- Controller는 요청/응답만 담당한다.
- 비즈니스 로직은 Service에서 처리한다.
- DB 접근은 Repository로 한정한다.
- Entity 직접 반환을 금지하고 Response DTO를 사용한다.
- 모든 보호 API는 인증/인가를 검증한다.
- 주요 행위는 AuditLogService를 통해 감사 로그로 저장한다.
- 로그는 ELK 수집을 고려해 구조화한다.

---

## 3. 권장 패키지 구조

```text
src/main/java/com/company/project/api/
 ├─ controller/
 ├─ service/
 ├─ repository/
 ├─ domain/
 ├─ dto/
 │   ├─ request/
 │   └─ response/
 ├─ config/
 ├─ security/
 ├─ audit/
 ├─ exception/
 └─ common/
```

---

## 4. Controller 작성 기준

```java
@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PreAuthorize("hasAuthority('USER_SELF_READ')")
    @GetMapping("/me")
    public UserMeResponse getMe(LoginUser loginUser) {
        return userService.getMe(loginUser.getUserId());
    }
}
```

- URL은 리소스 중심으로 설계한다.
- HTTP Method 의미를 준수한다.
- 입력값은 Request DTO로 받는다.
- 반환값은 Response DTO로 반환한다.

---

## 5. Service 작성 기준

```java
@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public UserMeResponse getMe(String userId) {
        User user = userRepository.findById(userId)
            .orElseThrow(() -> new BusinessException("USER_NOT_FOUND"));

        return UserMeResponse.from(user);
    }
}
```

- 조회는 `@Transactional(readOnly = true)` 사용
- 변경은 `@Transactional` 사용
- 외부 연동/DB 변경/감사 로그 저장 순서를 명확히 한다.

---

## 6. Repository 기준
- JPA Repository 또는 Mapper 사용
- 동적 검색은 QueryDSL 또는 명확한 Mapper SQL 사용
- 문자열 결합 SQL 금지
- 검색 조건은 화이트리스트 기반으로 처리한다.

---

## 7. 인증/인가 기준
- 로그인 사용자 정보는 공통 객체로 전달한다.
- API별 Permission을 명시한다.
- 본인 데이터 접근 여부를 Service에서 추가 검증한다.

---

## 8. 감사 로그 기준
저장 대상:
- 로그인 성공/실패
- 사용자 정보 변경
- 데이터 등록/수정/삭제
- 권한 없는 접근
- 파일 다운로드

예시:
```java
auditLogService.save(AuditLogCreateRequest.builder()
    .userId(loginUser.getUserId())
    .actionType("DATA_UPDATE")
    .targetType("DATA")
    .targetId(dataId)
    .resultStatus("SUCCESS")
    .build());
```

---

## 9. 예외 처리 기준
- BusinessException 사용
- 공통 ErrorResponse 반환
- 운영 화면에 Stack Trace 노출 금지
- ERROR 로그에는 traceId 포함

---

## 10. Spring Boot Admin Client
```yaml
spring:
  boot:
    admin:
      client:
        url: http://admin-server:8081
        username: admin-client
        password: ${ADMIN_CLIENT_PASSWORD}

management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics,loggers
```

---

## 11. 테스트 기준
- Controller 테스트
- Service 단위 테스트
- Repository 쿼리 테스트
- 권한 실패 테스트
- 감사 로그 저장 테스트
- 예외 응답 테스트
