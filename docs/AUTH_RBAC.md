# AUTH_RBAC

## 1. 구조
```text
User → Role → Permission
```

## 2. Role
- USER
- MANAGER
- ADMIN
- AUDITOR

## 3. Permission
- USER_READ
- USER_CREATE
- USER_UPDATE
- USER_DELETE
- USER_ROLE_UPDATE
- AUDIT_READ
- SYSTEM_READ
- ADMIN_ACCESS

## 4. 권한 적용 기준
- API 단위 Permission 매핑
- 메뉴 단위 Permission 매핑
- 버튼 단위 Permission 매핑 가능

## 5. 권한 변경
- ADMIN만 가능
- 변경 전/후 값 감사 로그 저장
