// custom_appbar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Title text
  final Color backgroundColor; // Background color

  CustomAppBar({required this.title, this.backgroundColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Add your action here
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // Add your action here
          },
        ),
      ],
    );
  }

  // Required for the AppBar's size
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
