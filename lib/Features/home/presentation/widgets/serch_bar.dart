import 'package:flutter/material.dart';
import '../../../../Core/Theme/app_palette.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.search_rounded,
          color: AppPalette.primaryBackgroundColor,
          size: 25, // Reduced the icon size slightly for alignment
        ),
        const SizedBox(width: 10), // Add spacing between icon and text
        Expanded(
          child: TextField(
            style: TextStyle(
              fontSize: 14,
              color: AppPalette.primaryBackgroundColor,
            ),
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(
                fontSize: 14,
                color: AppPalette.primaryBackgroundColor,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(bottom: 4),
            ),
          ),
        )

      ],
    );
  }
}
