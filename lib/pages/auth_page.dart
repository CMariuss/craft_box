import 'package:craft_box/pages/login_page.dart';
import 'package:craft_box/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //
  bool showLoginPage = true;

  // toggle between login and register pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onRegisterTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
