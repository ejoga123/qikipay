import 'package:flutter/material.dart';
import '../utils/local_storage.dart';
import '../routes/route_names.dart';

class AuthGuard {
  static Future<bool> isAuthenticated() async {
    final token = await LocalStorage.getString('userToken');
    return token != null && token.isNotEmpty;
  }

  static Future<void> handleGuard(
    BuildContext context,
    String protectedRoute,
  ) async {
    final loggedIn = await isAuthenticated();
    if (loggedIn) {
      Navigator.pushNamed(context, protectedRoute);
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.login);
    }
  }
}
