#!/bin/bash

PACKAGE_NAME=$1
INTERNAL_REGISTRY=${INTERNAL_NPM_REGISTRY:-"http://internal-npm-repo"}

if [ -z "$PACKAGE_NAME" ]; then
  echo "패키지명을 입력하세요."
  echo "사용법: bash scripts/npm-check.sh <package-name>"
  exit 1
fi

npm view "$PACKAGE_NAME" --registry="$INTERNAL_REGISTRY" > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "사용 가능 패키지: $PACKAGE_NAME"
  echo "registry: $INTERNAL_REGISTRY"
  exit 0
else
  echo "사내 npm repository에 없는 패키지입니다. 개발에 사용할 수 없습니다: $PACKAGE_NAME"
  echo "registry: $INTERNAL_REGISTRY"
  exit 1
fi
