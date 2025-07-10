import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'config/constants.dart';

class QikiPayApp extends StatelessWidget {
  const QikiPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QikiPay Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
          labelLarge: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
