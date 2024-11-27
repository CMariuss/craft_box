import 'package:craft_box/pages/screen_adapt.dart';
import 'package:craft_box/pages/screen_sizes/desktop/desktop_profile_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_profile_page.dart';
import 'package:craft_box/pages/screen_sizes/tablet/tablet_profile_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenAdapt(
      mobileScaffold: MobileProfilePage(),
      tabletScaffold: TabletProfilePage(),
      desktopScaffold: DesktopProfilePage(),
    );
  }
}
