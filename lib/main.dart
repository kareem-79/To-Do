import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/theme/app_theme.dart';
import 'package:to_do/modules/auth/pages/create_account_screen.dart';
import 'package:to_do/modules/auth/pages/login_screen.dart';
import 'package:to_do/modules/layout/layout_screen.dart';
import 'package:to_do/modules/splash/splash_screen.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do ",
      theme: AppTheme.darkTheme,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LayoutScreen.routeName: (_) => const LayoutScreen(),
        CreateAccountScreen.routeName: (_) => CreateAccountScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
