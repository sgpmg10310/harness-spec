# scripts

## 목적
프로젝트 개발 및 검증에 필요한 보조 스크립트를 관리한다.

## 포함 스크립트
- npm-check.sh: 사내 npm repository 패키지 존재 여부 확인

## 사용 기준
신규 npm 패키지 도입 전 반드시 확인한다.

```bash
bash scripts/npm-check.sh axios
```
