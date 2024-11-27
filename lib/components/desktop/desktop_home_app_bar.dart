import 'package:craft_box/components/desktop/app_bar_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Function()? onBoxPressed;

  const DesktopHomeAppBar({
    super.key,
    required this.actions,
    required this.onBoxPressed,
  });

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
          onPressed: onBoxPressed,
        ),
      ),
      title: const SizedBox(
        width: 300,
        height: 40,
        child: AppBarTextField(
          hintText: 'search . .',
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
