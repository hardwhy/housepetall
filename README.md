# 📱 Housepetall Mobile App

<p align="center">
  <img src="assets/images/app_logo.svg" alt="Housepetall Logo" width="300">
</p>

## 📌 Description
Welcome to the **Housepetall Mobile App** repository! This project provides the Flutter-based mobile application for Housepetall, seamlessly integrating with the Housepetall API.

## 🛠 Environment Setup
### ✅ Prerequisites
Ensure you have the following installed:
- **Flutter (latest stable version)**
- **Dart (compatible with your Flutter version)**
- **Android Studio/Xcode (for Android/iOS development)**

### 🔧 Environment Variables
Configure the required environment variables before running the project. The `host` should be set to your laptop's IP address for API access. Example:
```dart
// lib/config.dart
class Config {
  static const String host = '192.168.1.11:3000';
}
```

## 📥 Installation
Clone the repository and install dependencies:
```bash
git clone git@github.com:hardwhy/housepetall.git #or https://github.com/hardwhy/housepetall.git
code <project_directory> #if using VSCode
flutter pub get
```

## 🚀 Running the Project Locally
To run the Flutter app on an emulator or physical device:
```bash
flutter run
```
For Android:
```bash
flutter run -d android
```
For iOS:
```bash
flutter run -d ios
```

## 📘 Additional Information
For troubleshooting tips, contributions, or further details, check out the project documentation or open an issue. Happy coding! 🎉

## Attachments
[App Preview](https://drive.google.com/file/d/1wikXDuCidO4rmtxororNyhyEXNBToHaZ/view?usp=sharing)

