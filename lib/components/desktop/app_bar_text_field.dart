import 'package:flutter/material.dart';

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: 'search . .',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
