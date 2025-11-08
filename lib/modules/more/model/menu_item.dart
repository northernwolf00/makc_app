import 'package:flutter/material.dart';

class MenuItem {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool showBadge;
  final Color? iconColor;

  MenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.showBadge = false,
    this.iconColor,
  });
}