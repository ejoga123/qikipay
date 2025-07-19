import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import Firebase options for proper initialization on web
import 'firebase_options.dart';

// Import your providers
import 'providers/user_provider.dart';
import 'providers/wallet_provider.dart';

// Import your config and routing
import 'config/app_config.dart';
import 'config/theme_config.dart';
import 'routes/route_names.dart';
import 'routes/route_generator.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<WalletProvider>(create: (_) => WalletProvider()),
        // Add more providers here as needed
      ],
      child: MaterialApp(
        title: AppConfig.appName,
        debugShowCheckedModeBanner: AppConfig.showDebugBanner,
        theme: ThemeConfig.lightTheme,
        darkTheme: ThemeConfig.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: RouteNames.login,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
