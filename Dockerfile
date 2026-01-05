# ================================
# 🏗️ Etapa 1: Build con Maven y Java 21
# ================================
FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ================================
# 🚀 Etapa 2: Runtime liviano
# ================================
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]