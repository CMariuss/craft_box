import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Theme.of(context).colorScheme.secondary,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: IconButton(
          icon: const Icon(
            CupertinoIcons.cube,
            size: 26,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.search,
            size: 20,
          ),
        ),
        const SizedBox(width: 5),
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.add,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
