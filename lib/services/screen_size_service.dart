import 'package:flutter/material.dart';

class ScreenSizeService {
  // get a particular screen based o screen size
  static Widget getScreen(List<Widget> screens) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return screens[0];
        } else if (constraints.maxWidth < 1100) {
          return screens[1];
        } else {
          return screens[2];
        }
      },
    );
  }
}
