# WebService Architecture

![Java](https://img.shields.io/badge/Java-17%2B-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.x-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-Database-47A248?style=for-the-badge&logo=mongodb&logoColor=white)
![GraphQL](https://img.shields.io/badge/GraphQL-API-E10098?style=for-the-badge&logo=graphql&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-Mobile-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![AngularJS](https://img.shields.io/badge/AngularJS-Frontend-E23237?style=for-the-badge&logo=angularjs&logoColor=white)

## 📖 Project Overview

**WebService Architecture** is a comprehensive, polyglot full-stack solution designed to demonstrate advanced API communication patterns. The system integrates a robust **Spring Boot** backend that serves data via **Hypermedia-Driven REST (HATEOAS)** and **GraphQL**, consuming these services through multiple client interfaces including **Flutter (Mobile)**, **AngularJS**, and **jQuery**.

This architecture prioritizes scalability, discoverability (via HAL), and cross-platform compatibility, bridging the gap between traditional web clients and modern mobile ecosystems.

## 🚀 Key Features

*   **Hypermedia-Driven API:** Implements HATEOAS principles using Spring HATEOAS for self-discoverable RESTful resources.
*   **NoSQL Persistence:** Leverages **Spring Data MongoDB** for high-performance, schema-less data storage.
*   **Auto-Exposed Repositories:** Utilizes **Spring Data REST** to automatically generate CRUD endpoints with HAL formatting.
*   **Hybrid API Layer:** Supports both standard REST and **GraphQL** queries within the same application context.
*   **Cross-Platform Clients:**
    *   **Mobile:** A native Flutter application consuming GraphQL.
    *   **Web:** Legacy-compatible clients built with AngularJS and jQuery.
*   **Security & Networking:** Configured CORS policies to support distributed client-server architecture.

---

## 📂 Repository Structure

The monorepo is divided into two core modules:

```bash
OmniService-Architecture/
├── backend-service/        # Spring Boot Core (REST & GraphQL APIs)
│   ├── src/main/java       # Business Logic & Controllers
│   ├── src/main/resources  # Config, Static Web Clients, & GraphQL Schema
│   └── pom.xml             # Maven Build Configuration
│
└── mobile-client/          # Flutter Native Application
    ├── lib/                # Dart UI & Logic
    └── pubspec.yaml        # Flutter Dependencies
```
# 🛠️ Installation & Setup
## Prerequisites
- JDK 17 or higher
- Maven 3.8+
- Flutter SDK (Latest Stable)
- MongoDB (Running locally on port 27017)

## 1. Backend Service (Spring Boot)
The backend handles all business logic, database connections, and serves the web clients.
```bash
# Navigate to the backend directory
cd backend-service

# Clean and install dependencies
mvn clean install

# Run the application
mvn spring-boot:run
```
## 2. Mobile Client (Flutter)
The mobile client connects to the GraphQL endpoint of the backend.
```bash
# Navigate to the mobile client directory
cd mobile-client

# Install Dart dependencies
flutter pub get

# Run on Emulator (Ensure Android Emulator or iOS Simulator is active)
flutter run
```

# 🔌 API Documentation & Usage
## 1. REST Endpoints (HATEOAS)

| Method | Endpoint   | Description                               |
|--------|------------|-------------------------------------------|
| GET    | /greeting  | Returns a greeting with HATEOAS self-links. |
| GET    | /people    | Lists all person entities (HAL format).     |
| POST   | /people    | Creates a new person entity.                |

## 2. GraphQL Endpoint
The service exposes a GraphQL playground (if enabled) or accepts POST requests at /graphql.
```bash
query GetGreeting($name: String) {
  hello(name: $name)
}
```
## 3. Integrated Web Clients
The backend serves static clients directly for testing and legacy support:

- **Person Management Dashboard:** http://localhost:8080/people-manager.html
- **AngularJS Client:** http://localhost:8080/angular-client.html
- **jQuery Client:** http://localhost:8080/jquery-client.html

## ⚙️ Configuration

### Database Connection
Modify `backend-service/src/main/resources/application.properties` to adjust database credentials:

```properties
spring.data.mongodb.host=localhost
spring.data.mongodb.port=27017
spring.data.mongodb.database=omniservice_db
```
## CORS Policies
Global CORS is enabled to allow requests from local development ports (e.g., Flutter emulators, external frontend servers).
