import 'package:craft_box/components/desktop/app_bar_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Theme.of(context).colorScheme.secondary,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
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
      title: const SizedBox(
        width: 300,
        height: 40,
        child: AppBarTextField(),
      ),
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
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
