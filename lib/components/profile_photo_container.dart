import 'package:flutter/material.dart';

class ProfilePhotoContainer extends StatelessWidget {
  final String imagePath;

  const ProfilePhotoContainer({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(
        imagePath,
        width: 30,
      ),
    );
  }
}
