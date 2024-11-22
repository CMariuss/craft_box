import 'package:craft_box/pages/home_page.dart';
import 'package:craft_box/pages/login_page.dart';
import 'package:craft_box/pages/profile_page.dart';
import 'package:craft_box/pages/register_page.dart';
import 'package:craft_box/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: lightMode,
      routes: {
        '/profile_page': (context) => const ProfilePage(),
        '/login_page': (context) => const LoginPage(),
        '/register_page': (context) => const RegisterPage(),
      },
    );
  }
}
