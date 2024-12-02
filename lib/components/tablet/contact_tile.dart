import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String contactName;
  final String profilePicturePath;

  const ContactTile({
    super.key,
    required this.contactName,
    required this.profilePicturePath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      minTileHeight: 10,
      leading: profilePicturePath.isEmpty
          ? Icon(
              Icons.account_circle,
              color: Theme.of(context).colorScheme.tertiary,
            )
          : // profile photo
          CircleAvatar(
              radius: 12,
              backgroundImage: Image.asset(profilePicturePath).image,
            ),
      title: Text(
        contactName,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
