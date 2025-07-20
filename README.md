# QikiPay 💸 - Mobile Wallet App

QikiPay is a secure, modern mobile wallet application built using **Flutter** and integrated with **Firebase**. It supports user registration, wallet management, secure transactions, notifications, profile editing, and more.

---

## 📦 Features

- 🔐 Authentication with email/password
- 💰 View wallet balance
- 🔄 Send and receive money
- 💳 Top-up your wallet
- 📜 View transaction history
- 🔔 Get real-time notifications
- 🧑 Profile screen with edit and logout options
- 🛠 Support section for user assistance
- 🧭 Persistent navigation using bottom tabs
- 🎯 Responsive onboarding and splash screens

---

## 🔧 Tech Stack

| Layer         | Technology                             |
| ------------- | -------------------------------------- |
| Language      | Dart (Flutter)                         |
| Backend/Auth  | Firebase Auth                          |
| Data Storage  | Firebase Firestore                     |
| State & Nav   | Stateful widgets / Provider (optional) |
| Animation     | AnimationController / FadeTransition   |
| UI Components | Custom Widgets, Material Design        |
| Services      | Modular Service Classes                |

---

## 🛠 Folder Structure

lib/ ├── config/ # Constants, styles, colors ├── models/ # User, Transaction, Notification models ├── screens/ │ ├── auth/ # Login, Signup, Onboarding, Splash │ ├── home/ # Dashboard, SendMoney, TopUp, Transactions, Settings │ ├── profile/ # Profile & Edit Profile │ └── support/ # Support screen ├── services/ # AuthService, WalletService, TransactionService ├── widgets/ # Reusable UI components └── main.dart # App entry point

---

## 🚀 Getting Started

### 🔌 Prerequisites

- Flutter SDK installed: https://docs.flutter.dev/get-started/install
- Firebase project set up
- Android/iOS emulator or physical device

### ⚙️ Setup Instructions

1. **Clone the repository**

   ```bash
   git clone https://github.com/ejoga123/qikipay.git
   cd qikipay

   ```

2. Install dependencies
   flutter pub get

3. Connect Firebase

- Add your google-services.json to android/app/
- Add GoogleService-Info.plist to ios/Runner/
- Configure Firebase in main.dart

4. Run the app
   flutter run

   Key Screens Summary
   | Screen | Description |
   | LoginScreen | Authenticates returning users |
   | SignupScreen| Registers new users |
   | DashboardScreen | Displays wallet balance + summary |
   | SendMoneyScreen | Allows transfers to other users |
   | TopUpScreen | Adds funds to wallet |
   | TransactionScreen| Shows list of all transactions |
   | ProfileScreen | User info, avatar, logout |
   | SupportScreen | Help & contact |
   | SettingsScreen | App configuration |
   | OnboardingScreen | Intro slides |
   | SplashScreen | Launch screen for brand & loading |

Firebase Authentication Methods

- registerWithEmail(email, password)
- loginWithEmail(email, password)
- sendPasswordResetEmail(email)
- logout()

Provided through AuthService

Navigation Flow

- Splash → Onboarding → Login/Signup → Dashboard → HomeWrapper
- BottomNavigationBar provides tabbed navigation within HomeWrapper

Best Practices Used

- Separation of concerns (screens/, services/, models/)
- State preservation with IndexedStack
- Reusable components via widgets/
- Input validation and error handling in auth and forms
- Responsive layout with SafeArea, padding, and scroll views
- Fade and intro animations for UX enhancement

Contribution Guide

- Fork the repo
- Create a new branch: git checkout -b feature/your-feature
- Commit your changes: git commit -m "feat: add feature"
- Push to branch: git push origin feature/your-feature
- Create Pull Request

Absolutely — here’s a comprehensive README.md for your QikiPay Flutter project. It covers everything from setup to deployment, with structured sections and details to help developers get on board smoothly 🚀📲

📘 QikiPay README

# QikiPay 💸 - Mobile Wallet App

QikiPay is a secure, modern mobile wallet application built using **Flutter** and integrated with **Firebase**. It supports user registration, wallet management, secure transactions, notifications, profile editing, and more.

---

## 📦 Features

- 🔐 Authentication with email/password
- 💰 View wallet balance
- 🔄 Send and receive money
- 💳 Top-up your wallet
- 📜 View transaction history
- 🔔 Get real-time notifications
- 🧑 Profile screen with edit and logout options
- 🛠 Support section for user assistance
- 🧭 Persistent navigation using bottom tabs
- 🎯 Responsive onboarding and splash screens

---

## 🔧 Tech Stack

| Layer         | Technology                             |
| ------------- | -------------------------------------- |
| Language      | Dart (Flutter)                         |
| Backend/Auth  | Firebase Auth                          |
| Data Storage  | Firebase Firestore                     |
| State & Nav   | Stateful widgets / Provider (optional) |
| Animation     | AnimationController / FadeTransition   |
| UI Components | Custom Widgets, Material Design        |
| Services      | Modular Service Classes                |

---

## 🛠 Folder Structure


lib/ ├── config/ # Constants, styles, colors ├── models/ # User, Transaction, Notification models ├── screens/ │ ├── auth/ # Login, Signup, Onboarding, Splash │ ├── home/ # Dashboard, SendMoney, TopUp, Transactions, Settings │ ├── profile/ # Profile & Edit Profile │ └── support/ # Support screen ├── services/ # AuthService, WalletService, TransactionService ├── widgets/ # Reusable UI components └── main.dart # App entry point

---

## 🚀 Getting Started

### 🔌 Prerequisites

- Flutter SDK installed: https://docs.flutter.dev/get-started/install
- Firebase project set up
- Android/iOS emulator or physical device

### ⚙️ Setup Instructions

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/qikipay.git
   cd qikipay
   ```



- Install dependencies
  flutter pub get
- Connect Firebase
- Add your google-services.json to android/app/
- Add GoogleService-Info.plist to ios/Runner/
- Configure Firebase in main.dart
- Run the app
  flutter run

🧪 Key Screens Summary
| Screen | Description |
| LoginScreen | Authenticates returning users |
| SignupScreen | Registers new users |
| DashboardScreen | Displays wallet balance + summary |
| SendMoneyScreen | Allows transfers to other users |
| TopUpScreen | Adds funds to wallet |
| TransactionHistoryScreen | Shows list of all transactions |
| ProfileScreen | User info, avatar, logout |
| SupportScreen | Help & contact |
| SettingsScreen | App configuration |
| OnboardingScreen | Intro slides |
| SplashScreen | Launch screen for brand & loading |

🔐 Firebase Authentication Methods

- registerWithEmail(email, password)
- loginWithEmail(email, password)
- sendPasswordResetEmail(email)
- logout()
  Provided through AuthService

📲 Navigation Flow

- Splash → Onboarding → Login/Signup → Dashboard → HomeWrapper
- BottomNavigationBar provides tabbed navigation within HomeWrapper

✅ Best Practices Used

- Separation of concerns (screens/, services/, models/)
- State preservation with IndexedStack
- Reusable components via widgets/
- Input validation and error handling in auth and forms
- Responsive layout with SafeArea, padding, and scroll views
- Fade and intro animations for UX enhancement

📤 Contribution Guide

- Fork the repo
- Create a new branch: git checkout -b feature/your-feature
- Commit your changes: git commit -m "feat: add feature"
- Push to branch: git push origin feature/your-feature
- Create Pull Request

Support
If you encounter bugs or need help, open an issue or visit the Support screen in-app.
For backend and Firebase setup, refer to Firebase Docs.

License
MIT License © 2025 QikiPay Inc.
