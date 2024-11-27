import 'package:craft_box/pages/screen_adapt.dart';
import 'package:craft_box/pages/screen_sizes/desktop/desktop_edit_profile_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_edit_profile_page.dart';
import 'package:craft_box/pages/screen_sizes/tablet/tablet_edit_profile_page.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenAdapt(
      mobileScaffold: MobileEditProfilePage(),
      tabletScaffold: TabletEditProfilePage(),
      desktopScaffold: DesktopEditProfilePage(),
    );
    ;
  }
}
