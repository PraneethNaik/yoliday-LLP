# 📱 Portfolio UI App (Flutter)

A Flutter mobile application built based on a Figma design.  
This project demonstrates clean architecture, responsive UI, reusable components, and basic functionality like search filtering and tab navigation.

---

## 🚀 Features

### 🧭 Navigation
- Bottom Navigation Bar (Home, Portfolio, Input, Profile)
- Active tab highlighted with orange color
- Indicator line above selected icon

### 📊 Portfolio Screen
- Header with title and icons
- Tab section:
  - Project ✅
  - Saved (empty)
  - Shared (empty)
  - Achievement (empty)
- Animated tab indicator
- Search bar with live filtering
- Floating filter button (UI only)

### 📦 Project Cards
- Image, title, subject, author, grade
- Clean layout matching Figma
- Scrollable list

### 🔍 Search Functionality
- Filters projects based on title
- Real-time UI update using setState

---

## 🧱 Tech Stack

- Flutter
- Dart
- flutter_screenutil (responsive UI)
- flutter_svg (SVG icons)

---

## 📁 Project Structure

`plaintext
lib/
│
├── main.dart
│
├── data/
│   └── project_data.dart        # Static project data
│
├── models/
│   └── project_model.dart       # Data model
│
├── screens/
│   ├── main_screen.dart         # Navigation controller
│   └── portfolio_screen.dart   # Main UI screen
│
├── widgets/
│   ├── bottom_navbar_widget.dart
│   ├── project_card.dart
│   ├── searchbar_widget.dart
│   └── filter_widget.dart
│
assets/
├── icons/
├── images/
├── fonts/



