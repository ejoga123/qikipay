import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;

  const InfoChip({
    super.key,
    required this.label,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.white,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon != null ? Icon(icon, size: 16, color: textColor) : null,
      label: Text(
        label,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      labelStyle: const TextStyle(fontSize: 12),
    );
  }
}
