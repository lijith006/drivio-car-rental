# Drivio – Car Rental Booking App

## Overview
Drivio is a simple multi-screen Car Rental Booking application built using Flutter as part of a technical assignment.  
The app follows an **MVP-style product approach (Minimum Viable Product)** and focuses on clean code, proper folder structure, and clear state management without overengineering.

No backend is used — all data is mocked locally as per the task requirements.

---

## Features
- Mock login (no backend authentication)
- Browse available cars using mock data
- View car details including pricing and specifications
- Book a car by entering name, dates, and pickup location
- Booking confirmation screen with summary details

---

## Architecture & State Management
The project uses a **feature-based layered architecture** with **Provider (ChangeNotifier)** for state management.

- **Screens** handle only UI and user interaction
- **Providers** manage application state and business logic
- **Models** define data structures
- **Mock data** is used as the local data source
- **Reusable widgets** and constants are extracted to maintain clean and consistent UI

This structure keeps the codebase readable, scalable, and suitable for an MVP-level application.

---


## Tech Stack
- Flutter
- Dart
- Provider (ChangeNotifier)

---

## How to Run the App
1. Clone the repository  
2. Run `flutter pub get`  
3. Run `flutter run`

---

## Notes
This project was built to demonstrate Flutter fundamentals, clean code practices, state management using Provider, and a well-structured multi-screen application flow.
