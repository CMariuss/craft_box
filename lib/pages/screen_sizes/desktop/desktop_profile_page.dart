import 'package:craft_box/components/desktop/desktop_home_app_bar.dart';
import 'package:craft_box/components/desktop/desktop_post_container.dart';
import 'package:craft_box/components/social_media_box.dart';
import 'package:craft_box/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopProfilePage extends StatefulWidget {
  const DesktopProfilePage({super.key});

  @override
  State<DesktopProfilePage> createState() => _DesktopProfilePageState();
}

class _DesktopProfilePageState extends State<DesktopProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopHomeAppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.add,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_outlined,
              size: 22,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_outlined,
              size: 20,
            ),
          ),
          const SizedBox(width: 20),
        ],
        onBoxPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                const SizedBox(height: 50),

                SizedBox(
                  width: 800,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // profile picture and details
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // profile picture
                          CircleAvatar(
                            radius: 100,
                            backgroundImage:
                                Image.asset('images/profile/profile_01.jpg')
                                    .image,
                          ),

                          const SizedBox(width: 30),
                          // profile details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // profile name
                              Text(
                                'Mary Johns',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),

                              const SizedBox(height: 15),

                              // profile description - bio
                              Text(
                                textAlign: TextAlign.center,
                                'Crocheting is what I love to do',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),

                              const SizedBox(height: 10),

                              // details
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // location
                                  Row(
                                    children: [
                                      // location icon
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),

                                      const SizedBox(width: 5),

                                      // location name
                                      Text(
                                        'France',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  // spoken languages
                                  Row(
                                    children: [
                                      // location icon
                                      Icon(
                                        Icons.language,
                                        size: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),

                                      const SizedBox(width: 5),

                                      // location name
                                      Text(
                                        'French, English',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      // contacts
                      Column(
                        children: [
                          // message
                          SocialMediaBox(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                // message icon
                                Icon(
                                  Icons.chat_outlined,
                                  size: 18,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),

                                const SizedBox(width: 10),

                                // text
                                Text(
                                  'Message',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          // facebook
                          SocialMediaBox(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Row(
                              children: [
                                Image(
                                  width: 22,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  image: Image.asset(
                                    'icons/profile/facebook_icon.png',
                                    // color: Colors.white,
                                  ).image,
                                ),

                                const SizedBox(width: 10),

                                // text
                                Text(
                                  'Facebook',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          // instagram
                          SocialMediaBox(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Row(
                              children: [
                                Image(
                                  width: 22,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  image: Image.asset(
                                    'icons/profile/instagram_icon.png',
                                    // color: Colors.white,
                                  ).image,
                                ),

                                const SizedBox(width: 10),

                                // text
                                Text(
                                  'Instagram',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 80),

                // posts
                const DesktopPostContainer(
                  userName: 'Mary Johns',
                  imagePath: 'images/crocheted_pillow.jpg',
                  profilePhoto: 'images/profile/profile_01.jpg',
                  postTitle: 'Crocheted pillow',
                  postDescription: 'Handmade crocheted pillow',
                  postDateTime: 'Today, 10:46',
                  isUserPost: true,
                  hasLike: true,
                  postWidth: 800,
                ),

                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
