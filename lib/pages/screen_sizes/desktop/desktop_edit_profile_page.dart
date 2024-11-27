import 'package:flutter/material.dart';

class DesktopEditProfilePage extends StatefulWidget {
  const DesktopEditProfilePage({super.key});

  @override
  State<DesktopEditProfilePage> createState() => _DesktopEditProfilePageState();
}

class _DesktopEditProfilePageState extends State<DesktopEditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desktop Edit Profile'),
      ),
    );
  }
}
