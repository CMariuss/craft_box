import 'package:craft_box/components/bottom_button.dart';
import 'package:craft_box/components/desktop/app_bar_text_field.dart';
import 'package:flutter/material.dart';

class MobileEditProfilePage extends StatefulWidget {
  final TextEditingController controller;
  final Function()? onSaveTap;

  const MobileEditProfilePage({
    super.key,
    required this.controller,
    required this.onSaveTap,
  });

  @override
  State<MobileEditProfilePage> createState() => _MobileEditProfilePageState();
}

class _MobileEditProfilePageState extends State<MobileEditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // edit profile picture
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Change profile picture'),
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            Image.asset('images/profile/profile_01.jpg').image,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // edit profile bio
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Edit bio text'),
                      const SizedBox(height: 10),
                      AppBarTextField(
                        controller: widget.controller,
                        hintText: 'new bio . .',
                      ),
                    ],
                  ),
                ],
              ),

              // save changes button
              BottomButton(
                text: 'Save changes',
                color: Theme.of(context).colorScheme.tertiary,
                onTap: widget.onSaveTap,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
