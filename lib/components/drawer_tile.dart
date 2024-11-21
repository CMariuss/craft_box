import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: iconSize,
      ),
      title: Text(title),
    );
  }
}
