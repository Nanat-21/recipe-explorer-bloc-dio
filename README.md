# 🥗 Recipe Explorer Pro (App 2)
### *Clean Architecture with BLoC & Dio*

A scalable Flutter application built using **BLoC for state management** and **Dio for networking**, following **Clean Architecture principles**.  
This version focuses on maintainability, scalability, and separation of concerns across Data, Domain, and Presentation layers.

---

## 📸 Screenshots & UI

### 🏛️ Clean Architecture Overview
This project is structured into clean layers:
- Data Layer (API + Repositories)
- Domain Layer (Business Logic)
- Presentation Layer (UI)

<p float="left">
  <img src="screenshots/Screenshot 2026-05-18 184951.png" width="200"/>
  <img src="screenshots/Screenshot 2026-05-18 185111.png" width="200"/>
</p>

---

### ⚡ BLoC State Management Flow
The app uses an event-driven architecture:
- Events → Trigger actions
- States → Update UI
- BlocBuilder → Reactive rendering

<p float="left">
  <img src="screenshots/Screenshot 2026-05-18 185005.png" width="200"/>
  <img src="screenshots/Screenshot 2026-05-18 185048.png" width="200"/>
</p>

---

### 🔍 Recipe Search & API Integration
Recipes are fetched using **Dio**, with:
- Interceptors
- Error handling
- Clean repository pattern

<p float="left">
  <img src="screenshots/Screenshot 2026-05-18 184951.png" width="200"/>
</p>

---

### ❤️ Favorites System
Favorites are managed using **Bloc Events & States**, ensuring predictable UI updates.

<p float="left">
  <img src="screenshots/Screenshot 2026-05-18 185136.png" width="200"/>
</p>

---

### 📱 UI Screens Overview
Modern Flutter UI built with Material Design and reactive state management.

<p float="left">
  <img src="screenshots/Screenshot 2026-05-18 185242.png" width="200"/>
  <img src="screenshots/Screenshot 2026-05-18 185315.png" width="200"/>
</p>

---

## 🛠️ Tech Stack

- **State Management:** Flutter BLoC  
- **Networking:** Dio (with interceptors & error handling)  
- **Architecture:** Clean Architecture (Data → Domain → Presentation)  
- **Language:** Dart  
- **Framework:** Flutter  

---

## 💎 Key Features

- ⚡ Fully reactive UI using Bloc pattern  
- 🌐 Advanced API integration using Dio  
- 🧠 Clean separation of business logic  
- 🚨 Centralized error handling system  
- 🔄 Event-driven architecture  
- 📦 Scalable and maintainable project structure  

---

## 🏗️ Project Structure

```text
lib/
├── core/
│   ├── network/
│   ├── errors/
│   └── constants/
│
├── data/
│   ├── models/
│   ├── datasources/
│   └── repositories/
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── bloc/
│   ├── meal_bloc.dart
│   ├── meal_event.dart
│   └── meal_state.dart
│
├── presentation/
│   ├── screens/
│   ├── widgets/
│   └── pages/
│
└── main.dart

```

## 🚀 How to Run

# 1. Clone repository
git clone https://github.com/Nanat-21/recipe-explorer-bloc-dio.git

# 2. Navigate to project
cd recipe-explorer-bloc-dio

# 3. Install dependencies
flutter pub get

# 4. Run app
flutter run

---

# 🔮 Future Improvements

- Dependency Injection (GetIt / Injectable)
- Unit & widget testing
- Offline caching (Hive / SQLite)
- Pagination support
- Firebase integration

---

# 👨‍💻 Author

Developed by Nanat Abeshu
