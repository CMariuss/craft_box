import 'package:craft_box/components/drawer_tile.dart';
import 'package:craft_box/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/presentation/cubits/auth_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              // app logo
              Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme:
                      const DividerThemeData(color: Colors.transparent),
                ),
                child: DrawerHeader(
                  child: Icon(
                    CupertinoIcons.cube,
                    size: 70,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              Column(
                children: [
                  // profile
                  DrawerTile(
                    icon: CupertinoIcons.person,
                    title: 'Profile',
                    iconSize: 20,
                    onTap: () {
                      // close drawer
                      Navigator.pop(context);

                      // get current user id
                      final currentUser = context.read<AuthCubit>().currentUser;
                      String? userId = currentUser!.userId;

                      // go to profile page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            userId: userId,
                          ),
                        ),
                      );
                    },
                  ),

                  // contacts
                  DrawerTile(
                    icon: CupertinoIcons.person_2,
                    title: 'Contacts',
                    iconSize: 20,
                    onTap: () {},
                  ),

                  // explore
                  DrawerTile(
                    icon: CupertinoIcons.search,
                    title: 'Explore',
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
                    iconSize: 20,
                    onTap: () {},
                  ),

                  // settings
                  DrawerTile(
                    icon: Icons.settings,
                    title: 'Settings',
                    iconSize: 20,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 30),
            // logout option
            child: DrawerTile(
              icon: Icons.logout_rounded,
              title: 'Logout',
              iconSize: 22,
              onTap: () {
                context.read<AuthCubit>().logout();
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
