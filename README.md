# 📝 To-Do App (Flutter)

A simple and clean **To-Do application** built using **Flutter** that allows users to add, categorize, and manage tasks with different priorities. It uses **SharedPreferences** for local storage, so tasks remain saved even after the app is closed.

## 🚀 Features

- ✅ Add new tasks
- 🗂️ Assign task priority: **Very Important**, **Important**, or **Normal**
- 🧠 View tasks with colored labels based on priority
- ❌ Delete tasks
- 💾 Local data persistence using SharedPreferences
- 📱 Smooth navigation with Flutter’s routing

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / VS Code
- A connected Android/iOS device or emulator

### Setup

```bash
git clone https://github.com/anubhavkhamari/to-do-flutter.git
cd to-do-flutter
flutter pub get
flutter run

lib/
│
├── main.dart                 # App entry point
├── pages/
│   ├── TaskListPage.dart     # Main screen to show tasks
│   └── AddTaskPage.dart      # Screen to add new task


📦 Packages Used

shared_preferences – To store tasks locally
flutter/material.dart – For UI components
✨ Future Improvements

Edit tasks
Mark tasks as completed
Add calendar-based deadlines
Search functionality
🙌 Contributions

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

👨‍💻 Author

Anubhav Khamari
GitHub: @anubhavkhamari