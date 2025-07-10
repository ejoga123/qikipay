import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'services/auth_service.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const QikiPayApp());
}

class QikiPayApp extends StatelessWidget {
  const QikiPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return MaterialApp(
      title: 'QikiPay',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: authService.userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return const DashboardScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
