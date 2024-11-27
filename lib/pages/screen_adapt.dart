import 'package:flutter/material.dart';

class ScreenAdapt extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  const ScreenAdapt({
    super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileScaffold;
        } else if (constraints.maxWidth < 1100) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
    ;
  }
}
