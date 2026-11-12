##Build stage
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build   

## Run stage
FROM nginxinc/nginx-unprivileged:alpine

# Tạm chuyển sang root trong lúc build để dọn dẹp và phân quyền file tĩnh
USER root
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=build /app/build .
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN chmod -R 755 /usr/share/nginx/html

# Chuyển lại về user thường (UID 101 - nginx) trước khi chạy container
USER 101

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
