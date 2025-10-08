# Changelog

All notable changes to this project will be documented in this file.

## [3.0.0] - 2025-10-08

### 🔥 BREAKING CHANGES
- **Java Version**: Upgraded from Java 8 to Java 17 (LTS)
- **Spring Boot**: Upgraded from 2.2.1.RELEASE to 2.7.18 (latest stable)
- **Maven Compiler**: Updated to use Java 17 compilation target

### ✨ Features
- **Security**: Added comprehensive security configuration with Spring Security
- **Docker**: Implemented secure multi-stage Docker build with non-root user
- **Kubernetes**: Enhanced deployment manifests with security policies and resource limits
- **ConfigMap**: Created proper Kubernetes ConfigMap configuration

### 🔒 Security Fixes
- **CVE Fixes**: Resolved multiple critical security vulnerabilities by upgrading dependencies
- **Dependency Updates**:
  - Lombok: 1.18.20 → 1.18.34 (Java 17+ compatibility)
  - Spring Cloud Kubernetes: Removed problematic dependency (version compatibility issues)
  - Jackson: Added explicit jackson-databind dependency
  - Maven Compiler Plugin: 3.8.1 → 3.11.0
- **Docker Security**:
  - Base image: `openjdk:8-jdk-alpine` → `eclipse-temurin:11-jre-alpine`
  - Added non-root user execution
  - Multi-stage build to reduce attack surface
- **Application Security**:
  - Restricted actuator endpoints (only `/health` and `/info` exposed)
  - Added HSTS headers
  - Configured proper CSRF protection

### 🐛 Bug Fixes
- **Configuration**: Fixed typo `inculde` → `include` in application.yml
- **Tests**: Migrated from JUnit 4 to JUnit 5
- **Build**: Fixed JAVA_HOME configuration issues
- **Dependencies**: Resolved dependency conflicts and missing transitive dependencies

### 🏗️ Infrastructure
- **Jenkins**: Parameterized pipeline variables for better security
- **Deployment**: Enhanced Kubernetes manifests with:
  - Resource requests and limits
  - Security contexts
  - Health checks (liveness and readiness probes)
  - Service account configurations
- **Docker**: Added health check and optimized image layers

### 📝 Documentation
- Updated README with new build requirements
- Added comprehensive deployment instructions
- Documented required Jenkins credentials and environment variables

### ⚡ Performance
- **Docker**: Multi-stage build reduces final image size
- **JVM**: Java 17 performance improvements
- **Spring Boot**: 2.7.x performance enhancements

### 🔧 Technical Debt
- Removed deprecated WebSecurityConfigurerAdapter pattern
- Updated to modern Spring Security configuration
- Cleaned up unused dependencies
- Improved error handling and logging

### 📋 Migration Notes
- **Java 17** is now required for building and running the application
- **Docker images** need to be rebuilt due to base image changes
- **Kubernetes deployments** should be updated with new manifests
- **Jenkins pipelines** require additional environment variables
