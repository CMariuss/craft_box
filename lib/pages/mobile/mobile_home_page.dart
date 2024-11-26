import 'package:craft_box/components/custom_app_bar.dart';
import 'package:craft_box/components/custom_drawer.dart';
import 'package:craft_box/components/post_container.dart';
import 'package:flutter/material.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: const [
            SizedBox(height: 15),

            // first post
            PostContainer(
              userName: 'Mary Johns',
              imagePath: 'images/crocheted_pillow.jpg',
              profilePhoto: 'images/profile/profile_01.jpg',
              postTitle: 'Crocheted pillow',
              postDescription: 'Handmade crocheted pillow',
              postDateTime: 'Today, 10:46',
              isUserPost: true,
              hasLike: true,
            ),

            SizedBox(height: 30),

            // second post
            PostContainer(
              userName: 'John Britton',
              imagePath: 'images/first_post_wood.jpg',
              profilePhoto: 'images/profile/profile_02.jpg',
              postTitle: 'Wooden kitchen',
              postDescription: 'Handmade wooden kitchen tools',
              postDateTime: 'Today, 10:30',
              isUserPost: false,
              hasLike: false,
            ),
          ],
        ),
      ),
    );
  }
}
