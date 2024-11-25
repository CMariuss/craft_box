import 'package:craft_box/firebase_options.dart';
import 'package:craft_box/pages/auth_page.dart';
import 'package:craft_box/pages/home_page.dart';
import 'package:craft_box/pages/profile_page.dart';
import 'package:craft_box/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/profile_page': (context) => const ProfilePage(),
        '/auth_page': (context) => const AuthPage(),
      },
    );
  }
}
