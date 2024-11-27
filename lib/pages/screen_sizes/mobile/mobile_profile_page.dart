import 'package:craft_box/components/social_media_box.dart';
import 'package:craft_box/features/domain/entities/app_user.dart';
import 'package:craft_box/features/profile/domain/entities/profile_user.dart';
import 'package:flutter/material.dart';

import '../../../components/post_container.dart';

class MobileProfilePage extends StatefulWidget {
  final ProfileUser? user;
  final Function()? onEditPressed;

  const MobileProfilePage({
    super.key,
    required this.user,
    required this.onEditPressed,
  });

  @override
  State<MobileProfilePage> createState() => _MobileProfilePageState();
}

class _MobileProfilePageState extends State<MobileProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          IconButton(
            onPressed: widget.onEditPressed,
            icon: Icon(
              Icons.edit_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                const SizedBox(height: 30),

                // profile photo
                CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      Image.asset('images/profile/profile_01.jpg').image,
                ),

                const SizedBox(height: 20),

                // profile name
                Text(
                  widget.user!.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                widget.user!.bio != ''
                    ? Column(
                        children: [
                          const SizedBox(height: 25),

                          // profile description
                          Text(
                            textAlign: TextAlign.center,
                            widget.user!.bio,
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ],
                      )
                    : const SizedBox(),

                const SizedBox(height: 20),

                // details
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // location
                    Row(
                      children: [
                        // location icon
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),

                        const SizedBox(width: 5),

                        // location name
                        Text(
                          'France',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 20),

                    // spoken languages
                    Row(
                      children: [
                        // location icon
                        Icon(
                          Icons.language,
                          size: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),

                        const SizedBox(width: 5),

                        // location name
                        Text(
                          'French, English',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // contacts
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // message
                    SocialMediaBox(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          // message icon
                          Icon(
                            Icons.chat_outlined,
                            size: 18,
                            color: Theme.of(context).colorScheme.secondary,
                          ),

                          const SizedBox(width: 10),

                          // text
                          Text(
                            'Message',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // social media list (facebook, x, instagram)
                    SocialMediaBox(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Image(
                        width: 22,
                        color: Theme.of(context).colorScheme.secondary,
                        image: Image.asset(
                          'icons/profile/facebook_icon.png',
                          // color: Colors.white,
                        ).image,
                      ),
                    ),

                    const SizedBox(width: 10),

                    SocialMediaBox(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Image(
                        width: 22,
                        color: Theme.of(context).colorScheme.secondary,
                        image: Image.asset(
                          'icons/profile/instagram_icon.png',
                          // color: Colors.white,
                        ).image,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // posts
                const PostContainer(
                  userName: 'Mary Johns',
                  imagePath: 'images/crocheted_pillow.jpg',
                  profilePhoto: 'images/profile/profile_01.jpg',
                  postTitle: 'Crocheted pillow',
                  postDescription: 'Handmade crocheted pillow',
                  postDateTime: 'Today, 10:46',
                  isUserPost: true,
                  hasLike: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
