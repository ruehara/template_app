import 'package:flutter/material.dart';

enum FeatureCategory {
  dados,
  rede,
  hardware,
  midia,
  ui,
}

class FeatureItem {
  const FeatureItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.category,
    required this.routeName,
    this.available = true,
    this.color,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final FeatureCategory category;
  final String routeName;
  final bool available;
  final Color? color;
}
