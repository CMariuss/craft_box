import 'package:craft_box/pages/screen_adapt.dart';
import 'package:craft_box/pages/screen_sizes/desktop/desktop_home_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_home_page.dart';
import 'package:craft_box/pages/screen_sizes/tablet/tablet_home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenAdapt(
      mobileScaffold: MobileHomePage(),
      tabletScaffold: TabletHomePage(),
      desktopScaffold: DesktopHomePage(),
    );
  }
}
