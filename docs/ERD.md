# ERD

## 1. 관계 요약
```text
users.role_id → roles.role_id
roles.role_id → role_permissions.role_id
permissions.permission_id → role_permissions.permission_id
users.user_id → audit_log.user_id
users.user_id → login_history.user_id
```

## 2. 주요 테이블
### users
- user_id
- password
- name
- email
- role_id
- status
- login_fail_count
- last_login_at
- created_at
- updated_at

### roles
- role_id
- role_name
- description
- use_yn
- created_at

### permissions
- permission_id
- permission_name
- resource_type
- resource_path
- action_type
- created_at

### role_permissions
- role_id
- permission_id
- created_at

### audit_log
- audit_id
- user_id
- user_role
- action_type
- target_type
- target_id
- before_value
- after_value
- result_status
- created_at
