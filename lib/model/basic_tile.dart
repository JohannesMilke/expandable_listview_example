import 'package:meta/meta.dart';

class BasicTile {
  final String title;
  final List<BasicTile> tiles;

  const BasicTile({
    @required this.title,
    this.tiles = const [],
  });
}
