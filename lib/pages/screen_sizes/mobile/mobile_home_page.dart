import 'package:craft_box/components/custom_app_bar.dart';
import 'package:craft_box/components/custom_drawer.dart';
import 'package:craft_box/components/post_container.dart';
import 'package:craft_box/providers/post_provider.dart';
import 'package:flutter/material.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final postList = PostProvider.postList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (context, index) {
            final post = postList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: PostContainer(
                userName: post.userName,
                imagePath: post.postMediaPath,
                profilePhoto: post.profilePicturePath,
                postTitle: post.postTitle,
                postDescription: post.postDescription,
                postDateTime: post.postDateTime,
                isUserPost: post.isUserPost,
                hasLike: post.hasLike,
              ),
            );
          },
        ),
      ),
    );
  }
}
