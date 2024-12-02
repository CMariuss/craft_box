import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String contactName;

  const ContactTile({
    super.key,
    required this.contactName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      minTileHeight: 10,
      leading: Icon(
        Icons.account_circle,
        color: Theme.of(context).colorScheme.tertiary,
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
