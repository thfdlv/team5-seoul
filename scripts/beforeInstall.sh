#!/bin/bash
set -e

echo "[BeforeInstall] 기존 앱 삭제 중..."

if [ -d /home/ec2-user/app ]; then
  rm -rf /home/ec2-user/app/*
fi

echo "[BeforeInstall] 완료!"
