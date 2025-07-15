import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'QikiPay';
  static const String supportEmail = 'support@qikipay.com';
  static const String supportPhone = '+234 800 123 4567';

  // Routes
  static const String routeDashboard = '/dashboard';
  static const String routeLogin = '/login';
  static const String routeSignup = '/signup';

  // Shared Preferences Keys
  static const String prefIsDarkMode = 'isDarkMode';
  static const String prefUserToken = 'userToken';
  static const String prefHasSeenOnboarding = 'hasSeenOnboarding';

  // Colors
  static const Color primaryColor = Colors.indigo;
  static const Color accentColor = Colors.indigoAccent;
  static const Color errorColor = Colors.redAccent;

  // Strings
  static const String successMessage = 'Action completed successfully!';
  static const String errorMessage = 'Something went wrong. Please try again.';
}
