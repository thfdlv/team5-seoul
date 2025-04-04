#!/bin/bash

echo "[🚀 DEPLOY] WAR 파일 실행 준비 중..."

# 기존 Tomcat 종료
echo "[🛑] Tomcat 프로세스 종료 중..."
sudo pkill -f 'org.apache.catalina.startup.Bootstrap'

# WAR 복사
echo "[📦] WAR 복사"
sudo cp /home/ec2-user/app/project1.war /opt/tomcat/tomcat-10/webapps/

# Tomcat 재시작
echo "[🔁] Tomcat 재시작 중..."
sudo /opt/tomcat/tomcat-10/bin/startup.sh

echo "[✅] 배포 완료!"
