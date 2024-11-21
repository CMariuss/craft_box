import 'package:craft_box/components/social_media_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          //if the profile belongs to the current user then display log out and edit icons
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 10),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
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
                  'Mary Jones',
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.secondary),
                ),

                const SizedBox(height: 20),

                // profile description
                Text(
                  'Profile description, a text that describe the person',
                  style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.secondary),
                ),

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
                          size: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        ),

                        const SizedBox(width: 5),

                        // location name
                        Text(
                          'France',
                          style: TextStyle(
                            fontSize: 12,
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
                          size: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        ),

                        const SizedBox(width: 5),

                        // location name
                        Text(
                          'French, English',
                          style: TextStyle(
                            fontSize: 12,
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
                            CupertinoIcons.chat_bubble,
                            size: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),

                          const SizedBox(width: 10),

                          // text
                          Text(
                            'Message',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // social media list (facebook, x, instagram)
                    SocialMediaBox(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Image(
                        width: 25,
                        color: Colors.white,
                        image: Image.asset(
                          'icons/profile/facebook_icon.png',
                          // color: Colors.white,
                        ).image,
                      ),
                    ),

                    const SizedBox(width: 10),

                    SocialMediaBox(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Image(
                        width: 25,
                        color: Colors.white,
                        image: Image.asset(
                          'icons/profile/instagram_icon.png',
                          // color: Colors.white,
                        ).image,
                      ),
                    ),
                  ],
                )

                // posts
              ],
            )
          ],
        ),
      ),
    );
  }
}
