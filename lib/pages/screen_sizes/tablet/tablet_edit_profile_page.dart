import 'package:flutter/material.dart';

class TabletEditProfilePage extends StatefulWidget {
  const TabletEditProfilePage({super.key});

  @override
  State<TabletEditProfilePage> createState() => _TabletEditProfilePageState();
}

class _TabletEditProfilePageState extends State<TabletEditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablet Edit Profile'),
      ),
    );
    ;
  }
}
