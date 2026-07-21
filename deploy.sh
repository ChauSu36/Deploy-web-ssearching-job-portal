#!/bin/bash

# SCRIPT DEPLOY HỆ THỐNG CƠ BẢN
# Dự án: Job Portal Stack
set -e
# Theo dõi lỗi trong quá trình thực hiện script, nếu có lỗi sẽ dừng lại và in ra thông báo lỗi
echo "===================================================="
echo "1. HIEN THI THÔNG TIN HE THONG"
echo "===================================================="
echo "User đang thực hiện: $(whoami)"
echo "Hostname của server: $(hostname)"
echo "Thời gian deploy: $(date)"
echo ""

echo "===================================================="
echo "2. DI CHUYEN VÀO THƯ MUC DU ÁN"
echo "===================================================="
cd /root/chausu-compose-web/Deploy-web-ssearching-job-portal || { echo "ERROR, KHONG TIM THAY THU MUC"; exit 1; }
echo ""

echo "===================================================="
echo "3. BUILD LAI HỆ THỐNG IMAGE"
echo "===================================================="
# Pull code mới nhất từ git về trước khi build (bước bổ trợ an toàn)
git pull origin main

# Tiến hành build lại các service
sudo docker-compose build

echo "===================================================="
echo "4. KHOI ĐONG LAI STACK BANG DOCKER COMPOSE"
echo "===================================================="
sudo docker-compose down
sudo docker-compose up -d

echo "===================================================="
echo "5. HIỂN THỊ TRẠNG THÁI CONTAINER SAU DEPLOY"
echo "===================================================="
sudo docker-compose ps

echo "===================================================="
echo "6. IN 40 DÒNG LOG GẦN NHẤT CỦA HỆ THỐNG"
echo "===================================================="
# In log của cụm dịch vụ để kiểm tra lỗi khởi động
sudo docker-compose logs --tail=40
echo "===================================================="
echo " QUY TRÌNH DEPLOY HOÀN TẤT!"
echo "===================================================="
