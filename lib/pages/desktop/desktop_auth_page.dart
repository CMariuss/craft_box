import 'package:craft_box/pages/desktop/desktop_login_page.dart';
import 'package:craft_box/pages/desktop/desktop_register_page.dart';
import 'package:craft_box/pages/mobile/mobile_login_page.dart';
import 'package:craft_box/pages/mobile/mobile_register_page.dart';
import 'package:flutter/material.dart';

class DesktopAuthPage extends StatefulWidget {
  const DesktopAuthPage({super.key});

  @override
  State<DesktopAuthPage> createState() => _DesktopAuthPageState();
}

class _DesktopAuthPageState extends State<DesktopAuthPage> {
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
      return DesktopLoginPage(onTap: togglePages);
    } else {
      return DesktopRegisterPage(onTap: togglePages);
    }
  }
}
