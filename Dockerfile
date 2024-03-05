# Stage 1: Build Stage
FROM eclipse-temurin:21@sha256:9d007c093e624bc410f113ee09f5209d3263e0bada7524e4de99eac9fbef06a5 as builder

WORKDIR /app

# Copy Gradle files and download dependencies
COPY ["build.gradle", "gradlew", "./"]
COPY gradle gradle
RUN chmod +x gradlew

# Copy the entire application
COPY . .

# Build the application
RUN ./gradlew downloadRepos

# Continue with the rest of your Dockerfile...

# Stage 2: Runtime Stage
FROM eclipse-temurin:21-jre-alpine@sha256:b5a1250bb72d804d49471207e2ebb574caffc13ac76f99618fb5ea06af621056

# Continue with the rest of your Dockerfile...
