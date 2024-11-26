import 'package:craft_box/pages/desktop/desktop_profile_page.dart';
import 'package:craft_box/pages/mobile/mobile_profile_page.dart';
import 'package:craft_box/pages/tablet/tablet_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/presentation/cubits/auth_cubit.dart';
import '../../pages/desktop/desktop_home_page.dart';
import '../../pages/mobile/mobile_home_page.dart';
import '../../pages/tablet/tablet_home_page.dart';
import '../../services/screen_size_service.dart';
import '../drawer_tile.dart';

class DesktopDrawer extends StatelessWidget {
  const DesktopDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // profile
            DrawerTile(
              icon: CupertinoIcons.person,
              title: 'Profile',
              iconSize: 20,
              onTap: () {
                // close drawer
                Navigator.pop(context);

                // go to profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenSizeService.getScreen(
                      [
                        const MobileProfilePage(),
                        const TabletProfilePage(),
                        const DesktopProfilePage(),
                      ],
                    ),
                  ),
                );
              },
            ),

            // saved items
            DrawerTile(
              icon: CupertinoIcons.person_2,
              title: 'Contacts',
              iconSize: 20,
              onTap: () {},
            ),

            // saved items
            DrawerTile(
              icon: CupertinoIcons.bookmark,
              title: 'Saved items',
              iconSize: 18,
              onTap: () {},
            ),

            // notifications
            DrawerTile(
              icon: CupertinoIcons.bell,
              title: 'Notifications',
              iconSize: 18,
              onTap: () {},
            ),

            // about app
            DrawerTile(
              icon: CupertinoIcons.cube,
              title: 'About',
              iconSize: 18,
              onTap: () {},
            ),

            // settings
            DrawerTile(
              icon: Icons.settings,
              title: 'Settings',
              iconSize: 22,
              onTap: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: DrawerTile(
            icon: Icons.logout_rounded,
            title: 'Logout',
            iconSize: 22,
            onTap: () async {
              await context.read<AuthCubit>().logout();
            },
          ),
        ),
      ],
    );
  }
}
