# PRD - Product Requirements Document

## 1. 목적
사용자 서비스와 관리자 서비스를 분리한 Spring Boot 기반 웹 애플리케이션을 구축한다.

## 2. 주요 사용자
| 사용자 | 설명 |
|---|---|
| USER | 일반 사용자 |
| MANAGER | 업무 관리자 |
| ADMIN | 시스템 관리자 |
| AUDITOR | 감사/로그 조회 담당자 |

## 3. 주요 기능
- 로그인/로그아웃
- 사용자 데이터 조회/등록/수정/삭제
- 관리자 사용자 관리
- 권한 관리
- 감사 로그 조회
- Spring Boot Admin 시스템 모니터링
- ELK 로그 조회 연계

## 4. 비기능 요구사항
- 일반 API 응답 3초 이내
- 인증 만료 30분 기준
- 모든 보호 API 서버 권한 검증
- 주요 행위 감사 로그 100% 기록
- Tailwind CSS 사용 및 인라인 CSS 금지
- 사내 npm repository 기준 의존성 사용

## 5. 성공 기준
- 사용자/관리자 기능 분리 운영 가능
- RBAC 적용 완료
- 감사 로그 저장/조회 가능
- ELK 로그 수집 가능
- Spring Boot Admin에서 서비스 상태 확인 가능
