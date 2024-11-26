import 'package:craft_box/pages/mobile/mobile_login_page.dart';
import 'package:craft_box/pages/mobile/mobile_register_page.dart';
import 'package:flutter/material.dart';

class TabletAuthPage extends StatefulWidget {
  const TabletAuthPage({super.key});

  @override
  State<TabletAuthPage> createState() => _TabletAuthPageState();
}

class _TabletAuthPageState extends State<TabletAuthPage> {
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
