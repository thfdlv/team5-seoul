#!/bin/bash
set -e

echo "[Deploy] Tomcat 재시작 및 WAR 복사"

# Tomcat 경로 예시 (필요 시 수정)
TOMCAT_PATH=/opt/tomcat/tomcat-10/webapps/

cp /home/ec2-user/app/project1.war $TOMCAT_PATH/webapps/

sudo systemctl restart tomcat
