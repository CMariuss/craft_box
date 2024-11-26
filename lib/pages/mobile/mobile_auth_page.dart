import 'package:craft_box/pages/mobile/mobile_login_page.dart';
import 'package:craft_box/pages/mobile/mobile_register_page.dart';
import 'package:flutter/material.dart';

class MobileAuthPage extends StatefulWidget {
  const MobileAuthPage({super.key});

  @override
  State<MobileAuthPage> createState() => _MobileAuthPageState();
}

class _MobileAuthPageState extends State<MobileAuthPage> {
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
      return MobileLoginPage(onTap: togglePages);
    } else {
      return MobileRegisterPage(onTap: togglePages);
    }
  }
}
