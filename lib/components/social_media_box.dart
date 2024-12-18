import 'package:flutter/material.dart';

class SocialMediaBox extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const SocialMediaBox({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
