import 'package:app_eight_social_app/auth/auth.dart';
import 'package:app_eight_social_app/theme/dark_mode.dart';
import 'package:app_eight_social_app/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        "/login_register_page": (context) => LoginOrRegister(),
        "/home_page": (context) => HomePage(),
        "/profile_page": (context) => ProfilePage(),
        "/user_page": (context) => UserPage(),
      },
    );
  }
}
