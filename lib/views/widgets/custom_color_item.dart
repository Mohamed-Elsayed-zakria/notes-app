import 'package:flutter/material.dart';

class CustomColorItem extends StatelessWidget {
  final bool isActive;
  final Color color;
  const CustomColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: CircleAvatar(
        backgroundColor: isActive ? Colors.white : color,
        radius: 32,
        child: CircleAvatar(
          backgroundColor: color,
          radius: 29,
        ),
      ),
    );
  }
}
