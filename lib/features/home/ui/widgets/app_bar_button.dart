import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key, required this.onTap, required this.icons});
  final VoidCallback onTap;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey.shade200,
        child: Icon(icons, color: Colors.grey, size: 22),
      ),
    );
  }
}
