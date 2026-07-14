#!/bin/bash

# SCRIPT DEPLOY HỆ THỐNG CƠ BẢN
# Dự án: Job Portal Stack

echo "===================================================="
echo "1. HIEN THI THÔNG TIN HE THONG"
echo "===================================================="
echo "User đang thực hiện: $(whoami)"
echo "Hostname của server: $(hostname)"
echo "Thời gian deploy: $(date)"


echo "===================================================="
echo "2. DI CHUYEB VÀO THƯ MUC DU ÁN"
echo "===================================================="
cd ~/chausu-compose-web || { echo "ERORR, KHONG TIM THAY THU MUC; exit 1; }


echo "===================================================="
echo "3. BUILD LAI HỆ THỐNG IMAGE"
echo "===================================================="
# Pull code mới nhất từ git về trước khi build (bước bổ trợ an toàn)
git pull origin main

# Tiến hành build lại các service
docker compose build

echo "===================================================="
echo "4. KHOI ĐONG LAI STACK BANG DOCKER COMPOSE"
echo "===================================================="
docker compose down
docker compose up -d

echo "===================================================="
echo "5. HIỂN THỊ TRẠNG THÁI CONTAINER SAU DEPLOY"
echo "===================================================="
docker compose ps

echo "===================================================="
echo "6. IN 40 DÒNG LOG GẦN NHẤT CỦA HỆ THỐNG"
echo "===================================================="
# In log của cụm dịch vụ để kiểm tra lỗi khởi động
docker compose logs --tail=40
echo "===================================================="
echo " QUY TRÌNH DEPLOY HOÀN TẤT!"
echo "===================================================="
