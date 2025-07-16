import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home/dashboard_screen.dart';
import '../screens/home/settings_screen.dart';
import '../screens/error/unknown_screen.dart';
import 'route_names.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case RouteNames.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      // Example with arguments
      // case RouteNames.profile:
      //   if (args is String) {
      //     return MaterialPageRoute(
      //       builder: (_) => ProfileScreen(userId: args),
      //     );
      //   }
      //   return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const UnknownScreen(),
    );
  }
}
