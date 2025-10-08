# Multi-stage build for security and efficiency
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /build
RUN apk add --no-cache bash

# Copy Maven files
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
COPY mvnw.cmd .
RUN chmod +x mvnw

# Copy source code
COPY src ./src

# Build the application
RUN bash ./mvnw clean package -DskipTests

# Production stage with minimal JRE
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Create non-root user
RUN addgroup -g 1000 appuser && \
    adduser -u 1000 -G appuser -s /bin/sh -D appuser

# Copy the built JAR from builder stage
COPY --from=builder /build/target/*.jar app.jar

# Change ownership to non-root user
RUN chown appuser:appuser app.jar

# Switch to non-root user
USER appuser

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# Run the application
EXPOSE 8080
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
