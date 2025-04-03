#!/bin/bash
echo "[🚀 DEPLOY] WAR 파일 실행 준비 중..."
TOMCAT_HOME=/opt/tomcat/tomcat-10

# 실행 중이면 종료
PID=$(ps -ef | grep $TOMCAT_HOME | grep -v grep | awk '{print $2}')
if [ -n "$PID" ]; then
  echo "⚠️ Tomcat 프로세스 종료 중..."
  kill -9 $PID
fi

# 재시작
echo "🔁 Tomcat 재시작 중..."
$TOMCAT_HOME/bin/startup.sh
