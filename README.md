# 🚀 Searching Job Portal - Source Code & Automated CI Pipeline

[![CI Pipeline](https://github.com/ChauSu36/Deploy-web-ssearching-job-portal/actions/workflows/deploy.yml/badge.svg)](https://github.com/ChauSu36/Deploy-web-ssearching-job-portal/actions)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?logo=docker&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI_Automation-2088FF?logo=github-actions&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Backend-Spring_Boot_3-6DB33F?logo=springboot&logoColor=white)
![React](https://img.shields.io/badge/Frontend-React.js-61DAFB?logo=react&logoColor=black)

Repository chứa mã nguồn hoàn chỉnh của hệ thống **Searching Job Portal** (kiến trúc microservices tách biệt Frontend và Backend), tích hợp quy trình **Continuous Integration (CI)** tự động hóa bằng GitHub Actions và kết nối trực tiếp với hệ sinh thái GitOps (ArgoCD & Kubernetes).

---

## 🏗 System Architecture & Repository Structure

Hệ thống được tổ chức theo cấu trúc monorepo phân tách rõ ràng giữa các domain dịch vụ:

```text
├── jobportal/                  # Backend service (Java Spring Boot, REST API, JPA/Hibernate)
│   ├── src/
│   ├── pom.xml
│   └── Dockerfile              # Multi-stage build tối ưu kích thước image
├── react-social/               # Frontend service (React.js, Tailwind CSS, Axios)
│   ├── src/
│   ├── package.json
│   └── Dockerfile              # Nginx-based production image
├── .github/workflows/          # CI Pipeline automation manifests
│   └── deploy.yml              # Path-based filtered build & push workflow
├── docker-compose.yml          # Local environment orchestration
└── README.md