import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class AdvancedTile {
  final String title;
  final IconData icon;
  final List<AdvancedTile> tiles;
  bool isExpanded;

  AdvancedTile({
    @required this.title,
    this.icon,
    this.tiles = const [],
    this.isExpanded = false,
  });
}
