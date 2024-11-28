import 'package:craft_box/components/desktop/desktop_post_container.dart';
import 'package:craft_box/components/social_media_box.dart';
import 'package:craft_box/features/presentation/cubits/auth_cubit.dart';
import 'package:craft_box/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/post_container.dart';

class TabletProfilePage extends StatefulWidget {
  const TabletProfilePage({super.key});

  @override
  State<TabletProfilePage> createState() => _TabletProfilePageState();
}

class _TabletProfilePageState extends State<TabletProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          //if the profile belongs to the current user then display log out and edit icons
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthPage(),
                ),
              );
            },
            icon: const Icon(Icons.logout_rounded),
          ),
          const SizedBox(width: 8),

          IconButton(
            onPressed: () {},
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
        child: Row(
          children: [
            const SizedBox(height: 30),

            // user information
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // profile description - bio
                    Text(
                      textAlign: TextAlign.center,
                      'Crocheting is what I love to do',
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.secondary),
                    ),

                    const SizedBox(height: 20),

                    // user details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // location
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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

                        const SizedBox(height: 5),

                        // spoken languages
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // message
                        SocialMediaBox(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                width: 22,
                                color: Theme.of(context).colorScheme.secondary,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                width: 22,
                                color: Theme.of(context).colorScheme.secondary,
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
                    ),
                  ],
                ),
              ),
            ),

            // post list on right side
            Expanded(
              flex: 2,
              child: ListView(
                shrinkWrap: true,
                children: const [
                  // posts
                  DesktopPostContainer(
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

                  SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
