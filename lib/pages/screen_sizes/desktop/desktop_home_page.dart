import 'package:craft_box/components/desktop/desktop_drawer.dart';
import 'package:craft_box/components/desktop/desktop_home_app_bar.dart';
import 'package:craft_box/components/desktop/desktop_post_container.dart';
import 'package:craft_box/providers/post_provider.dart';
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
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: PostProvider.postList.length,
                itemBuilder: (context, index) {
                  final post = PostProvider.postList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: DesktopPostContainer(
                      userName: post.userName,
                      imagePath: post.postMediaPath,
                      profilePhoto: post.profilePicturePath,
                      postTitle: post.postTitle,
                      postDescription: post.postDescription,
                      postDateTime: post.postDateTime,
                      isUserPost: post.isUserPost,
                      hasLike: post.hasLike,
                      postWidth: postWidth,
                    ),
                  );
                },
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
                const ContactTile(
                  contactName: 'Anna Glow',
                  profilePicturePath: '',
                ),
                const ContactTile(
                  contactName: 'Mary Jones',
                  profilePicturePath: 'images/profile/profile_01.jpg',
                ),
                const ContactTile(
                  contactName: 'Josephine Elliot',
                  profilePicturePath: '',
                ),
                const ContactTile(
                  contactName: 'Timothy White',
                  profilePicturePath: '',
                ),
                const ContactTile(
                  contactName: 'Clara Peterson',
                  profilePicturePath: '',
                ),
                const ContactTile(
                  contactName: 'John Britton',
                  profilePicturePath: 'images/profile/profile_02.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
