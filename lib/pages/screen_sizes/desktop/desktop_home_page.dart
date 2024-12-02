import 'package:craft_box/components/desktop/desktop_drawer.dart';
import 'package:craft_box/components/desktop/desktop_home_app_bar.dart';
import 'package:craft_box/components/desktop/desktop_post_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/tablet/contact_tile.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  final appBarTextController = TextEditingController();
  final double postWidth = 650;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopHomeAppBar(
        controller: appBarTextController,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_outlined,
              size: 22,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.add,
              size: 24,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const SizedBox(width: 20),
        ],
        onBoxPressed: () {},
      ),
      body: Row(
        children: [
          // visible drawer
          const Expanded(
            flex: 1,
            child: DesktopDrawer(),
          ),

          // the content in the middle
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 30),

                  // first post
                  DesktopPostContainer(
                    userName: 'Mary Johns',
                    imagePath: 'images/crocheted_pillow.jpg',
                    profilePhoto: 'images/profile/profile_01.jpg',
                    postTitle: 'Crocheted pillow',
                    postDescription: 'Handmade crocheted pillow',
                    postDateTime: 'Today, 10:46',
                    isUserPost: true,
                    hasLike: true,
                    postWidth: postWidth,
                  ),

                  const SizedBox(height: 30),

                  // second post
                  DesktopPostContainer(
                    userName: 'John Britton',
                    imagePath: 'images/first_post_wood.jpg',
                    profilePhoto: 'images/profile/profile_02.jpg',
                    postTitle: 'Wooden kitchen',
                    postDescription: 'Handmade wooden kitchen tools',
                    postDateTime: 'Today, 10:30',
                    isUserPost: false,
                    hasLike: false,
                    postWidth: postWidth,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // the contacts in the right side
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                const SizedBox(height: 15),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.person_2,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  title: Text(
                    'Contacts',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const ContactTile(contactName: 'Anna Glow'),
                const ContactTile(contactName: 'Jim Smith'),
                const ContactTile(contactName: 'Josephine Elliot'),
                const ContactTile(contactName: 'Timothy White'),
                const ContactTile(contactName: 'Clara Peterson'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
