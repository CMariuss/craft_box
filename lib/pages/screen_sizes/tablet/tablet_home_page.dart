import 'package:craft_box/components/custom_app_bar.dart';
import 'package:craft_box/components/custom_drawer.dart';
import 'package:craft_box/components/desktop/desktop_post_container.dart';
import 'package:craft_box/components/tablet/contact_tile.dart';
import 'package:craft_box/providers/post_provider.dart';
import 'package:flutter/material.dart';

class TabletHomePage extends StatefulWidget {
  const TabletHomePage({super.key});

  @override
  State<TabletHomePage> createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // contacts list
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'Contacts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ContactTile(
                      contactName: 'Anna Glow',
                      profilePicturePath: '',
                    ),
                    const ContactTile(
                      contactName: 'Mary Jones',
                      profilePicturePath:
                          'assets/images/profile/profile_01.jpg',
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
                      profilePicturePath:
                          'assets/images/profile/profile_02.jpg',
                    ),
                  ],
                ),
              ),

              // post list on right side
              Expanded(
                flex: 2,
                child: ListView.builder(
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
                        postWidth: 500,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
