import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopPostContainer extends StatelessWidget {
  final String userName;
  final String imagePath;
  final String profilePhoto;
  final String postTitle;
  final String postDescription;
  final String postDateTime;
  final bool isUserPost;
  final bool hasLike;

  const DesktopPostContainer({
    super.key,
    required this.userName,
    required this.imagePath,
    required this.profilePhoto,
    required this.postTitle,
    required this.postDescription,
    required this.postDateTime,
    required this.isUserPost,
    required this.hasLike,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // post author
          SizedBox(
            width: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // author details
                Row(
                  children: [
                    // profile photo
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: Image.asset(profilePhoto).image,
                    ),

                    const SizedBox(width: 10),

                    // user name
                    Text(
                      userName,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),

                // options icons
                // edit, delete icons - if the user is the author of the current post
                GestureDetector(
                  child: Icon(
                    isUserPost ? Icons.more_horiz : CupertinoIcons.bookmark,
                    size: isUserPost ? 25 : 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),

          const SizedBox(height: 10),

          // post media
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 600,
            ),
          ),

          const SizedBox(height: 20),

          // post description
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // description title
              Text(
                postTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),

              // description content
              Text(
                postDescription,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // post actions
          SizedBox(
            width: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // like icon
                    Icon(
                      hasLike
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: hasLike
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context).colorScheme.secondary,
                    ),

                    const SizedBox(width: 20),

                    // comment icon
                    Icon(
                      CupertinoIcons.text_bubble_fill,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),

                // post date time
                Text(
                  postDateTime,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
