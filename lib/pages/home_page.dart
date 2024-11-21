import 'package:craft_box/components/custom_app_bar.dart';
import 'package:craft_box/components/custom_drawer.dart';
import 'package:craft_box/components/post_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              userName: 'Petrea Florenta',
              imagePath: 'images/crocheted_pillow.jpg',
              postTitle: 'Crocheted pillow',
              postDescription: 'Handmade crocheted pillow',
              postDateTime: 'Today, 10:46',
              isUserPost: false,
              hasLike: true,
            ),

            SizedBox(height: 30),

            // second post
            PostContainer(
              userName: 'Crintea Marius',
              imagePath: 'images/first_post_wood.jpg',
              postTitle: 'Wooden kitchen',
              postDescription: 'Handmade wooden kitchen tools',
              postDateTime: 'Today, 10:30',
              isUserPost: true,
              hasLike: false,
            ),
          ],
        ),
      ),
    );
  }
}
