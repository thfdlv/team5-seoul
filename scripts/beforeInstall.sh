#!/bin/bash

echo "[BeforeInstall] 기존 WAR 및 디렉토리 제거 시작"

WAR_FILE="/opt/tomcat/tomcat-10/webapps/project1.war"
WAR_DIR="/opt/tomcat/tomcat-10/webapps/project1"

if [ -f "$WAR_FILE" ]; then
  echo "👉 WAR 파일 삭제: $WAR_FILE"
  rm -f "$WAR_FILE"
fi

if [ -d "$WAR_DIR" ]; then
  echo "👉 explode 디렉토리 삭제: $WAR_DIR"
  rm -rf "$WAR_DIR"
fi

echo "[BeforeInstall] 정리 완료"
