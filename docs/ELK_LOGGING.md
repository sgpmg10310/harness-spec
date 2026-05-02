# ELK_LOGGING

## 1. 구조
```text
Spring Boot App → Filebeat → Logstash → Elasticsearch → Kibana
```

## 2. 로그 종류
- Application Log
- Error Log
- Access Log
- Security Log
- Audit Log

## 3. 로그 필드
| 필드 | 설명 |
|---|---|
| timestamp | 발생 시간 |
| level | 로그 레벨 |
| service | 서비스명 |
| traceId | 요청 추적 ID |
| userId | 사용자 |
| action | 행위 |
| status | 결과 |
| message | 메시지 |

## 4. Kibana 대시보드
- 오류 발생 건수
- 로그인 실패 건수
- 권한 없는 접근
- 관리자 행위
- API별 응답 시간
