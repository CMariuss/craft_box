import 'package:craft_box/components/post_container.dart';
import 'package:craft_box/pages/screen_adapt.dart';
import 'package:craft_box/pages/screen_sizes/desktop/desktop_home_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_home_page.dart';
import 'package:craft_box/pages/screen_sizes/tablet/tablet_home_page.dart';
import 'package:craft_box/providers/post_provider.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    PostProvider.generatePostList();
    PostProvider.getUserPosts();
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenAdapt(
      mobileScaffold: MobileHomePage(),
      tabletScaffold: TabletHomePage(),
      desktopScaffold: DesktopHomePage(),
    );
  }
}
