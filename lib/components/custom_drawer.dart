import 'package:craft_box/components/drawer_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              // app logo
              DrawerHeader(
                child: Icon(
                  CupertinoIcons.cube,
                  size: 50,
                ),
              ),
              SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    // profile
                    DrawerTile(
                      icon: CupertinoIcons.person,
                      title: 'Profile',
                      iconSize: 20,
                    ),

                    // explore
                    DrawerTile(
                      icon: CupertinoIcons.search,
                      title: 'Explore',
                      iconSize: 20,
                    ),

                    // saved items
                    DrawerTile(
                      icon: CupertinoIcons.bookmark,
                      title: 'Saved items',
                      iconSize: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, bottom: 30),
            child: DrawerTile(
              icon: Icons.settings,
              title: 'Settings',
              iconSize: 22,
            ),
          )
        ],
      ),
    );
  }
}
