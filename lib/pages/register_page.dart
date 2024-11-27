import 'package:craft_box/pages/screen_adapt.dart';
import 'package:craft_box/pages/screen_sizes/desktop/desktop_register_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_register_page.dart';
import 'package:craft_box/pages/screen_sizes/tablet/tablet_register_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenAdapt(
      mobileScaffold: MobileRegisterPage(onTap: onTap),
      tabletScaffold: TabletRegisterPage(onTap: onTap),
      desktopScaffold: DesktopRegisterPage(onTap: onTap),
    );
  }
}
