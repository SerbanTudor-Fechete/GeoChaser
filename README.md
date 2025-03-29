# Geo Chaser Android App 
 Geo Chaser is a fun and health-focused mobile game that encourages players to discover random locations in their city while promoting physical activity. The app generates a random nearby destination, and your goal is to walk there and find it. 

## Table of Contents
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Installation & Setup](installation-&-setup)
- [Contributors](contributors)

## Features

- **Friendly User Interface & Experience**  
Intuitive UI built with Flutter, providing a seamless and engaging user experience across platforms.

- **Interactive Map Integration**  
Google Maps API integration for displaying location-based data and interactive maps.

- **Street View Integration:**  
Real-time Street View generation to enhance user navigation and exploration experience that uses Google API too.
  
- **RESTful API Communication**  
Smooth communication between frontend and backend via Spring Boot RESTful services.

- **Backend Services:**  
Robust backend logic for managing user data, locations, and game mechanics.

- **Database Integration**  
PostgreSQL database managed through Docker for seamless local development and deployment.

- **User Authentication**  
Secure login and registration using Firebase Authentication.

## Tech Stack

### Frontend:
- Flutter (Dart)
- Google Maps API 

### Backend:
- Spring Boot 
- PostgreSQL
- Docker

### Authentication: 
- Firebase Authentication 

## Project Structure
The project is organized into two main folders: api (backend) and ui (frontend).

### Backend 
```
com.example.demo/
├── config/
│   ├── ApiKeyLoader.java               # Loads Google Maps API keys for external location
│   └── ThymeleafConfig.java            # Configuration for Thymeleaf template engine
├── coordinates/
│   └── CoordinatesDto.java             # Data Transfer Object for coordinates
├── game/
│   ├── Game.java                       # Core game entity 
│   ├── GameController.java             # Controller for handling game-related requests
│   ├── GameRepository.java             # Repository for game data persistence
│   └── GameService.java                # Service layer for updating game business logic
├── street_view/
│   └── StreetViewController.java       # Controller for handling street view functionality
├── user/
│   ├── User.java                       # Core user entity/model
│   ├── UserController.java             # Controller for handling user-related requests
│   ├── UserDto.java                    # Data Transfer Object for user data
│   ├── UserRepository.java             # Repository for user data persistence
│   └── UserService.java                # Service layer for user business logic
├── utils/
│   ├── FirebaseConfig.java             # Configuration for Firebase integration
│   ├── FirebaseTokenFilter.java        # Filter for Firebase token authentication
│   ├── RandomCoordinateGenerator.java  # Utility for generating random coordinates
│   ├── SecurityConfig.java             # Security configuration 
│   └── WebConfig.java                  # Web-related configuration
├── DemoApplication.java                # Main application entry point
└── resources/
    └── templates/
        └── dynamicStreetView.html      # Thymeleaf template for street view
```
### Frontend
```
lib/
├── controllers/
│   ├── auth.dart                    # Authentication logic and controllers
│   ├── coordinates.dart             # Handles street view coordinates received from the api 
│   ├── current_location_logic.dart  # Logic for managing the user's current location
│   ├── finish_map_logic.dart        # Logic for displaying the end-game map
│   ├── main_map_logic.dart          # Core logic for the main map functionality
│   ├── mini_map_logic.dart          # Logic for the mini map view
│   ├── street_view_logic.dart       # Logic for handling street view functionality
│   └── widget_tree.dart             # Manages the widget tree structure for the app sign-in part
├── models/
│   ├── loading_screen_model.dart    # Model for the loading screen state
│   ├── page_route.dart              # Defines page routing transition for displaying the map
│   └── reusable_widgets.dart        # Reusable widget components for the app
├── views/
│   ├── finish_game_screen.dart      # Screen for the game completion view
│   ├── home_screen.dart             # Main home screen of the app
│   ├── leaderboards_screen.dart     # Screen displaying leaderboards
│   ├── map_screen.dart              # Screen for the main map view
│   ├── navbar_main.dart             # Main navigation bar component
│   ├── profile_screen.dart          # Screen for user profile view
│   ├── radius_screen.dart           # Screen for selecting the radius before the game starts
│   ├── sign_in_screen.dart          # Screen for user sign-in
│   ├── sign_up_screen.dart          # Screen for user sign-up
│   └── street_view_screen.dart      # Screen for street view
└── main.dart                        # Entry point of the application
```

## Installation & Setup
Follow these steps to set up the project on your local machine.

### 1️ Clone the Repository
```bash
git clone https://github.com/SerbanTudor-Fechete/GeoChaser.git

```

### 2 Install Flutter
- Install Flutter + Android Studio based on your OS ([Flutter Installation Guide](https://flutter.dev/docs/get-started/install))  
- Verify installation:  
```bash
flutter doctor
```

### 3 Install Java 17 & Spring Boot (with Maven)
You need Java 17 and Maven to run the backend.  
- Install OpenJDK 17 or any other JDK provider ([OpenJDK Downloads](https://openjdk.java.net/))  
- Install Maven ([Maven Installation Guide](https://maven.apache.org/install.html))  
- Alternatively, use an IDE like IntelliJ or VSCode with Java and Maven support.

### 4 Install Docker & PostgreSQL Image
- Install Docker Desktop ([Docker Installation Guide](https://docs.docker.com/get-docker/))
- Replace `youruser`, `yourpassword`, and `yourdb` with your preferred values.  
- Run this command to pull and run the PostgreSQL container:  
```bash
docker run --name my-postgres \
 -e POSTGRES_USER=youruser \
 -e POSTGRES_PASSWORD=yourpassword \
 -e POSTGRES_DB=yourdb \
 -p 5432:5432 \
 -d postgres
```
- Update your `application.properties` in the Spring Boot project:  
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/yourdb
spring.datasource.username=youruser
spring.datasource.password=yourpassword
```

### 5 Create a Google Maps API Key
- Go to the [Google Maps API Console](https://console.cloud.google.com/apis/dashboard)  
- Create a new project or select an existing one  
- Enable the following APIs:  
  - Maps SDK for Android
  - Street View Static API  
- Go to **Credentials** → **Create API Key**  
- Restrict the key for security (HTTP referrer or package name)  
- Add your API key to your Flutter project: `android/app/src/main/AndroidManifest.xml`  

### 6 Create a Firebase Project
- Go to the [Firebase Console](https://console.firebase.google.com/)  
- Click **Add Project**  
- Follow the setup steps and register your app (Android)  
- Enable **Authentication** → Sign-in methods (e.g., Email/Password)  
- Download the configuration file: `google-services.json`
- Place them in your Flutter project accordingly.

### 7 You're Ready to Go!
#### Start the Backend 
- Open in IntelliJ and run the `main()` method in your application class or:
```bash
cd api
mvn spring-boot:run
```

#### Start the Frontend
- Make sure a device or emulator is connected.
```bash
cd ui
flutter pub get
flutter run
```
## Contributors
<div style="display: flex; gap: 10px;">
<a href="https://github.com/AndreiT01"><img src="https://github.com/AndreiT01.png?size=100" width="100" style="border-radius:50%" /></a>
<a href="https://github.com/SerbanTudor-Fechete"><img src="https://github.com/SerbanTudor-Fechete.png?size=100" width="100" style="border-radius:50%" /></a>
</div>
