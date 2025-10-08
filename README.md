# Minikube Sample Application - Spring Boot on Kubernetes

[![Java](https://img.shields.io/badge/Java-17+-blue.svg)](https://openjdk.java.net/projects/jdk/17/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-2.7.18-green.svg)](https://spring.io/projects/spring-boot)
[![Docker](https://img.shields.io/badge/Docker-Multi--stage-blue.svg)](https://docs.docker.com/develop/dev-best-practices/dockerfile_best-practices/)
[![Security](https://img.shields.io/badge/Security-Hardened-red.svg)](https://spring.io/projects/spring-security)

A modern, secure Spring Boot application designed for Kubernetes deployment with comprehensive DevOps pipeline integration.

## 🚀 Features

- **Modern Stack**: Java 17 + Spring Boot 2.7.18
- **Security First**: Comprehensive security configuration with Spring Security
- **Cloud Native**: Kubernetes-ready with proper health checks and resource limits
- **DevOps Ready**: Jenkins pipeline with security scanning and automated deployment
- **Container Optimized**: Multi-stage Docker builds with non-root execution

## 📋 Prerequisites

### Required
- **Java 17+** (LTS recommended)
- **Maven 3.6+**
- **Docker 20.10+**
- **kubectl** (for Kubernetes deployment)

### Optional
- **Minikube** or **EKS Cluster** for testing
- **Jenkins** for CI/CD pipeline
- **Helm** for package management

## 🛠️ Quick Start

### 1. Clone and Build

```bash
git clone <your-repo-url>
cd Java_app_3.0

# Build with Maven
mvn clean install

# Run tests
mvn test
```

### 2. Local Development

```bash
# Run the application locally
mvn spring-boot:run

# Access the application
curl http://localhost:8080/actuator/health
curl http://localhost:8080/home/data
```

### 3. Docker Build & Run

```bash
# Build Docker image (multi-stage)
docker build -t minikube-sample:latest .

# Run container
docker run -p 8080:8080 --name minikube-sample minikube-sample:latest
```

## ☸️ Kubernetes Deployment

### Deploy to Kubernetes

```bash
# Apply ConfigMap
kubectl apply -f configmap-minikube-sample.yaml

# Deploy application
kubectl apply -f deployment.yaml

# Check deployment status
kubectl get pods -l app=minikube-sample
kubectl get svc minikube-sample-service
```

### Access the Application

```bash
# Get service URL (for LoadBalancer)
kubectl get svc minikube-sample-service

# For Minikube
minikube service minikube-sample-service --url

# Test endpoints
curl <service-url>/actuator/health
curl <service-url>/home/data
```

## 🔒 Security Features

- **Non-root container execution**
- **Restricted actuator endpoints** (only `/health` and `/info`)
- **HSTS headers** for HTTPS security
- **Security contexts** in Kubernetes
- **Resource limits** and requests
- **ReadOnly root filesystem** (where applicable)

## 🔄 CI/CD Pipeline

### Jenkins Pipeline Features

- Maven build and testing
- Docker image building and scanning
- Security vulnerability scanning
- Automated deployment to Kubernetes
- Parameterized builds for different environments

### Required Jenkins Credentials

```bash
# Environment Variables
AWS_ACCESS_KEY_ID=<your-access-key>
AWS_SECRET_KEY_ID=<your-secret-key>
GIT_REPO_URL=<your-git-repo>
ECR_REPO_NAME=<your-ecr-repo>
EKS_CLUSTER_NAME=<your-cluster-name>
AWS_DEFAULT_REGION=<your-region>
```

## 🏗️ Architecture

### Application Structure

```
src/
├── main/
│   ├── java/
│   │   └── com/minikube/sample/
│   │       ├── MinikubeSampleApplication.java
│   │       ├── config/SecurityConfig.java
│   │       ├── properties/PropertiesConfig.java
│   │       └── rest/controller/HomeResource.java
│   └── resources/
│       └── application.yml
├── test/
└── k8s/
    ├── configmap-minikube-sample.yaml
    └── deployment.yaml
```

### Endpoints

| Endpoint | Method | Description |
|----------|---------|-------------|
| `/actuator/health` | GET | Health check endpoint |
| `/actuator/info` | GET | Application information |
| `/home/data` | GET | Sample business endpoint |

## 🧪 Testing

```bash
# Unit tests
mvn test

# Integration tests
mvn verify

# Test coverage
mvn jacoco:report
```

## 🐛 Troubleshooting

### Common Issues

1. **Java Version**: Ensure Java 17+ is installed and JAVA_HOME is set
2. **Docker Build**: Make sure Docker daemon is running
3. **Kubernetes Access**: Verify kubectl configuration and cluster connectivity
4. **Port Conflicts**: Check if port 8080 is available

### Logs

```bash
# Application logs (Kubernetes)
kubectl logs -l app=minikube-sample -f

# Docker logs
docker logs minikube-sample
```

## 📊 Monitoring

- **Health Checks**: Built-in Spring Boot Actuator endpoints
- **Kubernetes Probes**: Liveness and readiness probes configured
- **Resource Monitoring**: CPU and memory limits set

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📝 License

This project is licensed under the MIT License.

## 🆘 Support

For issues and questions:
1. Check the [troubleshooting section](#🐛-troubleshooting)
2. Review the [CHANGELOG.md](CHANGELOG.md)
3. Create an issue in the repository

---

**Version**: 3.0.0  
**Last Updated**: October 2025
