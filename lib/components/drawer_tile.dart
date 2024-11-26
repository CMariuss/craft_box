import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final Function()? onTap;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.iconSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ListTile(
        onTap: onTap,
        // leading: Icon(
        //   icon,
        //   size: iconSize,
        //   color: Theme.of(context).colorScheme.tertiary,
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // icon
            Icon(
              icon,
              size: iconSize,
              color: Theme.of(context).colorScheme.tertiary,
            ),

            const SizedBox(width: 15),

            // title
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
